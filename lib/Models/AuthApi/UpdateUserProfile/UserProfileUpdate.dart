import 'package:http/http.dart' as http;

import 'dart:convert';

class UpdateUserProfile {
  Future<String?> uploadImage(filename, url) async {
    var stream = new http.ByteStream(filename.openRead());
    stream.cast();
    // print(stream);

    var length = await filename.length();

    var uri = Uri.parse(url);
    // print(uri);

    // send request to server

    var request = new http.MultipartRequest('POST', uri);

    request.fields['type'] = 'profile_img';

    var multipart = new http.MultipartFile("image", stream, length);

    request.files.add(multipart);
    // print(request);
    var response = await request.send();

    if (response.statusCode == 200) {
      print("Image Uploaded Successfully");

      return "Image_Uploaded";
    } else {
      print("Image Uploading Failed");
      return "Failed";
    }

    // String fName = filename.path.split('/').last;
    // var request = http.MultipartRequest('POST', Uri.parse(url));
    // request.files.add(await http.MultipartFile.fromPath('profile_img', fName));
    // var res = await request.send();
    // print(res);
    // return res.reasonPhrase;
  }

  Future<UserUpdateData> apiCallUserUpdate(Map<String, dynamic> param) async {
    var _list = param.values.toList();
    print(
        "https://portal.letsride.today/api/v1/restaurant/update-profile?api_token=/$_list.first");
    print({"name": _list[1], "email": _list[2]});
    String link = _list.first;

    // String bodyData = json.encode(param);
    var url = Uri.parse(
        "https://portal.letsride.today/api/v1/restaurant/update-profile?api_token=$link");
    var response = await http.post(url, body: {
      'name': _list[1],
      'email': _list[2],
    });
    var afterUpdate = jsonDecode(response.body);
    print(jsonDecode(response.body));
    var userData = afterUpdate['data'];
    print(userData['restaurant']);
    var user = userData['restaurant'];
    print(user['name']);

    return UserUpdateData(
        code: afterUpdate['code'],
        message: afterUpdate['message'],
        name: user['name'],
        profileImg: user['profile_img']);
  }
}

class UserUpdateData {
  // String? email;
  String? name;
  String? message;
  int? code;
  String? profileImg;
  // String? apitoken;
  UserUpdateData({
    // this.apitoken,
    this.message,
    this.name,
    // this.email,
    this.code,
    // this.phoneNumber,
    this.profileImg,
    // this.alsoRider
  });
}
