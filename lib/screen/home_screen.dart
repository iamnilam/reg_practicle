import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:reg_practicle/app_widget_constant/text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownvalue1 = 'number 1';
  String dropdownvalue2 = 'number 2';
  String dropdownvalue3 = 'number 3';
  String dropdownvalue4 = 'number 4';

  File? _image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "A1213 Vertical Measurement",
            style: TextStyle(color: Colors.grey),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_sharp,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.photo_outlined),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Number 1",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 18,
                                color: Colors.black54,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("*Upper point",
                              style: TextStyle(color: Colors.black54)),
                          SizedBox(
                            height: 5,
                          ),
                           EditText(hint: " | Please enter the previous point",),
                          SizedBox(
                            height: 10,
                          ),
                          Text("*Lower point",
                              style: TextStyle(color: Colors.black54)),
                          SizedBox(
                            height: 5,
                          ),
                           EditText(hint: " | Please enter the next point",),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "High differance",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Spacer(),
                              Text(
                                "Xx, xxx(m)",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("*title direction",
                              style: TextStyle(color: Colors.black54)),
                          SizedBox(
                            height: 5,
                          ),
                          PopupMenuButton(
                            color: Theme.of(context).canvasColor,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${dropdownvalue4}",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_drop_down_sharp,
                                      color: Theme.of(context).iconTheme.color),
                                ],
                              ),
                            ),
                            itemBuilder: (context) => List.generate(
                              number4.length,
                                  (index) => PopupMenuItem(
                                onTap: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  setState(() {
                                    dropdownvalue4 = number4[index];
                                  });
                                },
                                child: Text(
                                  number4[index],
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("*Left point",
                              style: TextStyle(color: Colors.black54)),
                          SizedBox(
                            height: 5,
                          ),
                           EditText(hint: " | Please select the left point",),
                          SizedBox(
                            height: 10,
                          ),
                          Text("*Right point",
                              style: TextStyle(color: Colors.black54)),
                          SizedBox(
                            height: 5,
                          ),
                           EditText(hint: " | Please select the right point",),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text("Tilt value",
                                  style: TextStyle(color: Colors.black54)),
                              Spacer(),
                              Text("Xx(cm)")
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text("Slope",
                                  style: TextStyle(color: Colors.black54)),
                              Spacer(),
                              Text("1/XXX",
                                  style: TextStyle(color: Colors.black54)),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Diagram",
                              style: TextStyle(color: Colors.black54)),
                          SizedBox(
                            height: 100,
                          ),
                          Text("Technical description",
                              style: TextStyle(color: Colors.black54)),
                          SizedBox(
                            height: 5,
                          ),
                          EditText(hint: "Please enter the supplemenatry description",),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.white),
                            child: Stack(
                              children: [
                                _image != null
                                    ? Image.file(_image!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity)
                                    : Center(
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("upload photo",
                                          style: TextStyle(
                                              color: Colors.black54)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        size: 30,
                                        color: Colors.black12,
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 320,
                                  child: _image != null
                                      ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _image = null;
                                      });
                                    },
                                    icon: Icon(Icons.delete_sharp,
                                        color: Colors.black54),
                                  )
                                      : SizedBox.shrink(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PopupMenuButton(
                      color: Theme.of(context).canvasColor,
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${dropdownvalue1}",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_drop_down_sharp,
                                color: Theme.of(context).iconTheme.color),
                          ],
                        ),
                      ),
                      itemBuilder: (context) => List.generate(
                        number1.length,
                            (index) => PopupMenuItem(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            setState(() {
                              dropdownvalue1 = number1[index];
                            });
                          },
                          child: Text(
                            number1[index],
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PopupMenuButton(
                      color: Theme.of(context).canvasColor,
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${dropdownvalue2}",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_drop_down_sharp,
                                color: Theme.of(context).iconTheme.color),
                          ],
                        ),
                      ),
                      itemBuilder: (context) => List.generate(
                        number2.length,
                            (index) => PopupMenuItem(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            setState(() {
                              dropdownvalue2 = number2[index];
                            });
                          },
                          child: Text(
                            number2[index],
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PopupMenuButton(
                      color: Theme.of(context).canvasColor,
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${dropdownvalue3}",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_drop_down_sharp,
                                color: Theme.of(context).iconTheme.color),
                          ],
                        ),
                      ),
                      itemBuilder: (context) => List.generate(
                        number3.length,
                            (index) => PopupMenuItem(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            setState(() {
                              dropdownvalue3 = number3[index];
                            });
                          },
                          child: Text(
                            number3[index],
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add,
                            size: 15,
                          ),
                          Text(
                            "New measuring point number",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   style: ButtonStyle(
                    //     elevation: MaterialStatePropertyAll(0),
                    //     backgroundColor: MaterialStatePropertyAll(
                    //       Colors.white,
                    //     ),
                    //     side: MaterialStatePropertyAll(
                    //       BorderSide(color: Colors.grey.shade300),
                    //     ),
                    //   ),
                    //   child: Text(
                    //     "Establish",
                    //     style: TextStyle(color: Colors.black),
                    //   ),
                    // ),
                    ElevatedButton(
                      child: Text('Establish',style: TextStyle(color: Colors.black54),),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                        primary: Colors.white,
                        side: BorderSide(color: Colors.black38, width: 5),
                        textStyle: const TextStyle(
                            color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var number1 = [
    'dropdownvalue1 1',
    'dropdownvalue1 2',
    'dropdownvalue1 3',
    'dropdownvalue1 4',
    'dropdownvalue1 5',
  ];
  var number2 = [
    'dropdownvalue2 1',
    'dropdownvalue2 2',
    'dropdownvalue2 3',
    'dropdownvalue2 4',
    'dropdownvalue2 5',
  ];
  var number3 = [
    'dropdownvalue3 1',
    'dropdownvalue3 2',
    'dropdownvalue3 3',
    'dropdownvalue3 4',
    'dropdownvalue3 5',
  ];
  var number4 = [
    'Please select the direction',
    'Left',
    'Right',
    'Top',
    'Bottom',
  ];
}
