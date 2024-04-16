import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'splashscreen.dart'; // Import your splash screen file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Display splash screen first
    );
  }
}



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Navigation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add Student'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddStudentPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text('Add Course'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCoursePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('View Students'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewStudentsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('View Courses'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewCoursePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('View Result'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewResultPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add_box), // New icon for "Add Result"
              title: Text('Add Result'), // New item for "Add Result"
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddResultPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/a.jpg'), // Display the image
            SizedBox(height: 30), // Add some spacing
            Text(
              'Welcome to student management App', // Display the text
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}



class AddStudentPage extends StatefulWidget {
  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _feesPaidController = TextEditingController();

  void _addStudent() async {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    int feesPaid = int.tryParse(_feesPaidController.text) ?? 0;

    // Insert student into database
    await DatabaseHelper.instance.insertStudent({
      'firstName': firstName,
      'lastName': lastName,
      'feesPaid': feesPaid,
    });

    Navigator.pop(context! as BuildContext); // Go back to previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextFormField(
              controller: _feesPaidController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Fees Paid'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _addStudent,
              child: Text('Add Student'),
            ),
          ],
        ),
      ),
    );
  }
}


class AddResultPage extends StatefulWidget {
  @override
  _AddResultPageState createState() => _AddResultPageState();
}

class _AddResultPageState extends State<AddResultPage> {
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _percentageController = TextEditingController();

  void _addResult() async {
    String studentName = _studentNameController.text;
    double percentage = double.tryParse(_percentageController.text) ?? 0.0;

    // Insert result into database
    await DatabaseHelper.instance.insertMark({
      'studentName': studentName,
      'percentage': percentage,
    });

    Navigator.pop(context! as BuildContext); // Go back to previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Result'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _studentNameController,
              decoration: InputDecoration(labelText: 'Student Name'),
            ),
            TextFormField(
              controller: _percentageController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Percentage'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _addResult,
              child: Text('Add Result'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddCoursePage extends StatefulWidget {
  @override
  _AddCoursePageState createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _courseIdController = TextEditingController();

  void _addCourse() async {
    String courseName = _courseNameController.text;
    String courseId = _courseIdController.text;

    // Insert course into database or perform desired actions
    // Example: await DatabaseHelper.instance.insertCourse({'courseName': courseName, 'courseId': courseId});

    Navigator.pop(context! as BuildContext); // Go back to previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Course'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _courseNameController,
              decoration: InputDecoration(labelText: 'Course Name'),
            ),
            TextFormField(
              controller: _courseIdController,
              decoration: InputDecoration(labelText: 'Course ID'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _addCourse,
              child: Text('Add Course'),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewResultPage extends StatefulWidget {
  @override
  _ViewResultPageState createState() => _ViewResultPageState();
}

class _ViewResultPageState extends State<ViewResultPage> {
  late Future<List<Map<String, dynamic>>> _resultsFuture;

  @override
  void initState() {
    super.initState();
    _resultsFuture = DatabaseHelper.instance.queryAllMarks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Results'),
      ),
      body: FutureBuilder(
        future: _resultsFuture,
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> results = snapshot.data!;
            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '${results[index]['studentName']}',
                  ),
                  subtitle: Text('Percentage: ${results[index]['percentage']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}


class ViewStudentsPage extends StatefulWidget {
  @override
  _ViewStudentsPageState createState() => _ViewStudentsPageState();
}

class _ViewStudentsPageState extends State<ViewStudentsPage> {
  late Future<List<Map<String, dynamic>>> _studentsFuture;

  @override
  void initState() {
    super.initState();
    _studentsFuture = DatabaseHelper.instance.queryAllStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Students'),
      ),
      body: FutureBuilder(
        future: _studentsFuture,
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> students = snapshot.data!;
            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '${students[index]['firstName']} ${students[index]['lastName']}',
                  ),
                  subtitle: Text('Fees Paid: ${students[index]['feesPaid']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}


class ViewCoursePage extends StatefulWidget {
  @override
  _ViewCoursePageState createState() => _ViewCoursePageState();
}

class _ViewCoursePageState extends State<ViewCoursePage> {
  late Future<List<Map<String, dynamic>>> _coursesFuture;

  @override
  void initState() {
    super.initState();
    _coursesFuture = DatabaseHelper.instance.queryAllCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Courses'),
      ),
      body: FutureBuilder(
        future: _coursesFuture,
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> courses = snapshot.data!;
            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '${courses[index]['courseName']}',
                  ),
                  subtitle: Text('Course ID: ${courses[index]['courseId']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'student_database.db');
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE students (
        id INTEGER PRIMARY KEY,
        firstName TEXT,
        lastName TEXT,
        feesPaid INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE courses (
        id INTEGER PRIMARY KEY,
        courseName TEXT,
        courseId TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE marks (
        id INTEGER PRIMARY KEY,
        studentName TEXT,
        percentage REAL
      )
    ''');
  }

  Future<int> insertStudent(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('students', row);
  }

  Future<int> insertCourse(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('courses', row);
  }

  Future<int> insertMark(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('marks', row);
  }

  Future<List<Map<String, dynamic>>> queryAllStudents() async {
    Database db = await instance.database;
    return await db.query('students');
  }

  Future<List<Map<String, dynamic>>> queryAllCourses() async {
    Database db = await instance.database;
    return await db.query('courses');
  }

  Future<List<Map<String, dynamic>>> queryAllMarks() async {
    Database db = await instance.database;
    return await db.query('marks');
  }
}
