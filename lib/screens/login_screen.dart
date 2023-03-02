import 'package:flutter/material.dart';
import 'package:flutter_movil_application/responsive.dart';
import 'package:flutter_movil_application/routes.dart';
import 'package:flutter_movil_application/widgets/loading_modal_widget.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  final txtEmail = TextFormField(
    decoration: const InputDecoration(
        label: Text('Email User'), border: OutlineInputBorder()),
  );
  final txtPass = TextFormField(
    obscureText: true,
    decoration: const InputDecoration(
        label: Text('Password User'), border: OutlineInputBorder()),
  );
  final spaceHorizontal = const SizedBox(
    height: 10,
  );
  final btnFacebook = SocialLoginButton(
    buttonType: SocialLoginButtonType.facebook,
    onPressed: () {},
  );
  final btnGoogle = SocialLoginButton(
    buttonType: SocialLoginButtonType.google,
    onPressed: () {},
  );
  final btnGithub = SocialLoginButton(
    buttonType: SocialLoginButtonType.github,
    onPressed: () {},
  );

  final imgLogo = Image.asset(
    'assets/logo.png',
    height: 100,
  );

  @override
  Widget build(BuildContext context) {
    final txtRegister = Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: const Text(
            'Crear cuenta',
            style:
                TextStyle(fontSize: 18, decoration: TextDecoration.underline),
          )),
    );

    final btnEmail = SocialLoginButton(
      buttonType: SocialLoginButtonType.generalLogin,
      onPressed: () {
        isLoading = true;
        setState(() {});
        Future.delayed(const Duration(milliseconds: 4000)).then((value) {
          isLoading = false;
          setState(() {});
          Navigator.pushNamed(context, '/dash');
        });
      },
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Responsive(
            mobile: MobileLoginScreen(
                spaceHorizontal: spaceHorizontal,
                imgLogo: imgLogo,
                txtEmail: txtEmail,
                txtPass: txtPass,
                btnEmail: btnEmail,
                btnFacebook: btnFacebook,
                btnGoogle: btnGoogle,
                btnGithub: btnGithub,
                txtRegister: txtRegister),
            tablet: DesktopLoginScreen(
                spaceHorizontal: spaceHorizontal,
                imgLogo: imgLogo,
                txtEmail: txtEmail,
                txtPass: txtPass,
                btnEmail: btnEmail,
                btnFacebook: btnFacebook,
                btnGoogle: btnGoogle,
                btnGithub: btnGithub,
                txtRegister: txtRegister),
            desktop: DesktopLoginScreen(
                spaceHorizontal: spaceHorizontal,
                imgLogo: imgLogo,
                txtEmail: txtEmail,
                txtPass: txtPass,
                btnEmail: btnEmail,
                btnFacebook: btnFacebook,
                btnGoogle: btnGoogle,
                btnGithub: btnGithub,
                txtRegister: txtRegister),
          ),
          isLoading ? const LoadingModalWidget() : Container()
        ],
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    super.key,
    required this.spaceHorizontal,
    required this.imgLogo,
    required this.txtEmail,
    required this.txtPass,
    required this.btnEmail,
    required this.btnFacebook,
    required this.btnGoogle,
    required this.btnGithub,
    required this.txtRegister,
  });

  final SizedBox spaceHorizontal;
  final Image imgLogo;
  final TextFormField txtEmail;
  final TextFormField txtPass;
  final SocialLoginButton btnEmail;
  final SocialLoginButton btnFacebook;
  final SocialLoginButton btnGoogle;
  final SocialLoginButton btnGithub;
  final Padding txtRegister;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: .5,
              fit: BoxFit.cover,
              image: AssetImage('assets/fondo.jpg'))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              spaceHorizontal,
              imgLogo,
              spaceHorizontal,
              txtEmail,
              spaceHorizontal,
              txtPass,
              spaceHorizontal,
              btnEmail,
              spaceHorizontal,
              btnFacebook,
              spaceHorizontal,
              btnGoogle,
              spaceHorizontal,
              btnGithub,
              spaceHorizontal,
              txtRegister,
            ]),
          ],
        ),
      ),
    );
  }
}

class DesktopLoginScreen extends StatelessWidget {
  const DesktopLoginScreen({
    super.key,
    required this.spaceHorizontal,
    required this.imgLogo,
    required this.txtEmail,
    required this.txtPass,
    required this.btnEmail,
    required this.btnFacebook,
    required this.btnGoogle,
    required this.btnGithub,
    required this.txtRegister,
  });

  final SizedBox spaceHorizontal;
  final Image imgLogo;
  final TextFormField txtEmail;
  final TextFormField txtPass;
  final SocialLoginButton btnEmail;
  final SocialLoginButton btnFacebook;
  final SocialLoginButton btnGoogle;
  final SocialLoginButton btnGithub;
  final Padding txtRegister;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: .5,
              fit: BoxFit.cover,
              image: AssetImage('assets/fondo.jpg'))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Row(
              children: [
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      spaceHorizontal,
                      Expanded(child: imgLogo),
                    ])),
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      spaceHorizontal,
                      txtEmail,
                      spaceHorizontal,
                      txtPass,
                      spaceHorizontal,
                      btnEmail,
                      spaceHorizontal,
                      btnFacebook,
                      spaceHorizontal,
                      btnGoogle,
                      spaceHorizontal,
                      btnGithub,
                      spaceHorizontal,
                      txtRegister
                    ])),
              ],
            )
          ],
        ),
      ),
    );
  }
}
