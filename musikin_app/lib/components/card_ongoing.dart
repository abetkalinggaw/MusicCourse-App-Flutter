import '../constant/services.dart';

class CardOngoingCourse extends StatelessWidget {
  final String name;
  final String category;
  final String mentorName;
  final String image;

  const CardOngoingCourse({
    required this.name,
    required this.category,
    required this.mentorName,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.circular(26),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fitWidth,
        ),
      ),
      height: 350,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Padding(
        padding: EdgeInsets.only(left: small, bottom: small, right: small),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: 68,
                    height: 36,
                    child: Center(
                      child: Text(
                        category,
                        style: pCategory.copyWith(
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: offwhite,
                borderRadius: BorderRadius.circular(26),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: pCardTitle),
                  Text(mentorName, style: pMentor),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
