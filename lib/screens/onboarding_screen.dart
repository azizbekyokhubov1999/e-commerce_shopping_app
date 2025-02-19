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
        image: ""
    ),
    OnboardingData(
        title: "Easy Shopping Experience",
        description: "Shop with ease and get your favorite items delivered right to your doorstep",
        image: ""
    ),
    OnboardingData(
        title: "Secure payments",
        description: "Multiple secure payments options for safe and hassle-free transactions",
        image: ""
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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

