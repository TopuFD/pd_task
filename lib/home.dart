// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<dynamic> button = [
//     "assets/topuOne.png",
//     "assets/topuTwo.png",
//     "assets/topuThree.png",
//     "assets/topuFour.png",
//     "assets/topuThree.png",
//     "assets/topuFour.png",
//   ];

//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: 130, 
//           child: ListView.builder(
//             physics: BouncingScrollPhysics(),
//             scrollDirection: Axis.horizontal,
//             itemCount: button.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     currentIndex = index;
//                   });
//                 },
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   height: currentIndex == index ? 140 : 80,
//                   width: currentIndex == index ? 140 : 120,
//                   margin: const EdgeInsets.symmetric(horizontal: 5),
//                   child: Opacity(
//                     opacity: currentIndex == index? 1.0:0.1,
//                     child: Image.asset(
//                       button[index],
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> buttonImages = [
    "assets/topuOne.png",
    "assets/topuTwo.png",
    "assets/topuThree.png",
    "assets/topuFour.png",
    "assets/topuThree.png",
    "assets/topuFour.png",
  ];

  int currentIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height / 6,
            width: Get.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              itemCount: buttonImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });

                    // Scroll Calculation Logic
                    double containerWidth = 100.0; // প্রতিটি কন্টেইনারের প্রস্থ
                    double screenWidth = MediaQuery.of(context).size.width; // স্ক্রিনের প্রস্থ

                    // Calculate the position to center the clicked image
                    double scrollPosition = (index * containerWidth) - (screenWidth / 2) + (containerWidth / 2);

                    // Ensure the clicked image is centered and adjust for boundaries
                    if (index == 0) {
                      scrollPosition = (index * containerWidth) - (screenWidth / 2) + (containerWidth / 2);// First image should be at start
                    } else if (index == buttonImages.length - 1) {
                      scrollPosition = (buttonImages.length * containerWidth) - screenWidth; // Last image should be at end
                    } else {
                      // For middle items, center them accordingly
                      scrollPosition = index * containerWidth - (screenWidth / 2) + (containerWidth / 2);
                    }

                    // Animate to the calculated scroll position
                    _scrollController.animateTo(
                      scrollPosition,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Opacity(
                    opacity: currentIndex == index ? 1.0 : 0.3, // ক্লিক করা ইমেজের opacity 1, অন্যগুলোর 0.3
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        buttonImages[index],
                        height: currentIndex == index? 130 :100,
                        width: currentIndex == index? 130 :100,
                        fit: BoxFit.cover, // ইমেজ ফিটিং
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
