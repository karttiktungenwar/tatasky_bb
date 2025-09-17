import 'package:flutter/material.dart';

class DashboardHome extends StatelessWidget{
  const DashboardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardHomePageView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class DashboardHomePageView extends StatefulWidget {
  const DashboardHomePageView({super.key});
  @override
  _DashboardHomePageViewState createState() => _DashboardHomePageViewState();
}

class _DashboardHomePageViewState extends State<DashboardHomePageView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [

            ]
        )
    );
  }
}