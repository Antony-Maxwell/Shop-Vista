import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_vista/presentation/auth/login.dart';

class OnBoardingOne extends StatefulWidget {
  const OnBoardingOne({super.key});

  @override
  State<OnBoardingOne> createState() => _OnBoardingOneState();
}

class _OnBoardingOneState extends State<OnBoardingOne> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ));
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demoData.length,
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _pageIndex = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnBoardingContent(
                      description: demoData[index].description,
                      gifPath: demoData[index].gifPath,
                      headLine: demoData[index].healine,
                    );
                  },
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                      demoData.length,
                      (index) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: indicator(
                              isActive: index == _pageIndex,
                            ),
                          ))
                ],
              ),
              Row(
                children: [
                  Spacer(),
                  SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class indicator extends StatelessWidget {
  const indicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}

class OnBorad {
  final String healine, gifPath, description;

  OnBorad(
      {required this.healine,
      required this.gifPath,
      required this.description});
}

final List<OnBorad> demoData = [
  OnBorad(
    description:
        'Welcome to a World of Limiteless Choice - Your Perfect Products Awaits',
    gifPath: 'assets/choose_product.json',
    healine: 'Choose Your Product',
  ),
  OnBorad(
    description:
        'Welcome to a World of Limiteless Choice - Your Perfect Products Awaits',
    gifPath: 'assets/select.json',
    healine: 'Select Payment Method',
  ),
  OnBorad(
    description:
        'Welcome to a World of Limiteless Choice - Your Perfect Products Awaits',
    gifPath: 'assets/delivery.json',
    healine: 'Delivery At Your Doorstep',
  ),
];

class OnBoardingContent extends StatelessWidget {
  OnBoardingContent(
      {required this.headLine,
      required this.gifPath,
      required this.description});

  String gifPath;
  String headLine;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 550,
                child: Lottie.asset(gifPath),
              ),
              Text(
                headLine,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  description,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
