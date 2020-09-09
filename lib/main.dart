import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get profileImage => Container(
    padding: EdgeInsets.only(left:10, right: 10, top: 40),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.orange[200],
    ),
    child: Image.network(
        'https://www.fmreligion.it/wp-content/uploads/2019/07/cut_out_faces.png'),
  );

  Widget button (IconData icon, Color color, Color bgColor) => Container(
    padding: EdgeInsets.all(6.0),
    // margin: EdgeInsets.only(right: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: bgColor,
    ),
    child: Icon(
      icon,
      color: color,
    ),
  );

  get name => Text(
    'Dr. Lionel Messi',
    textAlign: TextAlign.left,
    style: TextStyle( fontSize: 30),
  );

  get title => Container(
      transform: Matrix4.translationValues(0, -5, 0),
      child: Text(
        'Elite Striker',
        textAlign: TextAlign.left,
        style: TextStyle(color: Colors.grey, fontSize: 18),
      )
  );

  get buttons => Container(
      margin: EdgeInsets.only(left: 0, right: 40),
      // alignment: Alignment.topCenter,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            button(Icons.mail, Colors.orange[400], Colors.orange[100]),
            button(Icons.phone, Colors.red[400], Colors.red[50]),
            button(Icons.videocam, Colors.grey[400], Colors.grey[200]),
          ])
  );

  get info => Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: name,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: title,
          ),
          buttons,
        ],
      )
  );

  get profileTop => Flexible(
      flex: 3,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: profileImage,
            ),
            Flexible(
              flex: 4,
              child: info,
            ),
          ],
        ),
      )
  );

  Widget addressGroup (String a, String b) => Row(
    children: [
      Icon(Icons.location_on, color: Colors.grey),
      Expanded(
        child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      a,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 18
                      ),
                    )
                ),
                Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      b,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                ),
              ],
            )
        ),
      )
    ],
  );

  get address => Flexible(
      flex: 4,
      child: Container(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Row(children: [
            Flexible(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    addressGroup('Address', 'AddressAddressAddressAddressAddreressAddressAddress'),
                    addressGroup('Address', 'AddressAddressAddressAddressAddressddressAddress'),
                  ],
                )
            ),
            Flexible(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage('https://www.google.com/maps/d/u/0/thumbnail?mid=13RpsAuajnWLxuSCVWI7fMKf2Zog&hl=en'),
                        fit: BoxFit.cover,
                      )
                  ),

                )
            ),
          ])
      )
  );

  get about => Flexible(
      flex: 2,
      child: Column(children: [
        Container(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'About',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25),
                )
            )
        ),
        Text(
          'lorem ipsum lorem ipsumlorem ipsumlorem ipsum ipsumlorem ipsumm ipsumlorem ipsumlorem ipsum ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsum ',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.grey),
        )
      ])
  );

  Widget buttonActivity(String name, IconData icon, Color color) => Flexible(
      flex: 1,
      child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  color: Color.fromRGBO(255,255,255,0.2),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              Expanded(child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    name,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white),
                  )
              ))
            ],
          )
      )
  );

  get activity => Flexible(
      flex: 2,
      child: Column(children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Activity',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )
        ),
        Expanded(
            child: Row(
                children: [
                  buttonActivity('List of Schedule', Icons.event_note, Colors.orange[200]),
                  buttonActivity('Doctor\'s Daily Post', Icons.event_note, Colors.grey[400]),
                ]
            )
        )
      ]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(children: [
                profileTop,
                about,
                address,
                activity,
              ]))),
    );
  }
}
