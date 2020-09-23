import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Student> students = List<Student>();
  @override
  void initState() {
    super.initState();
    students.addAll([
      Student("Pham Huu Duc", "English", 10.0),
      Student("Pham Huu Duc A", "Programming", 8.5),
      Student("Pham Huu Duc B", "Physic", 7.25)]);
  }

  Widget title (String title) {
    return Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          var student = students[index];
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            // height: double.infinity,
            // width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                student.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                )
              ),
              subtitle: Text(
                student.subject,
                style: TextStyle(
                  color: Colors.grey
                )
              ),
              trailing: Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  student.averagePoint.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[200]
                  )
                ),
              ),
              leading: CircleAvatar(
                radius: 40,
                child: Text(
                  (index+1) .toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  )
                ),
                backgroundColor: Colors.orange[200],
              ),

              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                    content: Text('Delete this student?'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text(
                            'YES',
                            style: TextStyle(
                              color: Colors.red,
                            )
                        ),
                        onPressed: () {
                          setState(() {
                            students.removeAt(index);
                          });
                          Navigator.of(context).pop();
                        },
                      ),

                      FlatButton(
                        child: Text('NO'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),

                    ],
                  ),
                );
              },

              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: title('Update'),
                    ),
                    content: Container(
                      height: 150,
                      width: 350,
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            child: new TextFormField(
                              onChanged: (String value) {
                                student.name = value;
                              },
                              initialValue: student.name,
                              decoration: InputDecoration(
                                hintText: 'Student name',
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 40,
                            child: new TextFormField(
                              onChanged: (String value) {
                                student.subject = value;
                              },
                              initialValue: student.subject,
                              decoration: InputDecoration(
                                hintText: 'Subject name',
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 40,
                            child: new TextFormField(
                              onChanged: (String value) {
                                student.averagePoint = double.parse(value);
                              },
                              initialValue: student.averagePoint.toString(),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Average Point',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      ButtonTheme(
                        height: 30,
                        child: FlatButton(
                          child: Text(
                            'SAVE',
                            style: TextStyle(
                              color: Colors.blue,
                            )
                          ),
                          onPressed: () {
                            if (student.name != null &&
                                student.averagePoint != null &&
                                student.subject != null) {
                              setState(() {});
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ),
                      ButtonTheme(
                        height: 30,
                        child: FlatButton(
                          child: Text('CANCEL'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addStudent,
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[300],
      ),
    );
  }

  void addStudent() {
    String name, subject;
    double averagePoint;
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
          title: Align(
            alignment: Alignment.centerLeft,
            child: title('Add Student'),
          ),
          content: Container(
            height: 150,
            width: 350,
            child: Column(
              children: [
                Container(
                  height: 40,
                  child: new TextFormField(
                    onChanged: (String value) {
                      name = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Student name',
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 40,
                  child: new TextFormField(
                    onChanged: (String value) {
                      subject = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Subject name',
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 40,
                  child: new TextFormField(
                    onChanged: (String value) {
                      averagePoint = double.parse(value);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Average Point',
                    ),
                  ),
                ),
              ],
            ),
          ),
        actions: <Widget>[
          FlatButton(
            child: Text('SAVE'),
            onPressed: () {
              if (name != null && subject != null && averagePoint != null) {
                Student student = new Student(name, subject, averagePoint);
                students.add(student);
                setState(() {});
                Navigator.of(context).pop();
              }
            },
          ),
          FlatButton(
            child: Text(
              'CANCEL',
              style: TextStyle(
                color: Colors.grey
              )
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class Student {
  String name;
  String subject;
  double averagePoint;

  Student(this.name, this.subject, this.averagePoint);
}
