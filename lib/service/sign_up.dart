import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget{
  SignUpView ({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm(){
    if(_formKey.currentState!.validate()){
      ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully')),
      );
    }
  }
  String? _validateEmail(value) {
    if (value!.isEmpty){
      return 'Please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,3}$');
    if(!emailRegExp.hasMatch(value)){
      return 'Please enter an valid email';
    }
    return null;
  }
  String? _validatePhoneNumber(value){
    if(value!.isEmpty){
      return 'Please enter a phone number';
    }
    if(value.length !=10){
      return 'Please enter a 10-digit phone number';
    }
    return null;
  }
   String? _validatePassword(value){
     if(value!.isEmpty){
       return 'Please enter a password';
     }
     return null;
   }
   String? _validateUsername(value){
     if(value!.isEmpty){
       return 'Please enter a username';
     }
     return null;
   }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Color(0xFF252634),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
          children: [
             const SizedBox(
              height: 80.0,
            ),
            const SizedBox(
          width: 250,
            child: Text(
              "Create new Account",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
             ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: _buildInputDecoration("Username",Icons.person),
              validator: (value){
                if(value!.isEmpty){
                  return 'Please enter a username';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: _buildInputDecoration("Email",Icons.email),
              validator:_validateEmail),
           const  SizedBox(
              height: 16.0,
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: _buildInputDecoration("Phone number",Icons.call),
              validator: _validatePhoneNumber,
            ),
           const  SizedBox(
              height: 16.0,
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: _buildInputDecoration("Password",Icons.lock),
              validator: _validatePassword,
            ),
           const  SizedBox(
              height: 40.0,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[900]
                ),
                onPressed: _submitForm,
                  child: const Text("Create",
                      style: TextStyle(fontSize: 20)))),
            const SizedBox(
              height: 30.0,
            ),
            TextButton(
              onPressed: () {},
                child:
                const Text(
                  "Login",
                  style:
                  TextStyle (color: Color(0xFFF15900),fontSize: 20),
                ),
            )],
        )),
      ));
  }
  InputDecoration _buildInputDecoration(String label,IconData suffixIcon){
   return InputDecoration(
     fillColor: const Color(0xAA49A59),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0x35949494))),
       focusedBorder: const OutlineInputBorder(
           borderSide: BorderSide(color: Colors.white)),
        filled: true,
        labelStyle: const TextStyle(color: Color(0xFF949494)) ,
        labelText: label,
        suffixIcon: Icon(
          suffixIcon,
          color: const Color(0xFF949494) ,),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0)));
  }
}