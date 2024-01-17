
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'Folder/auth_user.dart';
import 'Folder/loading_overlay.dart';
import 'Folder/session.dart';
import 'Folder/welcome_page.dart';


void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  )
);


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

 // Make sure to import the material library
  final _authenticateUserClient = AuthenticateUser();
  final _loginFormKey = GlobalKey<FormState>();

  Future<void> authenticateUser() async {
    final overlay = LoadingOverlay.of(context);
    final navigator = Navigator.of(context);
    overlay.show();

    try {
      final Map<String, dynamic> responseData = await _authenticateUserClient.login(
        usernameController.text,
        passwordController.text,
        '00000000000000',
        'Model',
      );

      // Handle responseData according to your requirements
      if (responseData != null) {
        // Process the response data here
        // For example, check for specific fields in the response data
        // and proceed accordingly
      } else {
        // Handle case when responseData is null
      }

      overlay.hide();
      Session session = Session();
      navigator.push(
        MaterialPageRoute(
          builder: (context) => WelcomePage(),
        ),
      );
    } on SocketException catch (e) {
      print('Error: Failed to connect to the server. Check your internet connection.');
      print('$e');
      overlay.hide();
    } catch (e) {
      print('Error during login: $e');
      overlay.hide();
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.yellow.shade600,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.yellow.shade600,
            ],
          ),

        ),
        child: SingleChildScrollView(
          child: Form(
            key: _loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeInUp(
                  duration: Duration(milliseconds: 1300),
                  child: Image.asset(
                    'images/2dsd.png',
                    width: MediaQuery.of(context).size.width, // Set width to screen width
                    fit: BoxFit.contain, // Adjust the fit based on your requirements
                  ),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color:  Colors.yellow.shade600,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                    ),
                    child:
                    Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 10,),
                            FadeInUp(duration: const Duration(milliseconds: 1400), child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child:  TextField(
                                      controller: usernameController,
                                      decoration: InputDecoration(
                                        hintText: "Username",
                                        hintStyle: TextStyle(color: Colors.grey,fontSize: 20),
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.grey,
                                        ),
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            )),
                            const SizedBox(height: 10,),
                            FadeInUp(duration: const Duration(milliseconds: 1500), child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10)
                                  )]
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child:  TextField(
                                      controller: passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                        prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.grey,
                                      ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            SizedBox(height: 20,),
                            FadeInUp(duration: Duration(milliseconds: 1600), child: Text("Forgot Password?", style: TextStyle(color: Colors.brown,fontSize: 20),)),
                            SizedBox(height: 20,),
                            FadeInUp(duration: Duration(milliseconds: 1800), child: MaterialButton(
                              onPressed: () {
                                if (_loginFormKey.currentState!.validate()) {
                                  authenticateUser();
                                }
                              },
                              height: 60,
                              // margin: EdgeInsets.symmetric(horizontal: 50),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
            
                              ),
                              child:  Center(
                                child: Text("Login", style: TextStyle(color: Colors.yellowAccent.shade700, fontWeight: FontWeight.bold,fontSize: 20),),
                              ),
                            )),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
