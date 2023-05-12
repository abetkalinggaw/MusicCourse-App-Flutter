import 'package:musikin_app/constant/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => IconColor(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Musikin App',
        home: LoginScreen(),
      ),
    );
  }
}
