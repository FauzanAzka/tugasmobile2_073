import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PageListUsers(),
    );
  }
}

class PageListUsers extends StatelessWidget {
  const PageListUsers({Key? key});

  // List pengguna
  final List<Map<String, dynamic>> users = [
    {'id': 'user1', 'name': 'John Doe', 'email': 'john@example.com'},
    {'id': 'user2', 'name': 'Jane Smith', 'email': 'jane@example.com'},
    // Tambahkan pengguna lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Users'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user['name'].toString()),
            subtitle: Text(user['email'].toString()),
            onTap: () {
              // Navigasi ke halaman detail pengguna saat item diklik
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailPage(user: user),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class UserDetailPage extends StatelessWidget {
  final Map<String, dynamic> user;

  const UserDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('User ID: ${user['id']}'),
            Text('Name: ${user['name']}'),
            Text('Email: ${user['email']}'),
            // Tambahkan detail pengguna lainnya di sini
          ],
        ),
      ),
    );
  }
}
