import 'package:flutter/material.dart';

void main() => runApp(const ProkritirRupApp());

class ProkritirRupApp extends StatelessWidget {
  const ProkritirRupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'প্রকৃতির রূপ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF218838)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF218838),
        foregroundColor: Colors.white,
        title: const Text('প্রকৃতির রূপ', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xFF218838),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(child: Text('আপনার মনের কথা লিখুন...', style: TextStyle(color: Colors.black54))),
                  FilledButton(onPressed: () {}, child: const Text('পোস্ট')),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFF218838),
                    child: Icon(Icons.eco, color: Colors.white),
                  ),
                  title: Text('প্রকৃতির রূপ'),
                  subtitle: Text('স্বাগতম আমাদের কমিউনিটিতে'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text('প্রকৃতির সৌন্দর্য উপভোগ করুন, ভালো মুহূর্তগুলো সবার সঙ্গে ভাগ করে নিন। 🌿'),
                ),
                const SizedBox(height: 8),
                const Divider(height: 1),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () => setState(() => _liked = !_liked),
                      icon: Icon(_liked ? Icons.favorite : Icons.favorite_border,
                          color: _liked ? Colors.red : null),
                      label: Text(_liked ? 'পছন্দ হয়েছে' : 'লাইক'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.comment_outlined),
                      label: const Text('মন্তব্য'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined),
                      label: const Text('শেয়ার'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) => setState(() => _selectedIndex = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'হোম'),
          NavigationDestination(icon: Icon(Icons.people_outline), label: 'বন্ধু'),
          NavigationDestination(icon: Icon(Icons.notifications_none), label: 'নোটিফিকেশন'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'প্রোফাইল'),
        ],
      ),
    );
  }
}
