import 'package:flutter/material.dart';

import '../core/di/service_locator.dart';


class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginScreenPageView();
  }
}
class LoginScreenPageView extends StatefulWidget {
  const LoginScreenPageView({super.key});
  @override
  _LoginScreenPageViewState createState() => _LoginScreenPageViewState();
}

class _LoginScreenPageViewState extends State<LoginScreenPageView> {
  final TextEditingController _controller = TextEditingController();
  bool _isValid = false;

  @override
  Future<void> initState() async {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    await setupServiceLocator();
    _controller.addListener((){
      setState(() {
        _isValid = _controller.text.length == 10;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top half: image
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/login_top.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Bottom half: login form with LiquidGlass effect
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hey! Welcome back',
                    style:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Enter your mobile number to login',
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 24),
                  // Mobile number input
                  TextField(
                    controller: _controller,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      prefixText: '+91 ',
                      border: OutlineInputBorder(),
                      suffixIcon: _isValid
                          ? Icon(Icons.check_circle, color: Colors.green)
                          : null,
                    ),
                  ),
                  SizedBox(height: 24),
                  // Send OTP button
                  ElevatedButton(
                    onPressed: _isValid
                        ? () {
                      // Your OTP send logic here
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      _isValid ? Colors.pinkAccent : Colors.grey,
                      minimumSize: Size(double.infinity, 48),
                    ),
                    child: Text('Send OTP'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


