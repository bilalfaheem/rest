import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/Model/order_history_api/categories_api/categories_api.dart';
import 'package:restaurant_app/Model/order_history_api/sub_category_get_api/sub_category_get_api.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';

import 'package:restaurant_app/views/pages/category/Sub_Category_tile.dart';
import 'package:restaurant_app/views/pages/category/uploadcategoryinfo.dart';
import 'package:restaurant_app/views/pages/category/uploadsubcategoryinfo.dart';
import 'package:restaurant_app/views/widgets/drawer_widget.dart';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

//--------------List-------------//
List<CategoriesApi> Selected_Category_list = [];
List<CategoriesApi> Categories_Api_List = [];
List<SubCategoryGetApi> Sub_Categories_Api_List = [];
List Categories_Api_dropdown_List = [];

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  GlobalKey<ScaffoldState> _scaffoldKey3 = GlobalKey<ScaffoldState>();
  String caty = "1";
  var Selected_Category_Color = Colors.black;

  // void Selected_Category_Func(iid) {
  //   setState(() {
  //     Selected_Category_Id = iid;
  //   });
  // }

  Selected_Category_Func_Color(String iid) {
    if (caty == iid) {
      Selected_Category_Color = Color.fromARGB(228, 244, 67, 54);
      return Selected_Category_Color;
    } else {
      Selected_Category_Color = Color.fromARGB(171, 0, 0, 0);
    }
  }

  //--------------DropDown List Creator-------------//

  List get_cat_name() {
    Categories_Api_dropdown_List.clear();
    if (Categories_Api_List.isEmpty) {
      return Categories_Api_dropdown_List;
    } else {
      Categories_Api_dropdown_List.clear();
      for (var i = 0; i < Categories_Api_List.length; i++) {
        Categories_Api_dropdown_List.add(
            Categories_Api_List[i].categoryName.toString());
      }

      return Categories_Api_dropdown_List;
    }
  }

  //--------------Category Api Get-------------//

  Future<List<CategoriesApi>> get_category_api() async {
    final response = await http.get(Uri.parse(
        "https://persecuted-admissio.000webhostapp.com/restaurant/restaurant_api/product_cat_list.php"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      Categories_Api_List.clear();
      Categories_Api_dropdown_List.clear();
      for (Map i in data) {
        Categories_Api_List.add(CategoriesApi.fromJson(i));
      }
      get_cat_name();
      print(get_cat_name());
      return Categories_Api_List;
    } else {
      return Categories_Api_List;
    }
  }

  //--------------Sub-Category Api Post-Get(Parameter pass)-------------//

  Future<List<SubCategoryGetApi>> Sub_Category_Fetch_Api(var cat_id) async {
    // try {
    http.Response response = await http.post(
        Uri.parse(
            'https://persecuted-admissio.000webhostapp.com/restaurant/restaurant_api/product_subcat_list.php'),
        body: {"category_id": cat_id});

    if (response.statusCode == 200) {
      Sub_Categories_Api_List.clear();
      var data = jsonDecode(response.body.toString());
      for (Map i in data) {
        Sub_Categories_Api_List.add(SubCategoryGetApi.fromJson(i));
      }
      print(data);
      // print(data['token']);
      print('Post Succesfull');
      return Sub_Categories_Api_List;
    } else {
      Sub_Categories_Api_List.clear();
      print('failed');
      return Sub_Categories_Api_List;
    }
    // } catch (e) {
    //   print(e.toString());
    //   return Sub_Categories_Api_List;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey3,
      drawer: Drawer(
        child: Drawer_widget(context), // drawer widget
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: displayWidth(context),
          margin: EdgeInsets.only(
            top: 40.0,
            right: 0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Image.asset("assets/images/Menu.png"),
                      // icon: Icon(Icons.menu, color: Color(0xFF1f186f),),
                      onPressed: () {
                        _scaffoldKey3.currentState!.openDrawer();
                      }),
                  Text(
                    'Category',
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CategoryInfo()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 30.0,
                      width: 30.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(237, 41, 57, 0.1),
                      ),
                      child: Text(
                        "+",
                        style: TextStyle(color: Colors.red, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              //search bar
              Container(
                margin: EdgeInsets.only(top: 25, left: 10, right: 25),
                height: displayHeight(context) * 0.066,
                width: displayWidth(context) / 1.17,
                decoration: Constants.containerstyle(),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Image.asset("assets/images/Search.png"),
                    suffixIcon: Image.asset("assets/images/Filter.png"),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
// category list
              Container(
                height: 45,
                child: Expanded(
                  child: StreamBuilder(
                      stream: get_category_api().asStream(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text("Something has gone wrong!"));
                        } else if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: Categories_Api_List.length,
                              itemBuilder: (context, index) {
                                Selected_Category_Func_Color(
                                    Categories_Api_List[index]
                                        .categoryId
                                        .toString());
                                return Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: BorderSide(
                                                  color: Colors.transparent))),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Selected_Category_Color),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        caty = Categories_Api_List[index]
                                            .categoryId
                                            .toString();
                                      });
                                      // Selected_Category_Func(cat_id);
                                    },
                                    child: Text(
                                      "${Categories_Api_List[index].categoryName}",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: TextStyle(
                                        color: Colors.white,
                                      )),
                                    ),
                                  ),
                                );
                                //  category_tile(
                                //     context,
                                //     Categories_Api_List[index].categoryName,
                                //     Categories_Api_List[index].categoryId);
                              });
                        } else {
                          return Center(
                            child: Text("something wrong"),
                          );
                        }
                      }),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 7,
                    ),
                    child: Text(
                      'Sub-Category',
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubCategoryInfo()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 30.0,
                      width: 30.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(237, 41, 57, 0.1),
                      ),
                      child: Text(
                        "+",
                        style: TextStyle(color: Colors.red, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),

//------------SubCategory content------------//

              Container(
                  child: FutureBuilder(
                      future: Sub_Category_Fetch_Api(caty),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text("Something has gone wrong!"));
                        } else if (snapshot.hasData) {
                          return GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 2 / 2.5,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              itemCount: Sub_Categories_Api_List.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return Sub_Category_tile(
                                  context,
                                  Sub_Categories_Api_List[index]
                                      .subName
                                      .toString(),
                                  Sub_Categories_Api_List[index].subDetail,
                                );
                              });
                        } else {
                          return Center(child: Text("SomeThing gone wrong"));
                        }
                      })),

//Grid View

              // Container(
              //   // color: Colors.amber,
              //   // height: MediaQuery.of(context).size.height,
              //   child: GridView.builder(
              //       shrinkWrap: true,
              //       physics: NeverScrollableScrollPhysics(),
              //       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              //           maxCrossAxisExtent: 200,
              //           childAspectRatio: 2 / 2.5,
              //           crossAxisSpacing: 20,
              //           mainAxisSpacing: 20),
              //       itemCount: 10,
              //       itemBuilder: (BuildContext ctx, index) {
              //         return Sub_Category_tile2(context);
              //       }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
