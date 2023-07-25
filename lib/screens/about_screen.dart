import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); //go back to previous page
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            'Tharusha Dilhara',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).highlightColor),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Welcome to the BMI Calculator app! We are committed to helping you maintain a healthy lifestyle. This simple and intuitive app allows you to calculate your Body Mass Index (BMI) and track your progress towards your fitness goals.About the Developer'
              '\n\nHi there! Im Tharusha, a passionate Flutter developer and fitness enthusiast. As a mobile app developer, I strive to create user-friendly and impactful applications. This BMI Calculator app is my way of contributing to your well-being and promoting healthy habits.',
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 60),
          const Text(
            'Follow Me:',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/facebook.png', height: 35, width: 35),
              const SizedBox(width: 10),
              Image.asset('assets/images/instagram.png', height: 35, width: 35),
              const SizedBox(width: 10),
              Image.asset('assets/images/whatsapp.png', height: 35, width: 35),
              const SizedBox(width: 10),
              Image.asset('assets/images/linkedin.png', height: 35, width: 35),
            ],
          ),
        ],
      ),
    );
  }
}
