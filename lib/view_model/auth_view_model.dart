import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/repositry/auth_respository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/uttils.dart';

class AuthViewModel with ChangeNotifier {
  final _myrepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setSignupLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myrepo.loginApi(data).then((value) {
      setLoading(true);
      Utils.flushBaeErrorMessage('Login Succesful', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    })
      ..onError((error, stackTrace) {
        setLoading(false);
        if (kDebugMode) {
          Utils.flushBaeErrorMessage(error.toString(), context);
          print(error.toString());
        }
      });
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    _myrepo.loginApi(data).then((value) {
      setSignupLoading(true);
      Utils.flushBaeErrorMessage('SignUp Succesful', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    })
      ..onError((error, stackTrace) {
        setSignupLoading(false);
        if (kDebugMode) {
          Utils.flushBaeErrorMessage(error.toString(), context);
          print(error.toString());
        }
      });
  }
}
