import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'Menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InAppWebViewController? webViewController;
  PullToRefreshController? refreshController;
  final initialUrl = Uri.parse("https://www.google.com/");
  late var url;
  double progress = 0;
  var urlController = TextEditingController();

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshController = PullToRefreshController(
      onRefresh: () {
        webViewController!.reload();
      },
      settings: PullToRefreshSettings(
        color: Colors.white,
        backgroundColor: Colors.black,
      ),
    );
  }

  void performSearch(String searchQuery) {
    print('Searching for: $searchQuery');
    String searchUrl = "https://www.google.com/search?q=$searchQuery";
    webViewController!.loadUrl(urlRequest: URLRequest(url: WebUri(searchUrl)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: IconButton(
          onPressed: () async {
            if (await webViewController!.canGoBack()) {
              webViewController!.goBack();
            }
          },
          icon: const Icon(CupertinoIcons.back),
          iconSize: 30,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  var webUri = WebUri(initialUrl.toString());
                  webViewController!
                      .loadUrl(urlRequest: URLRequest(url: webUri));
                },
                icon: const Icon(Icons.home_filled),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: SizedBox(
                  height: 45,
                  width: 210,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>TEXT FIELD>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                      style: const TextStyle(fontSize: 20),
                      onSubmitted: (value) {
                        setState(() {
                          if (Uri.parse(value).scheme.isEmpty) {
                            url = "${initialUrl.toString()}search?q=$value";
                          } else {
                            url = value;
                          }
                        });
                        if (url != null) {
                          var webUri = WebUri(url.toString());
                          webViewController!
                              .loadUrl(urlRequest: URLRequest(url: webUri));
                        }
                      },
                      controller: urlController,
                      textAlign: TextAlign.start,

                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        fillColor: Colors.grey,
                        hintText: "Search",
                        hintStyle: const TextStyle(fontSize: 20),
                        labelStyle: const TextStyle(fontSize: 20),
                        contentPadding: const EdgeInsets.only(top: 12),
                        suffixIcon: IconButton(
                            onPressed: () {
                              urlController.clear();
                            },
                            icon: const Icon(
                              Icons.clear_outlined,
                              color: Colors.cyan,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.search_circle_fill,
                    color: Colors.white),
                onPressed: () {
                  String searchQuery = urlController.text;
                  performSearch(searchQuery);
                },
                color: Colors.cyan,
                iconSize: 30,
              ),
              IconButton(
                onPressed: () {
                  webViewController!.reload();
                },
                icon: const Icon(Icons.refresh),
              ),

              // >>>>>>>>>>>>>>>>>>>>>>>>>>MENU BUTTON>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
              // IconButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const Menu(),
              //       ),
              //     );
              //   },
              //   icon: const Icon(Icons.menu),
              // ),
              //   >>>>>>>>>>>>>>>>>>>>>>>>>>MENU BUTTON>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            ],
          ),
        ],
        elevation: 5,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                InAppWebView(
                  onLoadStop: (controller, url) {
                    setState(() {
                      isLoading = false;
                    });
                    refreshController!.endRefreshing();
                  },
                  pullToRefreshController: refreshController,
                  onWebViewCreated: (controller) =>
                      webViewController = controller,
                  initialUrlRequest:
                      URLRequest(url: WebUri(initialUrl.toString())),
                  onLoadStart: (controller, url) {
                    setState(() {
                      isLoading = true;
                    });
                  },
                ),
                Visibility(
                  visible: isLoading,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    backgroundColor: Colors.cyanAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'Menu.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   InAppWebViewController? webViewController;
//   PullToRefreshController? refreshController;
//   final initialUrl = Uri.parse("https://www.google.com/");
//   late var url;
//   double progress = 0;
//   var urlController = TextEditingController();
//   var isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     refreshController = PullToRefreshController(
//       onRefresh: () {
//         webViewController!.reload();
//       },
//       settings: PullToRefreshSettings(
//         color: Colors.white,
//         backgroundColor: Colors.black,
//       ),
//     );
//   }
//
//   void performSearch(String searchQuery) {
//     print('Searching for: $searchQuery');
//     String searchUrl = "https://www.google.com/search?q=$searchQuery";
//     webViewController!.loadUrl(urlRequest: URLRequest(url: WebUri(searchUrl)));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.cyan,
//         leading: IconButton(
//           onPressed: () async {
//             if (await webViewController!.canGoBack()) {
//               webViewController!.goBack();
//             }
//           },
//           icon: const Icon(CupertinoIcons.back),
//           iconSize: 30,
//         ),
//         actions: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 onPressed: () {
//                   var webUri = WebUri(initialUrl.toString());
//                   webViewController!.loadUrl(urlRequest: URLRequest(url: webUri));
//                 },
//                 icon: const Icon(Icons.home_filled),
//               ),
//               Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 child: SizedBox(
//                   height: 45,
//                   width: 250,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: TextField(
//                       onSubmitted: (value) {
//                         setState(() {
//                           if (Uri.parse(value).scheme.isEmpty) {
//                             url = "${initialUrl.toString()}search?q=$value";
//                           } else {
//                             url = value;
//                           }
//                         });
//                         if (url != null) {
//                           var webUri = WebUri(url.toString());
//                           webViewController!
//                               .loadUrl(urlRequest: URLRequest(url: webUri));
//                         }
//                       },
//                       controller: urlController,
//                       textAlign: TextAlign.start,
//                       decoration: InputDecoration(
//                         enabledBorder: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         fillColor: Colors.grey,
//                         hintText: "Search",
//                         suffixIcon: IconButton(
//                           icon: const Icon(CupertinoIcons.search_circle_fill),
//                           onPressed: () {},
//                           color: Colors.cyan,
//                           iconSize: 30,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   webViewController!.reload();
//                 },
//                 icon: const Icon(Icons.refresh),
//               ),
//               IconButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Menu(onUrlChanged: (url) {
//                         setState(() {
//                           // Handle the URL change here in the HomePage
//                           // Update the state with the new URL
//                           // You can perform any necessary logic here
//                         });
//                       }),
//                     ),
//                   );
//                 },
//                 icon: const Icon(Icons.menu),
//               ),
//             ],
//           ),
//         ],
//         elevation: 5,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 InAppWebView(
//                   onLoadStop: (controller, url) {
//                     setState(() {
//                       isLoading = false;
//                     });
//                     refreshController!.endRefreshing();
//                   },
//                   pullToRefreshController: refreshController,
//                   onWebViewCreated: (controller) => webViewController = controller,
//                   initialUrlRequest: URLRequest(url: WebUri(initialUrl.toString())),
//                   onLoadStart: (controller, url) {
//                     setState(() {
//                       isLoading = true;
//                     });
//                   },
//                 ),
//                 Visibility(
//                   visible: isLoading,
//                   child: const CircularProgressIndicator(
//                     color: Colors.white,
//                     backgroundColor: Colors.cyanAccent,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
