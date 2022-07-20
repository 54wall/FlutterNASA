import 'package:flutter/material.dart';

class ApodFavPage extends StatefulWidget {
  const ApodFavPage({Key? key}) : super(key: key);

  @override
  State<ApodFavPage> createState() => _ApodFavPageState();
}

class _ApodFavPageState extends State<ApodFavPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Fav'),
      ),
    );
  }
}
