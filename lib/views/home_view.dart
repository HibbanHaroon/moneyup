import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Set the desired background color
        elevation: 0.0,
        automaticallyImplyLeading: true,
        // Other app bar properties
      ),
      body: const Text("Home Menu"),
    );
  }
}
