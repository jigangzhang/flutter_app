import 'package:flutter/material.dart';
import 'favorite.dart';
import 'main1.dart' as App;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: EdgeInsets.all(32.0),
      height: 104.0,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    "This is title",
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                new Text(
                  "There is sub content",
                  style: new TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text(
            '42',
          ),
          FavoriteWidget(),
        ],
      ),
    );
    buildButtonColumn(BuildContext context, IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return GestureDetector(
          onTap: () {
            var snackBar = SnackBar(content: Text('on tap!'));
            Scaffold.of(context).showSnackBar(snackBar);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => App.RandomWords()));
          },
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  icon,
                  color: color,
                ),
                new Container(
                  margin: EdgeInsets.only(top: 8.0),
                  child: new Text(
                    label,
                    style: new TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: color,
                    ),
                  ),
                )
              ]));
    }

    buildButton(BuildContext context) {
      return new Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildButtonColumn(context, Icons.call, 'CALL'),
            buildButtonColumn(context, Icons.near_me, 'ROUTE'),
            buildButtonColumn(context, Icons.share, 'SHARE'),
          ],
        ),
      );
    }

    Widget textSection = new Container(
      padding: EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
    return new MaterialApp(
      title: 'Layout Test',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('main'),
        ),
        body: Builder(builder: (BuildContext context) {
          return ListView(
            children: <Widget>[
              Image.network('http://pic.58pic.com/58pic/17/66/35/39S58PIC7AR_1024.jpg'),
              Image.asset(
                'images/moon.jpg',
                height: 240.0,
                fit: BoxFit.cover,
              ),
              titleSection,
              buildButton(context),
              textSection,
            ],
          );
        }),
      ),
    );
  }
}
