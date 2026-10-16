
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  final String staticEmail = 'admin@gmail.com';
  final String staticPassword = '12345';

  bool hidePassword = true;
  bool hideRegisterPassword = true;

  // Controls AnimatedCrossFade
  bool _showRegister = false;

  void _crossFade() {
    setState(() {
      _showRegister = !_showRegister;
    });
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    if (!value.contains('@') || !value.contains('.')) {
      return 'Enter a valid email';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    return null;
  }

  String? _validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username is required';
    }

    return null;
  }

  void _submitLogin() {
    if (_formStateKey.currentState!.validate()) {
      _formStateKey.currentState!.save();

      if (email == staticEmail && password == staticPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login Successful!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid login details'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _forgotPassword() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Forgot Password?'),
        content: const Text(
          'Please contact the administrator to reset your password.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _registerUser() {
    if (_registerKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User registered successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  // LOGIN FORM
  Widget _loginForm() {
    return Card(
      color: Colors.white.withOpacity(0.94),
      elevation: 12,
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formStateKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 42,
                backgroundColor: Color(0xFFDBEAFE),
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Color(0xFF2563EB),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E3A8A),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Login to continue',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 28),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'admin@gmail.com',
                  prefixIcon: const Icon(Icons.email_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: _validateEmail,
                onSaved: (value) {
                  email = value!.trim();
                },
              ),

              const SizedBox(height: 18),

              TextFormField(
                obscureText: hidePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: _validatePassword,
                onSaved: (value) {
                  password = value!;
                },
              ),

              const SizedBox(height: 5),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _forgotPassword,
                  child: const Text('Forgot Password?'),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: _submitLogin,
                  icon: const Icon(Icons.login),
                  label: const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),
              const Divider(),
              const SizedBox(height: 8),

              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: _crossFade,
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // REGISTER FORM
  Widget _registerForm() {
    return Card(
      color: Colors.white.withOpacity(0.94),
      elevation: 12,
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _registerKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xFFDBEAFE),
                child: Icon(
                  Icons.person_add_alt_1,
                  size: 45,
                  color: Color(0xFF2563EB),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E3A8A),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Join us and get started',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 28),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: _validateEmail,
              ),

              const SizedBox(height: 18),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  prefixIcon: const Icon(Icons.person_outline),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: _validateUsername,
              ),

              const SizedBox(height: 18),

              TextFormField(
                obscureText: hideRegisterPassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'At least 5 characters',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      hideRegisterPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        hideRegisterPassword =
                        !hideRegisterPassword;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.length < 5) {
                    return 'Enter at least 5 characters';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: _registerUser,
                  icon: const Icon(Icons.app_registration),
                  label: const Text(
                    'CREATE ACCOUNT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextButton.icon(
                onPressed: _crossFade,
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(_showRegister ? 'Register Form' : 'Login Form'),
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0.25),
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1470770841072-f978cf4d019e?auto=format&fit=crop&w=1600&q=90',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: const Color(0xFF173B5E),
              );
            },
          ),

          Container(
            color: Colors.black.withOpacity(0.15),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 2000),
                  sizeCurve: Curves.easeInOut,
                  crossFadeState: _showRegister
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  firstChild: _loginForm(),
                  secondChild: _registerForm(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
