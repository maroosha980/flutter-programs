import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await 1.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  final bool isSignedUp = prefs.getBool('isSignedUp') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn, isSignedUp: isSignedUp));
}

extension on int {
  getInstance() {}
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final bool isSignedUp;

  const MyApp({super.key, required this.isLoggedIn, required this.isSignedUp});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn
          ? const HomePage() // If logged in, go to Home Page
          : isSignedUp
          ? const LoginPage() // If signed up but not logged in, go to Login Page
          : const SignupPage(title: '',), // If first time, go to Signup Page
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required String title});

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _city = '';

  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text);
    prefs.setString('email', _emailController.text);
    prefs.setString('password', _passwordController.text);
    prefs.setString('city', _city);
    prefs.setBool('isSignedUp', true); // Mark that user has signed up

    // Redirect to Login Page instead of directly logging in
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name', border: OutlineInputBorder()),
                validator: (value) => value!.contains(RegExp(r'[0-9]')) ? 'Name cannot contain numbers' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                validator: (value) => value!.contains('@') ? null : 'Invalid email format',
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                obscureText: true,
                validator: (value) => (value!.length < 8) ? 'Password must be at least 8 characters' : null,
              ),
              const SizedBox(height: 10),
              Row(
                children: ['Warburton', 'Nankana', 'SKP'].map((city) {
                  return Row(
                    children: [
                      Radio(
                        value: city,
                        groupValue: _city,
                        onChanged: (value) => setState(() => _city = value!),
                      ),
                      Text(city),
                    ],
                  );
                }).toList(),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate() && _city.isNotEmpty) {
                    await _saveUserData();
                  }
                },
                child: const Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --------------------------------------
// LOGIN PAGE
// --------------------------------------
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

    if (_emailController.text == savedEmail && _passwordController.text == savedPassword) {
      prefs.setBool('isLoggedIn', true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                obscureText: true,
              ),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: _login, child: const Text('Login')),
            ],
          ),
        ),
      ),
    );
  }
}

// --------------------------------------
// HOME PAGE
// --------------------------------------
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String? _name, _email, _city;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name');
      _email = prefs.getString('email');
      _city = prefs.getString('city');
    });
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, $_name'),
            Text('Email: $_email'),
            Text('City: $_city'),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _logout, child: const Text('Logout')),
          ],
        ),
      ),
    );
  }
}
