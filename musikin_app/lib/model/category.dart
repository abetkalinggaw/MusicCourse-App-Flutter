class Category {
  final String name;
  final int numOfClasses;
  final String image;

  Category(this.name, this.numOfClasses, this.image);
}

List<Category> categories = categoriesData
    .map(
      (item) => Category(
        item['name'],
        item['classes'],
        item['image'],
      ),
    )
    .toList();

List<Map<String, dynamic>> categoriesData = [
  {"name": "Guitar", 'classes': 17, 'image': "assets/images/guitar.png"},
  {"name": "Piano", 'classes': 25, 'image': "assets/images/piano.jpg"},
  {"name": "Trumpet", 'classes': 13, 'image': "assets/images/trumpet.jpg"},
  {"name": "Drum", 'classes': 17, 'image': "assets/images/drummer.jpg"},
];
