import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_mate/HomePage.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

final _textController = TextEditingController();

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: const Text("Settings",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontStyle: FontStyle.italic)),
        backgroundColor: Colors.cyan,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: const Icon(CupertinoIcons.back)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Row(
                children: [
                  Container(
                    height: 90,
                    width: 380,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: TextField(
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>TEXT FIELD>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      style: const TextStyle(fontSize: 20),
                      controller: _textController,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(fontSize: 20),
                        contentPadding: const EdgeInsets.only(top: 20),
                        fillColor: Colors.white,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        filled: true,
                        prefixIcon: const Icon(Icons.link, color: Colors.black),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _textController.clear();
                            },
                            icon: const Icon(Icons.clear_rounded)),
                        hintText: "Enter Base URL",
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>TEXT FIELD>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  Container(
                    height: 90,
                    width: 50,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        color: Colors.white),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_circle_right_rounded,
                          color: Colors.cyan,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:search_mate/HomePage.dart';
//
// class Menu extends StatefulWidget {
//   const Menu({Key? key, required this.onUrlChanged}) : super(key: key);
//
//   final void Function(String) onUrlChanged;
//
//   @override
//   State<Menu> createState() => _MenuState();
// }
//
// class _MenuState extends State<Menu> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.cyan,
//       appBar: AppBar(
//         backgroundColor: Colors.cyan,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context)=> const HomePage())
//             );
//           },
//           icon: const Icon(CupertinoIcons.back),
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 80,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 10, bottom: 10),
//               child: Container(
//                 height: 90,
//                 color: Colors.white,
//                 child: TextField(
//                   onChanged: (value) {
//                     widget.onUrlChanged(value);
//                   },
//                   decoration: InputDecoration(
//                     filled: true,
//                     prefixIcon: const Icon(Icons.link),
//                     hintText: "Enter Base URL",
//                     focusedBorder: InputBorder.none,
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                       },
//                       icon: const Icon(Icons.arrow_circle_right_rounded),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
