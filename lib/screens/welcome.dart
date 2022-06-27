import 'package:cht_toure_guide/screens/home.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  //

  // static double screenWidth = MediaQuery.of(context).size.width;

  //
  List image = [
    'images/image1.png',
    'images/image2.png',
    'images/image3.png',
  ];
  String damiData =
      'Uses visual coordinates, which means increasing x moves the point from left to right. To support layouts with a right-to-left TextDirection, consider using.';

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: image.length,
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment(0.0, 1.2),
                image: AssetImage(
                  image[index],
                ),
              ),
            ),
            child: MainBody(index),
          );
        },
      ),
    );
  }

  Widget MainBody(int index) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 60.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trips",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Trips subtitle",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Column(
                children: List.generate(image.length, (indexDot) {
                  return Container(
                    margin: EdgeInsets.all(3.0),
                    width: 8.0,
                    height: index == indexDot ? 25.0 : 12.0,
                    decoration: BoxDecoration(
                      color:
                          index == indexDot ? Colors.yellow[900] : Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  );
                }),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              '$damiData',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 60.0,
            width: 120.0,
            decoration: BoxDecoration(
              color: Colors.yellow[900],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
