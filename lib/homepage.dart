import 'package:flutter/material.dart';
import 'news.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //change
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  bool loadingInProgress;
  var newsList;

  void getNews() async {
    News news = News(); //change
    await news.getNews();
    setState(() {
      loadingInProgress = false;
      newsList = news.news;
    });
  }

  @override
  void initState() {
    loadingInProgress = true;
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Container(
            child: loadingInProgress
                ? Center(
                    child: Text('Loading.....'),
                  )
                : Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Top Headlines',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 36.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Divider(),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(newsList[index].title),
                              leading: Image.network(newsList[index].urlToImage),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
