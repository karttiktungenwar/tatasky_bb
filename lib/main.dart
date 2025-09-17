import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tatasky_bb/presentation/dashboard_home.dart';
import 'package:tatasky_bb/presentation/login_screen.dart';

import 'core/di/service_locator.dart';
import 'core/storage/shared_prefs_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LiquidGlassPageView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LiquidGlassPageView extends StatefulWidget {
  const LiquidGlassPageView({super.key});

  @override
  _LiquidGlassPageViewState createState() => _LiquidGlassPageViewState();
}

class _LiquidGlassPageViewState extends State<LiquidGlassPageView> {
  final prefs = getIt<SharedPrefsService>();
  final PageController _pageController = PageController();
  final int _numPages = 3;
  int _currentPage = 0;
  late bool? value = prefs.getBool("your_key");

  List<String> images = [
    'assets/image/onboard_screen_01.png',
    'assets/image/onboard_screen_02.png',
    'assets/image/onboard_screen_03.png',
  ];

  void _onSkip() {
    if(value = true){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  void _onNext() {
    if (_currentPage < _numPages - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      // Last page action, e.g., navigate away
      if(value = true){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _numPages,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ],
              );
            },
          ),
          // Bottom overlay with buttons and indicator
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip button
                  TextButton(
                    onPressed: _onSkip,
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  // Page indicator
                  Expanded(
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: _numPages,
                        effect: WormEffect(
                          dotColor: Colors.white54,
                          activeDotColor: Colors.white,
                          dotHeight: 8,
                          dotWidth: 8,
                        ),
                      ),
                    ),
                  ),
                  // Next button
                  TextButton(
                    onPressed: _onNext,
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}