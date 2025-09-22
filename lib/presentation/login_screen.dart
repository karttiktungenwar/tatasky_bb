import 'package:flutter/material.dart';
import 'package:tatasky_bb/data/services/api_service.dart';

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
  bool _isLoading = false; // Added: Loading state declaration
  late final userNumber = _controller.text.trim();

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    _controller.addListener((){
      setState(() {
        _isValid = _controller.text.length == 10;
      });
    });
  }

  Future<void> _sendOtp() async {
    setState(() {
      _isLoading = true;
    });
    // Show loading dialog

    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismiss by tapping outside
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      // Get OtpService from GetIt
      final apiService = getIt<APIService>();
      // Call sendOtp - it handles ClientService and API internally
      final response = await apiService.sendOtp(userNumber);

      // Handle success
      final status = response.status;
      final message = response.message;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message ?? 'OTP sent successfully!')),
      );

      // TODO: Navigate to OTP verification screen, pass resendTimer/dsaCode/userNumber
      // Navigator.push(context, MaterialPageRoute(builder: (_) => OtpScreen(userNumber: userNumber)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
      // Dismiss the loading dialog
      Navigator.of(context).pop();
    }
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
                        ? _sendOtp
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


