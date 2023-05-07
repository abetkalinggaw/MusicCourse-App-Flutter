// ignore_for_file: library_private_types_in_public_api, unused_field

import '../constant/services.dart';

class OngoingCourse extends StatefulWidget {
  const OngoingCourse({Key? key}) : super(key: key);

  @override
  _OngoingCourseState createState() => _OngoingCourseState();
}

class _OngoingCourseState extends State<OngoingCourse> {
  List<MyCourse> myCourses = [
    MyCourse('Guitar\nStrumming', 'Guitar', 'Bambang Wesker',
        'assets/images/playguitar.png'),
    MyCourse(
        'Piano Basic', 'Piano', 'Leon G Kennedy', 'assets/images/playpiano.png')
  ];

  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void navigateToDetailScreen(int index) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) =>
            const DetailsScreen(
                name: "Guitar\nStrumming", mentorName: 'Bambang Wesker'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: myCourses.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                var course = myCourses[index];
                return GestureDetector(
                  onTap: () => navigateToDetailScreen(index),
                  child: CardOngoingCourse(
                    image: course.image,
                    name: course.name,
                    category: course.category,
                    mentorName: course.mentorName,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          SmoothPageIndicator(
            controller: _pageController,
            count: myCourses.length,
            effect: ExpandingDotsEffect(
              activeDotColor: black,
              dotColor: gray,
              dotHeight: 10,
              dotWidth: 10,
              spacing: 5,
              expansionFactor: 3,
            ),
            onDotClicked: (int index) {
              setState(() {
                _currentPage = index;
              });
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            },
          ),
        ],
      ),
    );
  }
}
