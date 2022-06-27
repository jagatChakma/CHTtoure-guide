import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _currentPageNotifier = ValueNotifier<int>(0);
  List imageList = [
    'images/imageview.jpg',
    'images/imageview.jpg',
    'images/imageview.jpg',
    'images/imageview.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    var pageIndex;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(vertical: 20.0),
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: imageList.length,
                  // controller: PageController(viewportFraction: 0.8),
                  itemBuilder: (BuildContext context, int index) {
                    pageIndex = index;
                    return Container(
                      // margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0.0),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(imageList[index]),
                        ),
                      ),
                    );
                  },
                  onPageChanged: (int index) {
                    _currentPageNotifier.value = index;
                  },
                ),
                ////
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  // top: 0.0,
                  bottom: 0.0,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    // child: CirclePageIndicator(
                    //   itemCount: 3,
                    //   size: 20.0,
                    //   selectedSize: 24.0,
                    //   dotColor: Colors.purple[300],
                    //   selectedDotColor: Colors.purple[700],
                    //   currentPageNotifier: _currentPageNotifier,
                    // ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          List.generate(imageList.length, (indexIndicator) {
                        return Container(
                          margin: EdgeInsets.all(2.0),
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                            // problem
                            color: 1 == indexIndicator
                                ? Colors.white
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        );
                      }),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
