import 'package:flutter/material.dart';

import 'appdata.dart';
import 'materialcomponent.dart';

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
        title: 'Flutter Demos',
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
  List<ListViewItemData> _itemList;

  ///
  _ListViewPageState() {
    _itemList = List();

    AppData().listViewImages.forEach((key, value) {
      _itemList.add(ListViewItemData(ListViewTypes.threeLine, value.name,
          actionWidget: Icon(Icons.keyboard_arrow_right),
          content: value.artist,
          subContent: value.location,
          image: AssetImage('image/$key')));
    });
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: FlutterFrameworkAppBar('LIST VIEW'),
        drawer: FlutterFrameworkDrawer(),
        body: ListView.builder(
            itemCount: _itemList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ListViewDetailPage(_itemList[index]);
                  })); // close the drawer
                },
                child: MaterialListViewItem(_itemList[index]),
              );
            }));
  }
}

////
class ListViewDetailPage extends StatelessWidget {
  ///
  final ListViewItemData _listViewItemData;

  ///
  ListViewDetailPage(this._listViewItemData);

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: FlutterFrameworkAppBar(_listViewItemData.title.toUpperCase()),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(image: _listViewItemData.image),
              Container(
                padding: EdgeInsets.only(left: 16.0),
                alignment: Alignment.topLeft,
                child: Text(
                  _listViewItemData.content,
                  style: TextStyle(
                      color: Colors.black54,
                      fontStyle: FontStyle.italic,
                      fontSize: 14),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 16.0, top: 24.0, right: 16.0, bottom: 16.0),
                child: Text(
                  AppData()
                      .listViewImages[_listViewItemData.image.assetName
                          .replaceRange(0, 6, '')]
                      .description,
                  style: TextStyle(height: 1.5,fontSize: 16),
                ),
              )
            ],
          ),
        ));
  }
}

///
class BottomNavigationPage extends StatefulWidget {
  ///
  @override
  State<StatefulWidget> createState() => BottomNavigationPageState();

  ///
}

///
class BottomNavigationPageState extends State<BottomNavigationPage> {
  ///
  int _currentIndex = 0;

  ///
  void _onBottomItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  ///
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Put Contents "FOR YOU" Here.',
    ),
    Text(
      'Put Contents "FAVORITES" Here.',
    ),
    Text(
      'Put Contents "SETTINGS" Here.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ///
    return Scaffold(
      appBar: FlutterFrameworkAppBar('BOTTOM NAVIGATION'),
      drawer: FlutterFrameworkDrawer(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: _widgetOptions.elementAt(_currentIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity), title: Text('FOR YOU')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), title: Text('FAVORITES')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('SETTINGS')),
        ],
        currentIndex: _currentIndex,
        onTap: _onBottomItemTapped,
      ),
    );
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
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                              'image/sarah-olive-horse-unsplash.jpg')))),
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
            leading: Icon(Icons.border_bottom),
            title: Text('BOTTOM NAVIGATION'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return BottomNavigationPage();
              })); // close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('SETTING'),
          ),
        ],
      ),
    );
  }
}
