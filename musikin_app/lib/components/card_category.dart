import '../constant/services.dart';

class CategoryCardView extends StatelessWidget {
  const CategoryCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          5,
          (index) {
            return GestureDetector(
              onTap: () {},
              child: Card(
                child: Column(
                  children: [
                    const Icon(Icons.favorite),
                    Text('Title $index'),
                    Text('Subtitle $index'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
