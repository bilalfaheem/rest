import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:restaurant_app/Model/order_history_api/categories_api/categories_api.dart';
import 'package:restaurant_app/Models/AddProduct/addImage.dart';
import 'package:restaurant_app/Models/AddProduct/addProductInfo.dart';
import 'package:restaurant_app/Theme/Theme.dart';
import 'package:restaurant_app/utills/Displaywidth.dart';
import 'package:restaurant_app/utills/customtextbutton.dart';
import 'package:restaurant_app/views/pages/category/Categories_Functions.dart';
import 'package:restaurant_app/views/pages/category/categoryPage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// Initial Selected Value
String dropdownvalue_initial = Categories_Api_dropdown_List[0].toString();

class SubCategoryInfo extends StatefulWidget {
  const SubCategoryInfo({Key? key}) : super(key: key);

  @override
  _SubCategoryInfoState createState() => _SubCategoryInfoState();
}

class _SubCategoryInfoState extends State<SubCategoryInfo> {
  File? _image;
  String? profileImage;

  bool isbuttonactive = false;
  bool isbuttonactive1 = false;
  bool isbuttonactive2 = false;
  bool isbuttonactive3 = false;
  bool showSpinner = false;

  @override
  void initState() {
    super.initState();

    //controller = TextEditingController();
    productName.addListener(() {
      final isbuttonactive = productName.text.isNotEmpty;
      setState(() => this.isbuttonactive = isbuttonactive);
    });
    shortDisc.addListener(() {
      final isbuttonactive1 = shortDisc.text.isNotEmpty;
      setState(() => this.isbuttonactive1 = isbuttonactive1);
    });
    orignalPrice.addListener(() {
      final isbuttonactive2 = orignalPrice.text.isNotEmpty;
      setState(() => this.isbuttonactive2 = isbuttonactive2);
    });
    longDisc.addListener(() {
      final isbuttonactive3 = longDisc.text.isNotEmpty;
      setState(() => this.isbuttonactive3 = isbuttonactive3);
    });
  }

  @override
  void dispose() {
    super.dispose();
    productName.dispose();
    shortDisc.dispose();
    orignalPrice.dispose();
    longDisc.dispose();
  }

  TextEditingController productName = TextEditingController();
  TextEditingController shortDisc = TextEditingController();
  TextEditingController orignalPrice = TextEditingController();
  TextEditingController longDisc = TextEditingController();

  @override
  void dispose1() {
    _showPicker(context);
    didChangeDependencies();
    // dependOnInheritedWidgetOfExactType();
    super.dispose();
  }

  void clear_field() {
    longDisc.clear();
    shortDisc.clear();
    productName.clear();
    orignalPrice.clear();
    dropdownvalue_initial = Categories_Api_dropdown_List.first.toString();
    setState(() {
      _image = null;
    });
  }

  _imageFromCamera() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    // .pickImage(source: ImageSource.camera, imageQuality: 50);

    if (image != null) {
      setState(() {
        _image = File(image.path);
        // Navigator.pop(context);
        print(_image);
      });
    }
  }

  _imageFromGallery() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    // .pickImage(source: ImageSource.camera, imageQuality: 50);

    if (image != null) {
      setState(() {
        _image = File(image.path);
        print(_image!.path);
      });
    }
  }

  void _displaySuccessMotionToast(BuildContext context, message) {
    MotionToast.success(
      title: message,
      titleStyle: TextStyle(fontWeight: FontWeight.bold),
      description: "Updated!",
      descriptionStyle: TextStyle(fontSize: 12),
      layoutOrientation: ORIENTATION.RTL,
      animationType: ANIMATION.FROM_RIGHT,
      position: MOTION_TOAST_POSITION.CENTER,
      width: 300,
    ).show(context);
  }

  void _showPicker(context1) {
    showModalBottomSheet(
        context: context1,
        builder: (BuildContext context) {
          didChangeDependencies();
          return SafeArea(
              child: Wrap(
            children: [
              // GestureDetector(
              //     onTap: () {
              //       Navigator.pop(context);
              //     },
              //     child: Text("Close")),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Gallery"),
                onTap: () {
                  _imageFromGallery();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
                onTap: () {
                  _imageFromCamera();
                  Navigator.pop(context);
                },
              ),
            ],
          ));
        });
  }

//--------------Post Sub-Categories Api-------------//

  void Sub_Categories_Post_Api(id, String name, img, details) async {
    try {
      Response response = await post(
          Uri.parse(
              'https://persecuted-admissio.000webhostapp.com/restaurant/restaurant_api/create_sub_category.php'),
          body: {
            "category_id": id,
            'category_name': name,
            "category_image ": img,
            "category_detail": details
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Post Succesfull');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // get dropdown selected category id

  List<CategoriesApi> get_cat_id_on_name() {
    if (Categories_Api_List.isEmpty) {
      Selected_Category_list.clear();

      return Selected_Category_list;
    } else {
      Selected_Category_list.clear();
      Iterable gett = Categories_Api_List.where((element) =>
          element.categoryName!.contains("$dropdownvalue_initial"));
      gett.forEach((element) {
        Selected_Category_list.add(element);
      });

      return Selected_Category_list;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: displayHeight(context),
          width: displayWidth(context),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/images/Vector.png")),
                    Text("SubCategory Title",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 1)))),
                    GestureDetector(
                        onTap: () {
                          clear_field();
                        },
                        child:
                            Image.asset("assets/images/foodimages/Delete1.png"))
                  ],
                ),
              ),
