import 'package:http/http.dart' as http;

class AddImage {
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
}
