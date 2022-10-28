import 'package:flutter/foundation.dart';
import 'package:lisa_app/main.dart';
import 'app_environment.dart';

Future<void> main() async {
  // try {
  //   FirebaseFirestore.instance.useFirestoreEmulator('10.0.2.2', 8080);
  //   await FirebaseAuth.instance.useAuthEmulator('10.0.2.2', 9099);
  // } catch (e) {
  //   debugPrint(e.toString());
  // }
  mainCommon(AppEnvironment.DEV);
}
