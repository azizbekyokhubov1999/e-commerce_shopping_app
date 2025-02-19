import 'package:ecommerce_shopping_app/screens/welcome_screen.dart';
import 'package:ecommerce_shopping_app/theme/theme.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
        title: "Discover Latest Trends",
        description: "Explore our vest collection of trendy and fashionable items curvated just for you",
        image: "assets/images/onboarding1.png"
    ),
    OnboardingData(
        title: "Easy Shopping Experience",
        description: "Shop with ease and get your favorite items delivered right to your doorstep",
        image: "assets/images/onboarding2.png"
    ),
    OnboardingData(
        title: "Secure payments",
        description: "Multiple secure payments options for safe and hassle-free transactions",
        image: "assets/images/onboarding3.png"
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
              onPageChanged: (int page){
              setState(() {
                _currentPage = page;
              });
              },
            itemCount: _pages.length,
              itemBuilder: (context, index) {
              return OnboardingPage(data: _pages[index]);
              },
          ),

          Positioned(
            top: 48,
              right: 24,
              child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => WelcomeScreen(),
                    ),
                    );
                  },
                  child: Text("Skip",
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  )
              )
          ),

          Positioned(
            bottom: 40,
              left: 24,
              right: 24,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        _pages.length,
                        (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: _currentPage == index ? 24 : 8,
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor.withOpacity(
                              _currentPage == index ? 1 : 0.3,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      if(_currentPage > 0)
                        Expanded(
                            child: OutlinedButton(
                                onPressed: (){
                                  _pageController.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  side: BorderSide(color: AppTheme.primaryColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text("Previous"),
                            )
                        )
                    ],
                  )

                ],
              )
          )
        ],
      ),
    );
  }
}

class OnboardingData{
  final String title;
  final String description;
  final String image;

  OnboardingData({
    required this.title,
    required this.description,
    required this.image
  });

}


class OnboardingPage extends StatelessWidget {

  final OnboardingData data;
  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
              data.image,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          SizedBox(height: 40),
          Text(data.title,
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(data.description,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 16,
              height: 1.5
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

