import 'package:musikin_app/constant/services.dart';

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
    required this.onTap,
    super.key,
  });

  final Function() onTap;

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Consumer<IconColor>(
                  builder: (context, iconColor, child) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        icon: Icon(
                          iconColor.isLiked
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                        color: iconColor.isLiked ? Colors.red : Colors.white,
                        onPressed: () => iconColor.toggleLiked(),
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
