import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInUpAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000), // Increased duration
      vsync: this,
    );

    _fadeInUpAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Adjust the curve for smoother animation
    ));

    // Trigger the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE3C263),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10),
            Text(
              'Nisis App',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://cdn.contactcenterworld.com/images/company/department-of-social-development-1200px-logo.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      body:  Column(
        children: [
          SizedBox(height: 100,),
          Text('Welcome to Nisis App',style: TextStyle(fontSize: 30,color: Colors.yellow.shade700,fontWeight: FontWeight.bold)),
          SizedBox(height: 20,),
          Center(
            child: CarouselSlider(
              items: [
                Expanded(child:
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                  ),
                  child: Stack(
                    children:
                    [Image.asset(
                      'images/hous.jpg',
                      width: 600,
                      height: 200,
                      // Adjust the fit based on your requirements
                    ),
                      const Positioned(
                        bottom: 10, // Adjust the position from the bottom as needed
                        left: 15, // Adjust the position from the left as needed
                        child: Center(
                          child: Text(
                            'Household Services',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),
                ),),
                Expanded(child:
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                  ),
                  child:
                  Stack(
                    children: [Image.asset(
                      'images/site.jpg',
                      width: 300,
                      height: 300,
                      // Adjust the fit based on your requirements
                    ),
                      const Positioned(
                        bottom: 10, // Adjust the position from the bottom as needed
                        left: 10, // Adjust the position from the left as needed
                        child: Center(
                          child: Text(
                            'Site Services',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),
                ),),
                Expanded(child:
                Container(
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                  ),
                  child:
                  Stack(
                    children: [Image.asset(
                      'images/ques.jpg',
                      width: 300 ,
                      height: 300,
                      // Adjust the fit based on your requirements
                    ),
                      const Positioned(
                        bottom: 10, // Adjust the position from the bottom as needed
                        left: 2, // Adjust the position from the left as needed
                        child: Center(
                          child: Text(
                            ' Questionnaire',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),
                ),),
              ],
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Log Out',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
