// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously
import 'package:musikin_app/constant/services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offwhite,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              'musikin.',
              style: pBold.copyWith(
                color: black,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 35,
              right: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Welcome Back!",
                  style: bigTitle.copyWith(
                    color: black,
                  ),
                ),
                Text(
                  "Let's Login to Access Courses and Discover the Joy of Music",
                  style: heading3.copyWith(
                    color: black,
                  ),
                ),
              ],
            ),
          ),
          const _FormLogin(),
        ],
      ),
    );
  }
}

class _FormLogin extends StatefulWidget {
  const _FormLogin({Key? key}) : super(key: key);

  @override
  __FormLoginState createState() => __FormLoginState();
}

class __FormLoginState extends State<_FormLogin> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

  late SharedPreferences logindata;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    logindata = await SharedPreferences.getInstance();
    newUser = logindata.getBool('Login') ?? true;

    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false);
    }
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Username',
                  style: heading3.copyWith(
                    color: black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _username,
                  style: p1.copyWith(
                    color: black,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter Your Username',
                    hintStyle: p1.copyWith(
                      color: black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Username';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Password',
                  style: heading3.copyWith(
                    color: black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _password,
                  style: p1.copyWith(
                    color: black,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    hintStyle: p1.copyWith(
                      color: black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Password';
                    }
                    return null;
                  },
                  obscureText: true,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                final isValidForm = _formKey.currentState!.validate();
                String username = _username.text;
                String password = _password.text;
                if (isValidForm) {
                  logindata.setBool('Login', false);
                  logindata.setString('username', username);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                    (route) => false,
                  );
                }
              },
              child: Container(
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  "Login",
                  style: heading2.copyWith(
                    color: white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