//upload pic

              Container(
                width: _width / 3,
                height: _height / 5.9,
                // color: Colors.amber,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: GestureDetector(
                        onTap: () => _showPicker(context),
                        child: Center(
                          child: _image != null
                              ? CircleAvatar(
                                  radius: 60.0,
                                  child: ClipRRect(
                                    child: Image.file(
                                      _image!,
                                      height: 130,
                                      width: 130,
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(150.0),
                                  ),
                                )
                              :
                              //  profileImage != null
                              //     ? CircleAvatar(
                              //         radius: 60.0,
                              //         child: ClipRRect(
                              //           child: Image.network(
                              //             profileImage!,
                              //             width: 130,
                              //             height: 130,
                              //             fit: BoxFit.fill,
                              //           ),
                              //           borderRadius:
                              //               BorderRadius.circular(150.0),
                              //         ),
                              //       )
                              CircleAvatar(
                                  radius: 60.0,
                                  child: ClipRRect(
                                    child: Image.asset(
                                      "assets/images/vendor_logo.png",
                                      width: 130,
                                      height: 130,
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(150.0),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 8,
                        // top: displayHeight(context) * 0.243,
                        // right: displayWidth(context) * 0.24,
                        child: GestureDetector(
                          onTap: () {
                            // _displaySuccessMotionToast(context);
                            _showPicker(context);
                          },
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  border: Border.all(
                                    color: Colors.red[500]!,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Image.asset("assets/images/Camera.png")),
                        )),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.04,
                alignment: Alignment.center,
                child: Text(
                  "Upload Product Picture",
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                  )),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SingleChildScrollView(
                child: Container(
                    height: displayHeight(context) * 0.63,
                    width: displayWidth(context) * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Category Name",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 0.4))),
                        ),
                        Center(
                            child: DropdownButton(
                          isExpanded: true,
                          value: dropdownvalue_initial,
                          onChanged: (vale) {
                            dropdownvalue_initial = vale.toString();
                            setState(() {});
                          },
                          items: Categories_Api_dropdown_List.map((itemss) {
                            return DropdownMenuItem(
                                value: itemss, child: Text(itemss));
                          }).toList(),
                        )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.004,
                        ),
                        Text(
                          "Product Name",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 0.4))),
                        ),
                        TextField(
                          controller: productName,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.003,
                        ),
                        Text(
                          "Short Discription",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 0.4))),
                        ),
                        TextField(
                          controller: shortDisc,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.003,
                        ),
                        Text(
                          "Original Price",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 0.4))),
                        ),
                        TextField(
                          controller: orignalPrice,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.003,
                        ),
                        Text(
                          "Description",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 0.4))),
                        ),
                        TextField(
                          controller: longDisc,
                          minLines: 1,
                          maxLines: 6,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed))
                                      return Colors.deepOrangeAccent;
                                    else if (states
                                        .contains(MaterialState.disabled))
                                      return Colors.black54;
                                    return Colors
                                        .black; // Use the component's default.
                                  }),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: Colors.black)))),
                              // buttonName: 'Update Profile',
                              // buttonTextStyle: GoogleFonts.ubuntu(
                              //     textStyle: Constants.loginbuttonstyle()),
                              // buttoncolor: Constants.black_light,
                              // height: _height * 0.078,
                              // width: displayWidth(context) * 0.9,
                              // highlightColor: Constants.black_light,
                              onPressed: isbuttonactive
                                  ? isbuttonactive1
                                      ? isbuttonactive2
                                          ? isbuttonactive3
                                              ? () {
                                                  setState(() =>
                                                      isbuttonactive = true);
                                                  setState(() =>
                                                      isbuttonactive1 = true);
                                                  setState(() =>
                                                      isbuttonactive2 = true);
                                                  setState(() =>
                                                      isbuttonactive3 = true);
                                                  print(dropdownvalue_initial);
                                                  get_cat_id_on_name();
                                                  Sub_Categories_Post_Api(
                                                      Selected_Category_list
                                                          .first.categoryId
                                                          .toString(),
                                                      productName.text
                                                          .toString(),
                                                      _image.toString(),
                                                      shortDisc.text
                                                          .toString());

                                                  Timer(Duration(seconds: 2),
                                                      () => {clear_field()});
                                                  Timer(
                                                      Duration(seconds: 5),
                                                      () => {
                                                            setState(() {
                                                              CategoryPage();
                                                            })
                                                          });
                                                  // Navigator.pop(context);
                                                }
                                              : null
                                          : null
                                      : null
                                  : null,
                              child: Text("Edit"),
                              // final productImage = AddImage();
                              // final productInfo = AddProductInfo();

                              // if (_image!.path.isNotEmpty) {
                              //   String imageFileName = basename(_image!.path);
                              //   productImage
                              //       .uploadImage(_image!,
                              //           "https://portal.letsride.today/api/v1/restaurant/image-uploading?api_token=$apiToken")
                              //       .then((value) {
                              //     if (value == "Image_Uploaded") {
                              //       print(_image);
                              //       productInfo.setProductData({

                              //         // "category_id": dropdownvalue.toString(),
                              //         "name": productName.text,
                              //         "short_desc": shortDisc.text,
                              //         "long_Desc": longDisc.text,
                              //         "price": orignalPrice.text,
                              //         "image": imageFileName,
                              //       }).then((value) {

                              //         _displaySuccessMotionToast(
                              //             context, value.message);
                              //       });
                              //     }
                              //   });

                              //textStyle: TextStyle(),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
