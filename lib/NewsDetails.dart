import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:news_app/model/News.dart';

class NewsDetails extends StatefulWidget {
  final Article article;
  final String title;

  NewsDetails(this.article, this.title);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.red[400], Colors.teal[200]])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Column(
                children: <Widget>[
                 /* Image.network(widget.article.urlToImage,
                      fit: BoxFit.cover, height: 220.0, width: double.infinity),*/
                  FadeInImage.assetNetwork(
                      placeholder: 'assets/images/processing.gif',
                      image:widget.article.urlToImage,
                      fit: BoxFit.cover, height: 220.0, width: double.infinity
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.article.title,
                      style: TextStyle(
                        color: Colors.black,
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.article.description,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Container(
                        decoration: new BoxDecoration(
                            color: Colors.black38,
                            borderRadius: new BorderRadius.only(
                                topLeft:  const  Radius.circular(40.0),
                                bottomLeft: const  Radius.circular(40.0))
                        ),
                        child: MaterialButton(
                          child: Text(
                            "Load more news...",
                            style: TextStyle(color: Colors.white54, fontSize: 18.0),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    WebView(widget.article.url)));
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class WebView extends StatefulWidget {
  final String url;

  WebView(this.url);

  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebView> {

  num _stackToView = 1;

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text("More News..."),
      ),
      url: widget.url,
    );
  }
}
