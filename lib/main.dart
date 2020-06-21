import 'package:flutter/material.dart';

import 'componentdesign.dart';

///
void main() {
  runApp(FlutterDemosApp());
}

///
class FlutterDemosApp extends StatelessWidget {
  ///
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Tutorials',
        //App title
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainPage());
  }
}

///
class MainPage extends StatelessWidget {
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FlutterFrameworkAppBar('HOME'),
      drawer: FlutterFrameworkDrawer(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
              'This app is made for practicing features of flutter framework.'),
        ),
      ),
    );
  }
}

///
class ListViewPage extends StatefulWidget {
  ///
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

///
class _ListViewPageState extends State<ListViewPage> {
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: FlutterFrameworkAppBar('LIST VIEW'),
        drawer: FlutterFrameworkDrawer(),
        body: ListView.builder(
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return createChildren()[index];
            }));
  }

  ///
  final List<String> images = <String>[
    'a-g-tiger-unsplash.jpg',
    'bas-van-brandwijk-crocodile-unsplash.jpg',
    'chris-charles-hummingbird-unsplash.jpg',
    'david-clode-rhinos-unsplash.jpg',
    'francesco-de-tommaso-lion-unsplash.jpg',
    'jack-seeds-u4-pheasant-unsplash.jpg',
    'jairo-alzate-iguana-unsplash.jpg',
    'jay-ruzesky-penguin-unsplash.jpg',
    'jessica-weiller-bear-unsplash.jpg',
    'kris-mikael-krister-turtle-unsplash.jpg',
    'ray-hennessy-heron-unsplash.jpg',
    'ray-rui-buffalo-unsplash.jpg',
    'saad-chaudhry-reindeer-unsplash.jpg',
    'sarah-olive-horse-unsplash.jpg',
    'sebastian-pena-lambarri-whaleshark-unsplash.jpg',
    'stan-yu-panda-unsplash.jpg',
    'stefan-steinbauer-hippo-unsplash.jpg',
    'trevor-mckinnon-leopard-unsplash.jpg',
    'wolfgang-hasselmann-dromedary-unsplash.jpg',
    'wolfgang-hasselmann-elephant-unsplash.jpg'
  ];

  List<Widget> createChildren() {
    int index = 1;
    List<Widget> children = List<Widget>();
    for (String image in images) {
      ImageInfo imageInfo = ImageInfo.build(String.fromCharCode(index), image);
      children.add(BigImageThreeLineContentsListItem(
          image: AssetImage('image/$image'),
          title: imageInfo.name,
          content: '123',
          subContent: '456',
          icon: Icons.keyboard_arrow_right));
    }

    return children;
  }
}

///
class FlutterFrameworkAppBar extends StatelessWidget with PreferredSizeWidget {
  ///
  final String _title;

  ///
  FlutterFrameworkAppBar(this._title);

  ///
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

///
class FlutterFrameworkDrawer extends StatelessWidget {
  ///
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
                child: Column(children: <Widget>[
                  Container(
                      width: 56.0,
                      height: 56.0,
                      margin: EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('image/optimus_prime.jpg')))),
                  Text(
                    'Shawn Han',
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'hanxiaolc@gmail.com',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ])),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('HOME'),
            onTap: () {
              // change app state...
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                    return MainPage();
                  })); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('LIST VIEW'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                    return ListViewPage();
                  })); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}

///
class ImageInfo {
  ///
  String _index;

  ///
  String _name;

  ///
  String _artist;

  ///
  String _description;

  ///
  String _location;

  ///
  DateTime _photoedTime;

  ///
  ImageInfo.build(String index, String name,
      [String description, String location, DateTime photoedTime]) {
    _index = index;
    _name = name;
    _description = description;
    _location = location;
    _photoedTime = photoedTime;

    List<String> infoList = _name.split('-');
    _name = infoList[infoList.length - 2].replaceFirst(
        infoList[infoList.length - 2].substring(0),
        infoList[infoList.length - 2].substring(0).toUpperCase());

    for (int i = 0; i < infoList.length - 2; i++) {
      _artist =
      '$_artist ${infoList[i].replaceFirst(
          infoList[i].substring(0), infoList[i].substring(0).toUpperCase())}';
    }
  }

  ///
  String get index => _index;

  ///
  set index(String value) {
    _index = value;
  }

  ///
  String get name => _name;

  ///
  set name(String value) {
    _name = value;
  }

  ///
  String get artist => _artist;

  ///
  set artist(String value) {
    _artist = value;
  }

  ///
  String get description => _description;

  ///
  set description(String value) {
    _description = value;
  }

  ///
  String get location => _location;

  ///
  set location(String value) {
    _location = value;
  }

  ///
  DateTime get photoedTime => _photoedTime;

  ///
  set photoedTime(DateTime value) {
    _photoedTime = value;
  }
}
