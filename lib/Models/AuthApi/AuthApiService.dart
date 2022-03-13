import 'package:http/http.dart' as http;

import 'dart:convert';

class AuthApiServices {
  Future<User> apiCallLogin(Map<String, dynamic> param) async {
    print(param);
    var url = Uri.parse(
        "https://portal.letsride.today/api/v1/restaurant/login-signup");
    var response = await http.post(url, body: param);
    print(jsonDecode(response.body));
    print('');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      var userdata = data['data'];

      var udata = userdata['user'];
      print(udata['api_token']);
      var name;
      var email;
      var errors;

      if (udata['name'] == null ||
          udata['email'] == null && udata['errors'] == null) {
        name = ' ';
        email = ' ';
        errors = ' ';
      } else {
        name = udata['name'];
        email = udata['email'];
        errors = udata['errors'];
      }

      return User(
        apitoken: udata['api_token'],
        error: errors,
        // alsoRider: udata['also_rider'],
        profileImage: udata['profile_img'],
        email: email,
        name: name,
        phoneNumber: udata['phone_number'],
        isLogin: "true",
      );
    } else {
      return User(error: "Error Occured");
    }
  }
}

class LoginApiResponse {
  // final String? token;
  late User? user;
  // final String? error;
  LoginApiResponse({
    this.user,
  });
}

class User {
  String? apitoken;
  String? error;
  String? phoneNumber;
  String? profileImage;
  // int? alsoRider;
  String? email;
  String? name;
  String? isLogin;
  User(
      {this.apitoken,
      this.error,
      this.name,
      this.email,
      this.phoneNumber,
      this.profileImage,
      this.isLogin});
}
