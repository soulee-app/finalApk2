import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navbar/LoginPage/component/Singup_Custom_image.dart';
import 'dart:io';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  bool _isFirstStep = true;
  File? _selectedImage;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<String?> _uploadImage(File imageFile) async {
    try {
      final ref = _storage
          .ref()
          .child('profile_images/${DateTime.now().toString()}.jpg');
      await ref.putFile(imageFile);
      return await ref.getDownloadURL();
    } catch (e) {
      print(e);
      return null;
    }
  }

  void _signup() async {
    if (_nameController.text.isEmpty ||
        _dobController.text.isEmpty ||
        _genderController.text.isEmpty ||
        _bloodGroupController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields.')),
      );
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match.')),
      );
      return;
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      String? imageUrl;
      if (_selectedImage != null) {
        imageUrl = await _uploadImage(_selectedImage!);
      }

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': _nameController.text,
        'dob': _dobController.text,
        'gender': _genderController.text,
        'blood_group': _bloodGroupController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'profile_image': imageUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signup successful!')),
      );

      // Navigate to LoginScreen after successful signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signup failed. Please try again later.')),
      );
    }
  }

  InputDecoration _inputDecoration(String label, {Widget? suffixIcon}) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: const Color(0xFFF3EDED),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      suffixIcon: suffixIcon,
    );
  }

  Widget _buildFirstStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/sign_up/1726164386864.png', height: 100),
        const SizedBox(height: 20),
        TextField(
            controller: _nameController, decoration: _inputDecoration('Name')),
        const SizedBox(height: 20),
        TextField(
          controller: _dobController,
          decoration: _inputDecoration('Date of Birth',
              suffixIcon: const Icon(Icons.calendar_today, color: Colors.grey)),
          readOnly: true,
          onTap: () => _selectDate(context),
        ),
        const SizedBox(height: 20),
        TextField(
            controller: _genderController,
            decoration: _inputDecoration('Gender')),
        const SizedBox(height: 20),
        TextField(
            controller: _bloodGroupController,
            decoration: _inputDecoration('Blood Group')),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () => setState(() => _isFirstStep = false),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF6F61),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
          ),
          child: const Text('Next', style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  Widget _buildSecondStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: _pickImage,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/sign_up/Deformed Circle.png', // Placeholder image
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              if (_selectedImage != null)
                SingUpCustomImage(height: 150,width: 150, imageFile: _selectedImage!,),
              if (_selectedImage == null)
                const Icon(
                  Icons.camera_alt,
                  size: 30,
                  color: Colors.grey,
                ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        TextField(
            controller: _emailController,
            decoration: _inputDecoration('Email')),
        const SizedBox(height: 20),
        TextField(
            controller: _phoneController,
            decoration: _inputDecoration('Phone Number')),
        const SizedBox(height: 20),
        TextField(
            controller: _passwordController,
            decoration: _inputDecoration('Password'),
            obscureText: true),
        const SizedBox(height: 20),
        TextField(
            controller: _confirmPasswordController,
            decoration: _inputDecoration('Confirm Password'),
            obscureText: true),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: _signup,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF6F61),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
          ),
          child: const Text('Sign Up', style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (_isFirstStep) {
              Navigator.pop(context);
            } else {
              setState(() {
                _isFirstStep = true;
              });
            }
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _isFirstStep ? _buildFirstStep() : _buildSecondStep(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
