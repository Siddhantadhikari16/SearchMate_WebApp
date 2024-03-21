import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InAppWebViewController? webViewController;
  PullToRefreshController? refreshController;
  var initialUrl = "https://www.google.com/";
  var _url="https://www.google.com/";
  late var url;
  double progress = 0;
  var urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () async {
                      if (await webViewController!.canGoBack()) {
                        webViewController!.goBack();
                      }
                    },
                    icon: const Icon(CupertinoIcons.back)),
                IconButton(
                    onPressed: () {
                      initialUrl;
                    }, icon: const Icon(Icons.home_filled)),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: SizedBox(
                    height: 45,
                    width: 250,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        onSubmitted: (value) {
                          url = Uri.parse(value);
                          if (url.scheme.isEmpty) {
                            url = Uri.parse("${initialUrl}search?q=$value");
                          }
                          webViewController!
                              .loadUrl(urlRequest: URLRequest(url: url));
                        },
                        controller: urlController,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            fillColor: Colors.grey,
                            hintText: "Search",
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon:
                                  const Icon(CupertinoIcons.search_circle_fill),
                              color: Colors.cyan,
                              iconSize: 35,
                            )),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    webViewController!.reload();
                  },
                  icon: const Icon(Icons.refresh),
                )
              ],
            ),
          ],
          elevation: 5,
        ),
        body: Column(
          children: [
            Expanded(
                child: InAppWebView(
              onWebViewCreated: (controller) => webViewController = controller,
              initialUrlRequest: URLRequest(url: WebUri(initialUrl)),
            )),
          ],
        ));
  }
  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

}
