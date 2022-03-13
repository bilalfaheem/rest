import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:restaurant_app/Model/order_history_api/categories_api/categories_api.dart';
import 'package:restaurant_app/Model/order_history_api/sub_category_get_api/sub_category_get_api.dart';
import 'package:restaurant_app/views/pages/category/categoryPage.dart';
import 'package:restaurant_app/views/pages/category/uploadsubcategoryinfo.dart';
import 'package:http/http.dart' as http;

// void Selected_Category_Func(iid) {
//   print("ppp");

//   // Obx(() =>
//   CategoryPage Selected_Category_Id = iid;
//   print(iid);
// }


// var Selected_Category_Id = "0";

// //--------------List-------------//

// List<CategoriesApi> Categories_Api_List = [];
// List<SubCategoryGetApi> Sub_Categories_Api_List = [];
// List Categories_Api_dropdown_List = [];

// //--------------Category Api Get-------------//

// Future<List<CategoriesApi>> get_category_api() async {
//   final response = await http.get(Uri.parse(
//       "https://persecuted-admissio.000webhostapp.com/restaurant/restaurant_api/product_cat_list.php"));
//   var data = jsonDecode(response.body.toString());
//   if (response.statusCode == 200) {
//     Categories_Api_List.clear();
//     Categories_Api_dropdown_List.clear();
//     for (Map i in data) {
//       Categories_Api_List.add(CategoriesApi.fromJson(i));
//     }
//     get_cat_name();
//     print(get_cat_name());
//     return Categories_Api_List;
//   } else {
//     return Categories_Api_List;
//   }
// }

//--------------Sub-Category Api Get-------------//

// Future<List<SubCategoryGetApi>> get_sub_category_api() async {
//   final response = await http.get(Uri.parse(
//       "https://persecuted-admissio.000webhostapp.com/restaurant/restaurant_api/product_subcat_list.php"));
//   var data = jsonDecode(response.body.toString());
//   if (response.statusCode == 200) {
//     // Categories_Api_dropdown_List.clear();
//     for (Map i in data) {
//       Sub_Categories_Api_List.add(SubCategoryGetApi.fromJson(i));
//     }

//     return Sub_Categories_Api_List;
//   } else {
//     return Sub_Categories_Api_List;
//   }
// }

// //--------------Sub-Category Api Post-Get(Parameter pass)-------------//

// Future<List<SubCategoryGetApi>> Sub_Category_Fetch_Api(var cat_id) async {
//   try {
//     Response response = await post(
//         Uri.parse(
//             'https://persecuted-admissio.000webhostapp.com/restaurant/restaurant_api/product_subcat_list.php'),
//         body: {"category_id": cat_id});

//     if (response.statusCode == 200) {
//       Sub_Categories_Api_List.clear();
//       var data = jsonDecode(response.body.toString());
//       for (Map i in data) {
//         Sub_Categories_Api_List.add(SubCategoryGetApi.fromJson(i));
//       }
//       print(data);
//       // print(data['token']);
//       print('Post Succesfull');
//       return Sub_Categories_Api_List;
//     } else {
//       print('failed');
//       return Sub_Categories_Api_List;
//     }
//   } catch (e) {
//     print(e.toString());
//     return Sub_Categories_Api_List;
//   }
// }

//--------------Post Sub-Categories Api-------------//

// void Sub_Categories_Post_Api(id, String name, img, details) async {
//   try {
//     Response response = await post(
//         Uri.parse(
//             'https://persecuted-admissio.000webhostapp.com/restaurant/restaurant_api/create_sub_category.php'),
//         body: {
//           "category_id": id,
//           'category_name': name,
//           "category_image ": img,
//           "category_detail": details
//         });

//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body.toString());
//       print(data['token']);
//       print('Post Succesfull');
//     } else {
//       print('failed');
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }

//--------------Post Categories Api-------------//
// void Category_Post_Api(String name, img, cover_img) async {
//   try {
//     Response response = await post(
//         Uri.parse(
//             'https://persecuted-admissio.000webhostapp.com/restaurant/restaurant_api/create_category.php'),
//         body: {
//           "category_name": name,
//           'category_image': img,
//           "category_cover": cover_img,
//         });

//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body.toString());
//       print(data['token']);
//       print('Post Succesfull');
//     } else {
//       print('failed');
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }

// //--------------DropDown List Creator-------------//

// List get_cat_name() {
//   Categories_Api_dropdown_List.clear();
//   if (Categories_Api_List.isEmpty) {
//     return Categories_Api_dropdown_List;
//   } else {
//     Categories_Api_dropdown_List.clear();
//     for (var i = 0; i < Categories_Api_List.length; i++) {
//       Categories_Api_dropdown_List.add(
//           Categories_Api_List[i].categoryName.toString());
//     }

//     return Categories_Api_dropdown_List;
//   }
// }

// // get dropdown selected category id


// List<CategoriesApi> get_cat_id_on_name() {
//   if (Categories_Api_List.isEmpty) {
//     Selected_Category_list.clear();

//     return Selected_Category_list;
//   } else {
//     Selected_Category_list.clear();
//     Iterable gett = Categories_Api_List.where(
//         (element) => element.categoryName!.contains("$dropdownvalue_initial"));
//     gett.forEach((element) {
//       Selected_Category_list.add(element);
//     });

//     return Selected_Category_list;
//   }
// }

// List<OrderHistoryfasApi> get_order_active() {
//   if (order_history_list.isEmpty) {
//     return order_active_main_list;
//   } else {
//     Iterable gettt = order_history_list
//         .where((element) => element.orderStatus!.contains("Active"));
//     gettt.forEach((element) {
//       order_active_main_list.add(element);
//     });

//     return order_active_main_list;
//   }
// }
