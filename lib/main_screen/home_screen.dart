import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:whitefield_assignment/widget/avatar.dart';
import 'package:whitefield_assignment/widget/product_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 0;
  List imageList = [
    {"id": 1, "image_path": 'assets/mobile_sale_banner1.jpg'},
    {"id": 1, "image_path": 'assets/mobile_sale_banner2.jpg'},
  ];
  final CarouselSliderController carouselSliderController =
      CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      automaticallyImplyLeading: false,
      elevation: 5,
      shadowColor: Colors.grey,
      backgroundColor: Colors.white,
      //leading: Icon(Icons.menu),
      title: Container(
        
        margin:EdgeInsets.symmetric(vertical: 100) ,
       // padding: EdgeInsets.symmetric(vertical: 100),
        child: Row(
          //mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu),
            SizedBox(
              height: 40,
              width: 250,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.arrow_forward_ios),
                  hintText: "search here",
                  suffixIcon: Icon(Icons.search)
                ),
              ),
            ),
            Icon(Icons.notifications_none_outlined)
          ],
        ),
      ),
      //actions: [Icon(Icons.notifications_none_outlined)],
     ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: CarouselSlider(
                      items: imageList
                          .map((item) => Image.asset(
                                item['image_path'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ))
                          .toList(),
                      carouselController: carouselSliderController,
                      options: CarouselOptions(
                        scrollPhysics: BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          /* setState(
                            () {},
                          );*/
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 350,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 142, 192, 234),
                              Color.fromARGB(255, 64, 164, 246),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight)),
                    child: Column(
                      children: [
                        const Text(
                          "KYC Pending",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "You need to provide the required",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w300),
                        ),
                        const Text(
                          "documents for your account activation",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text("Click Here",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Avatar(
                        iconData: Icons.phone_android,
                        text: "mobile",
                        color: Colors.blue[800],
                      ),
                      Avatar(
                        iconData: Icons.computer,
                        text: "mobile",
                        color: Colors.green,
                      ),
                      Avatar(
                        iconData: Icons.camera_alt,
                        text: "mobile",
                        color: Colors.pink[400],
                      ),
                      Avatar(
                        iconData: Icons.lightbulb_outline,
                        text: "mobile",
                        color: Colors.orange[400],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  
                ],
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  color: const Color.fromARGB(255, 122, 179, 227),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  // height: 300,
                
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Text(
                            "Exclusive for You",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 24),
                          ),
                          
                          SizedBox(),
                           InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.arrow_right_alt,
                              color: Colors.white,
                            ),
                          )
                          
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProductDetails(
                            imageName: "mobile_image1.jpg",
                            productName: "Nokia 8.1 (iron,64 GB)",
                            discount: "32",
                          ),
                          SizedBox(width: 10,),
                          ProductDetails(
                        imageName: "mobile_image2.jpg",
                        productName: "Nokia 8.1 (iron,64 GB)",
                        discount: "32",
                      ),
                      SizedBox(width: 10,),
                       ProductDetails(
                        imageName: "mobile_image2.jpg",
                        productName: "Nokia 8.1 (iron,64 GB)",
                        discount: "32",
                      ),
                
                        ],
                      )
                      
                    ],
                
                  ),
                ),
              )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(color: Colors.red),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        fixedColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: myIndex == 0 ? Colors.red : Colors.grey,
              ),
              label: "home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                color: myIndex == 1 ? Colors.red : Colors.grey,
              ),
              label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.arrow_outward_rounded,
                color: myIndex == 2 ? Colors.red : Colors.grey,
              ),
              label: "deals"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined,
                  color: myIndex == 3 ? Colors.red : Colors.grey),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined,
                  color: myIndex == 4 ? Colors.red : Colors.grey),
              label: "Profile"),
        ],
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
      ),
      floatingActionButton: Container(
        width: 100,
        height: 40,
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.chat,
                color: Colors.white,
              ),
              Text(
                "Chat",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
