import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:management_school/model/activity_model.dart';
import 'package:management_school/model/alarm_model.dart';
import 'package:management_school/model/class_model.dart';
import 'package:management_school/model/dropdown_response.dart';
import 'package:management_school/model/homework_model.dart';
import 'package:management_school/model/login_model.dart';
import 'package:management_school/model/mark_model.dart';
import 'package:management_school/model/payment_model.dart';
import 'package:management_school/model/section_model.dart';
import 'package:management_school/model/subject_model.dart';
import 'package:management_school/model/user_model.dart';
import 'package:management_school/my_cache.dart';
import 'package:http_parser/http_parser.dart';

class ApiHelper {
  final String _baseUrl = "school2021.somee.com";
  final int _requestTimeout = 80;

  Future<LoginModel> login(
      String username, String password, bool rememberMe) async {
    final url = Uri.http(_baseUrl, '/api/Account/Login');
    final headers = <String, String>{};
    headers["Accept"] = "text/plain";
    print("url: $url");
    final response = await http.post(
      url,
      headers: headers,
      body: {
        'userName': username,
        'password': password,
        'rememberMe': "$rememberMe",
      },
    ).timeout(Duration(seconds: _requestTimeout));
    print("response:  ${response.body}");
    var model = loginModelFromJson(response.body);
    if (response.statusCode == 200) {
      MyCache.putString('token', model.data.jwtToken);
      MyCache.putString('id', model.data.id);
      MyCache.putString('username', model.data.userName);
      MyCache.putString('email', model.data.email);
    }
    return model;
  }

  /// user section
  Future<bool> createUser(UserModel user) async {
    final url = Uri.http(_baseUrl, '/api​/Account​/Register');
    var accessToken = await MyCache.getString('token');
    print("url: $url");
    final response = await http
        .post(
          url,
          headers: {'Authorization': 'Bearer $accessToken'},
          body: user.toJson(),
        )
        .timeout(Duration(seconds: _requestTimeout));
    var model = json.decode(response.body);
    return model['succeeded'];
  }

  Future<List<UserModel>> listUsers() async {
    final url = Uri.http(_baseUrl, '/api/Manager/GetUsersList');
    var accessToken = await MyCache.getString('token');
    print("url: $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    ).timeout(Duration(seconds: _requestTimeout));
    var model;
    if (response.body != "") model = userModelFromJson(response.body);
    return model;
  }

  Future<bool> toggleUserStatus(int userId) async {
    final url = Uri.http(
        _baseUrl, '/api/Manager/EnableDisableUser', {'userId': '$userId'});
    var accessToken = await MyCache.getString('token');
    print("url: $url");
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    ).timeout(Duration(seconds: _requestTimeout));
    var model = json.decode(response.body);
    return model['succeeded'];
  }

