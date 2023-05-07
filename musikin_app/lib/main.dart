import '../constant/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Musikin App',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const LoginScreen(),
    );
  }
}
