import 'package:flutter/material.dart';

class ApodDetailPage extends StatefulWidget {
  const ApodDetailPage({Key? key}) : super(key: key);

  @override
  State<ApodDetailPage> createState() => _ApodDetailPageState();
}

class _ApodDetailPageState extends State<ApodDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Detail'),
      ),
    );
  }
}
