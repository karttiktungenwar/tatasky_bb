
import 'package:flutter/material.dart';
import 'package:tatasky_bb/presentation/map_screen_activity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
          ],
        ),
      body: Center(
        child: Text("Home Screen"),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("shital"),
                accountEmail: Text("9326284907") ,
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/profile.png") ,
            ),decoration: BoxDecoration( color: Colors.deepPurple)
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){},
            ),
             ListTile(
              leading: Icon(Icons.person_add),
              title: Text("New Customer"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreenActivity()));
              },
            ),
             ListTile(
              leading: Icon(Icons.pending_actions),
              title: Text("Pending Journey"),
              onTap: (){},
            ),
             ListTile(
              leading: Icon(Icons.upload_file),
              title: Text("Doc Upload"),
              onTap: (){},
            ),
             ListTile(
              leading: Icon(Icons.book),
              title: Text("pre-Booking"),
              onTap: (){},
            ),
             ListTile(
              leading: Icon(Icons.person_search),
              title: Text("Customer Status"),
              onTap: (){},
            ),
             ListTile(
              leading: Icon(Icons.view_carousel),
              title: Text("360 View"),
              onTap: (){},
            ),
             ListTile(
              leading: Icon(Icons.sync),
              title: Text("Sync"),
              onTap: (){},
            ),
             ListTile(
              leading: Icon(Icons.help),
              title: Text("Self Help"),
              onTap: (){},
            ),
             ListTile(
              leading: Icon(Icons.design_services_sharp),
              title: Text("Service Request"),
              onTap: (){},
            ),
             ListTile(
              leading: Icon(Icons.school),
              title: Text("Training"),
              onTap: (){},
            ),
             ListTile(
              leading: Icon(Icons.payment),
              title: Text("Pay Later"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text("FAQ"),
              onTap: (){},
            ),

          ],
        ),
      ),


     
    );
  }
}
