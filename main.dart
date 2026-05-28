import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  
  final List<Widget> _pages = const [
    HomePage(),
    MoviePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 360,
          height: 640,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: _pages[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0xFF111111), 
              selectedItemColor: Colors.white,         
              unselectedItemColor: Colors.grey.shade500, 
              selectedLabelStyle: const TextStyle(
                fontSize: 12, 
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: const TextStyle(fontSize: 12),
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view_rounded), 
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.movie_outlined), 
                  label: 'Movie',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded), 
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'DASHBOARD', 
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w900, 
            letterSpacing: 2, 
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 10, 
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.1,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5), 
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200, width: 1.5),
            ),
            child: Center(
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black,
                child: Text(
                  '${index + 1}', 
                  style: const TextStyle(
                    fontSize: 12, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'MOVIES', 
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w900, 
            letterSpacing: 2, 
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: const Center(
              child: Icon(
                Icons.movie_filter_rounded,
                size: 40,
                color: Colors.black26,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.w800, 
              letterSpacing: 1.5, 
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 35),
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1.5), 
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: const Icon(
                Icons.person_outline_rounded,
                size: 50,
                color: Colors.black87, 
              ),
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildProfileItem(Icons.badge_outlined, 'PAB 2026'),
                _buildProfileItem(Icons.phone_iphone_rounded, '+62 812-3456-7890'), 
                _buildProfileItem(Icons.alternate_email_rounded, 'livofdeat@gmail.com'),
                _buildProfileItem(Icons.map_outlined, 'Surabaya'),
                _buildProfileItem(Icons.camera_alt_outlined, '@akmmalb'),
                Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String text) {
    return Column(
      children: [
        Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
          child: Row(
            children: [
              Icon(icon, color: Colors.black87, size: 24), 
              const SizedBox(width: 20),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF222222), 
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}