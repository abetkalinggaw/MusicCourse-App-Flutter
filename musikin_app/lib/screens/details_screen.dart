import '../constant/services.dart';

class DetailsScreen extends StatefulWidget {
  final String name;
  final String mentorName;

  const DetailsScreen({
    required this.name,
    required this.mentorName,
    Key? key,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F4EF),
          image: DecorationImage(
            image: AssetImage("assets/images/playguitar.png"),
            alignment: Alignment.topRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 80, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const customAppbar(
                    title: 'Course Detail',
                    rightBtn: 'assets/icons/heart.png',
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.name,
                    style: bigTitle.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: tagColor,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      'Beginner',
                      style: tag,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: Text(
                              widget.mentorName,
                              style: tag2.copyWith(
                                color: white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: offwhite,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Image(
                                image: AssetImage('assets/icons/clock.png'),
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '5h 30min',
                                style: tag2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: offwhite,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Image(
                                image: AssetImage('assets/icons/book.png'),
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '22 Sections',
                                style: tag2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Syllabus",
                            style: heading1.copyWith(color: Colors.black),
                          ),
                          const SizedBox(height: 20),
                          const CourseContent(
                            number: "01",
                            duration: "05.25",
                            title: "Welcome to the Course",
                            isDone: true,
                          ),
                          const CourseContent(
                            number: '02',
                            duration: "12.00",
                            title: "What is Guitar - Intro",
                            isDone: true,
                          ),
                          const CourseContent(
                            number: '03',
                            duration: "25.20",
                            title: "Basic Strumming",
                          ),
                          const CourseContent(
                            number: '04',
                            duration: "15.25",
                            title: "Strumming Chords",
                          ),
                          const CourseContent(
                            number: '05',
                            duration: "15.25",
                            title: "Fingerstyle",
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 20,
                      left: 20,
                      bottom: 20,
                      child: GestureDetector(
                        onTap: () {
                          CoolAlert.show(
                            context: context,
                            backgroundColor: white,
                            width: 20,
                            type: CoolAlertType.success,
                            title: 'Congratulations !!!',
                            text: "You have successfully enrolled the Courses",
                            confirmBtnText: 'Continue',
                            confirmBtnColor: accent,
                            onConfirmBtnTap: () {
                              setState(() {
                                _isVisible = false;
                              });
                            },
                          );
                        },
                        child: Visibility(
                          visible: _isVisible,
                          child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.black,
                            ),
                            child: Text(
                              "Enroll Now",
                              style: heading2.copyWith(
                                color: white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
