import 'package:flutter/material.dart';
import 'db_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StudentForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  StudentFormState createState() => StudentFormState();
}

class StudentFormState extends State<StudentForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController marksController = TextEditingController();
  final List<String> _subjects = ['DLD', 'English', 'Urdu', 'Math', 'Islamiyat', 'Artificial Intelligence'];

  String? _selectedSubject;
  List<Map<String, dynamic>> _students = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    setState(() {
      _isLoading = true;
    });

    final students = await DatabaseHelper.instance.getAllStudents();

    setState(() {
      _students = students;
      _isLoading = false;
    });
  }

  Future<void> _saveStudent() async {
    String name = nameController.text.trim();
    int marks = int.tryParse(marksController.text.trim()) ?? 0;

    if (name.isNotEmpty && _selectedSubject != null && marks >= 0) {
      double percentage = marks.toDouble(); // Adjust based on your max marks
      String grade = _getGrade(percentage);

      Map<String, dynamic> student = {
        'name': name,
        'subject': _selectedSubject!,
        'marks': marks,
        'percentage': percentage,
        'grade': grade,
      };

      await DatabaseHelper.instance.insertStudent(student);

      nameController.clear();
      marksController.clear();
      _selectedSubject = null;

      await _loadStudents(); // Reload data
    }
  }

  String _getGrade(double percentage) {
    if (percentage >= 90) return 'A+';
    if (percentage >= 80) return 'A';
    if (percentage >= 70) return 'B';
    if (percentage >= 60) return 'C';
    return 'F';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(title: const Text('Student Data')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Input Fields
              SizedBox(
                width: 200,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Student Name'),
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                width: 200,
                child: DropdownButton<String>(
                  value: _selectedSubject,
                  hint: const Text('Select Subject'),
                  isExpanded: true,
                  items: _subjects.map((subject) {
                    return DropdownMenuItem<String>(
                      value: subject,
                      child: Text(subject),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedSubject = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),

              SizedBox(
                width: 200,
                child: TextField(
                  controller: marksController,
                  decoration: const InputDecoration(labelText: 'Enter Marks'),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _saveStudent,
                child: const Text('Save'),
              ),
              const SizedBox(height: 20),

              // Student List
              _isLoading
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _students.length,
                itemBuilder: (context, index) {
                  final student = _students[index];
                  return Card(
                    child: ListTile(
                      title: Text('Name: ${student['name']}'),
                      subtitle: Text(
                          'Subject: ${student['subject']}, Marks: ${student['marks']}, Grade: ${student['grade']}'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
