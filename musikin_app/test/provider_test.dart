import 'package:musikin_app/constant/services.dart';

void main() {
  test('Toggle liked should change IconColor isLiked property', () {
    final iconColor = IconColor();

    expect(iconColor.isLiked, false);
    iconColor.toggleLiked();
    expect(iconColor.isLiked, true);
    iconColor.toggleLiked();
    expect(iconColor.isLiked, false);
  });
}