  Future<bool> resetUserPassword({String email, String newPassword}) async {
    final url = Uri.http(_baseUrl, '/api/Manager/AdminResetPassword');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $accessToken'
    }, body: {
      'email': email,
      'password': newPassword
    }).timeout(Duration(seconds: _requestTimeout));

    var model = json.decode(response.body);
    return model['succeeded'];
  }

  //? class section

  Future<bool> createClass({String name, String fees}) async {
    final url = Uri.http(_baseUrl, '/api/Manager/SaveClass');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $accessToken'
    }, body: {
      'name': name,
      'totalFees': fees
    }).timeout(Duration(seconds: _requestTimeout));

    var model = json.decode(response.body);
    return model['succeeded'];
  }

  //TODO: check for list
  Future<List<ClassModel>> listClasses() async {
    final url = Uri.http(_baseUrl, '/api/Manager/GetClass');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    ).timeout(Duration(seconds: _requestTimeout));

    var model;
    if (response.body != "") model = classModelFromJson(response.body);
    return model;
  }

  //? 'section' section

  Future<bool> createSection(String name, String classId) async {
    final url = Uri.http(_baseUrl, '/api/Manager/SaveSection');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
      body: {"name": name, "classId": classId},
    ).timeout(Duration(seconds: _requestTimeout));

    var model = json.decode(response.body);
    return model['succeeded'];
  }

  Future<List<SectionModel>> listSections() async {
    final url = Uri.http(_baseUrl, '/api/Manager/GetSection');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    ).timeout(Duration(seconds: _requestTimeout));

    var model;
    if (response.body != "") model = sectionModelFromJson(response.body);
    return model;
  }

  Future<bool> addActivityToSubject({secId, actId}) async {
    final url = Uri.http(_baseUrl, '/api/Manager/SaveActivitySection');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $accessToken'
    }, body: {
      "sectionId": secId,
      "actVacId": actId
    }).timeout(Duration(seconds: _requestTimeout));

    var model = json.decode(response.body);
    return model['succeeded'];
  }

  //? subject section

  Future<bool> createSubject(String name) async {
    final url = Uri.http(_baseUrl, '/api/Manager/SaveSub');
    var accessToken = await MyCache.getString('token');
    var currentUserId = await MyCache.getString('id');

    print("url: $url");
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
      body: {'name': name, 'userId': currentUserId},
    ).timeout(Duration(seconds: _requestTimeout));

    var model = json.decode(response.body);
    return model['succeeded'];
  }

  Future<List<SubjectModel>> listSubjects() async {
    final url = Uri.http(_baseUrl, '/api/Manager/GetSub');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    ).timeout(Duration(seconds: _requestTimeout));

    var model;
    if (response.body != "") model = subjectModelFromJson(response.body);
    return model;
  }

  //? activity section
  Future<List<ActivityModel>> listActivity() async {
    final url = Uri.http(_baseUrl, '/api/School/GetActVac');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    ).timeout(Duration(seconds: _requestTimeout));

    return activityModelFromJson(response.body);
  }

  //TODO: Begin Date!!
  Future<bool> createActivity(
      {String description, String typeOf, String endDate}) async {
    final url = Uri.http(_baseUrl, '/api/Manager/SaveActVac');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
      body: {
        'description': description,
        'endDate': endDate,
        'typeOf': typeOf,
      },
    ).timeout(Duration(seconds: _requestTimeout));

    var model = json.decode(response.body);
    return model['succeeded'];
  }

  //? alarms section
  Future<bool> createAlarm(
      {String alarmReason, String studentId, String createdBy}) async {
    final url = Uri.http(_baseUrl, '/api/Teacher/SaveAlarm');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
      body: {
        'alarmReason': alarmReason,
        'studentId': studentId,
        'createdBy': createdBy,
      },
    ).timeout(Duration(seconds: _requestTimeout));

    var model = json.decode(response.body);
    return model['succeeded'];
  }

  Future<List<AlarmModel>> listAlarms() async {
    final url = Uri.http(_baseUrl, '/api/Teacher/GetAlarm');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    ).timeout(Duration(seconds: _requestTimeout));

    var model;
    if (response.body != "") model = alarmModelFromJson(response.body);
    return model;
  }

