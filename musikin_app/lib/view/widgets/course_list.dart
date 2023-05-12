import 'package:musikin_app/constant/services.dart';

class CourseContent extends StatelessWidget {
  final String number;
  final String duration;
  final String title;
  final bool isDone;
  const CourseContent({
    Key? key,
    required this.number,
    required this.duration,
    required this.title,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: lightGray,
            ),
            child: Center(
              child: Text(
                number,
                style: heading1.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$duration \n",
                  style: p1.copyWith(
                    color: darkGray,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: title,
                  style: pBold.copyWith(
                    color: black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.withOpacity(isDone ? 1 : .5),
            ),
            child: Image.asset(
              'assets/icons/play.png',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
