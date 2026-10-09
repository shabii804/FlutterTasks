
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoaib Arshad Resume',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ResumePage(),
    );
  }
}

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text('Shoaib Arshad Resume'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              color: Colors.blue[800],
              child: Column(
                children: [

                  const CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage('assets/profile.jpeg'),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'SHoaib Arshad',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'Software Engineering Student',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // Contact information
            resumeSection(
              'Contact Information',
              Icons.contact_mail,
              [
                'Email: shoaibsai1118@gmail.com',
                'Phone: +92 3086519867',
                'Location: Islamabad',
              ],
            ),

            resumeSection(
              'Career Objective',
              Icons.flag,
              [
                'I am a Software Engineering student '
                    'who is interested in programming, '
                    'software development and learning '
                    'new technologies. I want to improve '
                    'my skills and gain practical experience.',
              ],
            ),

            resumeSection(
              'Education',
              Icons.school,
              [
                'BS Software Engineering',
                'Riphah Internatinal university ,Islamabad',
                '2024 - 2028',
              ],
            ),

            resumeSection(
              'Technical Skills',
              Icons.computer,
              [
                'HTML and CSS',
                'JavaScript',
                'Flutter and Dart',
                'React',
                'Database Management',
              ],
            ),

            // Projects
            resumeSection(
              'Projects',
              Icons.work,
              [
                'Spend smart expense manager app',
                'Student Management System',
                'Web Development Projects',
              ],
            ),

            // Languages
            resumeSection(
              'Languages',
              Icons.language,
              [
                'English',
                'Urdu',
                'Punjabi'
                ,
              ],
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  Widget resumeSection(
      String title,
      IconData icon,
      List<String> details,
      ) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                Icon(icon, color: Colors.blue[800]),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const Divider(height: 25),

            ...details.map(
                  (detail) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  detail,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}