import 'package:musikin_app/constant/services.dart';

class IconColor with ChangeNotifier {
  bool _isLiked = false;

  bool get isLiked => _isLiked;

  void toggleLiked() {
    _isLiked = !_isLiked;
    notifyListeners();
  }
}
