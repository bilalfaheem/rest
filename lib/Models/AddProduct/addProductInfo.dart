import 'package:http/http.dart' as http;
import 'dart:convert';

class AddProductInfo {
  Future<AddProductData> setProductData(Map<String, dynamic> param) async {
    var _list = param.values.toList();
    String link = _list.first;
    print(_list);
    List<String> l = [_list[6], _list[6]];
    print(l);

// String bodyData = json.encode(param);
    var url = Uri.parse(
        "https://portal.letsride.today/api/v1/restaurant/add-product?api_token=$link");
    var response = await http.post(url, body: {
      'category_id': _list[1],
      'name': _list[2],
      'short_desc': _list[3],
      'detail': _list[4],
      'original_price': _list[5],
      'image': _list[6],
      'images[]': l.toString(),
    });
    var afterUpdate = jsonDecode(response.body);
    print(jsonDecode(response.body));
    // var userData = afterUpdate['data'];
    // print(userData['restaurant']);
    // var user = userData['restaurant'];
    // print(user['name']);

    // print(_list);
    print(afterUpdate['message']);
    return AddProductData(message: afterUpdate['message']);
  }
}

class AddProductData {
  int? categoryid;
  String? productName;
  String? shortDisc;
  String? longDisc;
  double? orignalPrice;
  String? mainProductImage;
  String? message;
  AddProductData(
      {this.categoryid,
      this.productName,
      this.shortDisc,
      this.longDisc,
      this.orignalPrice,
      this.mainProductImage,
      this.message});
}
