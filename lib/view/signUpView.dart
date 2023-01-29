import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/uttils.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                focusNode: emailFocusNode,
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13)),
                    prefixIcon: const Icon(Icons.alternate_email)),
                onFieldSubmitted: (val) {
                  Utils.FieldFocusChanger(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
              const SizedBox(height: 13),
              ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    focusNode: passwordFocusNode,
                    controller: _passwordController,
                    obscuringCharacter: '*',
                    obscureText: _obsecurePassword.value,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13)),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
                            },
                            child: Icon(_obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility))),
                  );
                },
              ),
              SizedBox(height: height * 0.085),
              RoundButton(
                title: 'SigUp',
                loading: authViewModel.signUpLoading,
                onpress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBaeErrorMessage(
                        'Email Field Cannot Empty', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBaeErrorMessage(
                        'Password Field Cannot Empty', context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushBaeErrorMessage(
                        'Password Will Be Minimum 6 Digits', context);
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString()
                    };
                    authViewModel.signupApi(data, context);
                  }
                },
              ),
              SizedBox(height: height * 0.02),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Text("Already Have An Account"),
              )
            ]),
      ),
    );
  }
}