//? homeworks
  Future<bool> createHomework({
    description,
    endDate,
    sectionId,
    subjectId,
  }) async {
    final url = Uri.http(_baseUrl, '/api/Teacher/SaveHW');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
      body: {
        'description': description,
        'endDate': endDate,
        'sectionId': sectionId,
        'subjectId': subjectId,
      },
    ).timeout(Duration(seconds: _requestTimeout));

    var model = json.decode(response.body);
    return model['succeeded'];
  }

  Future<List<HomeworkModel>> listHomeWorks() async {
    final url = Uri.http(_baseUrl, '/api/Teacher/GetHW');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    ).timeout(Duration(seconds: _requestTimeout));

    var model;
    if (response.body != "") model = homeworkModelFromJson(response.body);
    return model;
  }

  //? marks

  Future<bool> createMark({degree, userId, subId, markTypeId}) async {
    final url = Uri.http(_baseUrl, '/api​/Teacher​/SaveMark');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
      body: {
        'userId': userId,
        'subId': subId,
        'markTypeId': markTypeId,
        'degree': degree,
      },
    ).timeout(Duration(seconds: _requestTimeout));

    var model = json.decode(response.body);
    return model['succeeded'];
  }

  Future<List<MarkModel>> listMarks() async {
    final url = Uri.http(_baseUrl, '/api/Teacher/GetMark');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    ).timeout(Duration(seconds: _requestTimeout));

    var model;
    if (response.body != "") model = markModelFromJson(response.body);
    return model;
  }
  //? payment section

  Future<bool> createPayment({paidFees, userId}) async {
    final url = Uri.http(_baseUrl, '/api/Accountant/SavePyament');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
      body: {'userId': userId, 'paidFees': paidFees},
    ).timeout(Duration(seconds: _requestTimeout));

    var model = json.decode(response.body);
    return model['succeeded'];
  }

  Future<List<PaymentModel>> listPayment() async {
    final url = Uri.http(_baseUrl, '/api/School/GetActVac');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    ).timeout(Duration(seconds: _requestTimeout));

    return paymentModelFromJson(response.body);
  }
  //? attendance section

  Future<bool> createAttendance({studentId, isPresense}) async {
    final url = Uri.http(_baseUrl, '/api​/Teacher​/SavePresenceOf');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
      body: {'studentId': studentId, 'isPresense': isPresense},
    ).timeout(Duration(seconds: _requestTimeout));

    var model = json.decode(response.body);
    return model['succeeded'];
  }

  //? programe section

  Future<bool> createProgramme({name, image, secId}) async {
    Response response;
    final url = Uri.http(_baseUrl, '/api/Manager/SaveProgramme');
    var accessToken = await MyCache.getString('token');

    var byteData = await image.getByteData();
    var imageData = byteData.buffer.asUint8List();

    print("url: $url");
    final request = http.MultipartRequest('POST', url)
      ..files.add(MultipartFile.fromBytes('photo', imageData,
          filename: '$name.jpg', contentType: MediaType('image', 'jpg')))
      ..fields.addAll({'name': name, 'secId': secId})
      ..headers.addAll({'Authorization': 'Bearer $accessToken'});

    final res = await request.send();
    response = await Response.fromStream(res);

    var model = json.decode(response.body);
    return model['succeeded'];
  }

  //? dropDown section

  Future<DropDownResponse> listSubjectDropDown() async {
    final url = Uri.http(_baseUrl, '/api/DropDown/GetSubjects');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    ).timeout(Duration(seconds: _requestTimeout));

    return dropDownResponseFromJson(response.body);
  }

  Future<DropDownResponse> listMarkTypeDropDown() async {
    final url = Uri.http(_baseUrl, '/api/DropDown/GetMarkType');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    ).timeout(Duration(seconds: _requestTimeout));

    return dropDownResponseFromJson(response.body);
  }

  Future<DropDownResponse> listClassesDropDown() async {
    final url = Uri.http(_baseUrl, '/api/DropDown/GetClasses');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    ).timeout(Duration(seconds: _requestTimeout));

    return dropDownResponseFromJson(response.body);
  }

  Future<DropDownResponse> listSectionsDropDown() async {
    final url = Uri.http(_baseUrl, '/api/DropDown/GetSections');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    ).timeout(Duration(seconds: _requestTimeout));

    return dropDownResponseFromJson(response.body);
  }

  Future<DropDownResponse> listStudentsDropDown() async {
    final url = Uri.http(_baseUrl, '/api/DropDown/GetStudents');
    var accessToken = await MyCache.getString('token');

    print("url: $url");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    ).timeout(Duration(seconds: _requestTimeout));

    return dropDownResponseFromJson(response.body);
  }
}
