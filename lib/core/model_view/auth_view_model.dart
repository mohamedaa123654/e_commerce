import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/view/screens/control_view.dart';
import 'package:e_commerce/view/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../services/firestore_user.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  // var googleAccount = Rx<GoogleSignInAccount?>(null);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // FacebookLogin _facebookLogin=FacebookLogin();
  String? email, password, name, pic;
  final Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  final LocalStorageData localStorageData = Get.find();

  // login() async {
  //   googleAccount.value = await _googleSignIn.signIn();
  //   Get.offAll(ControlView());
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentUser(_auth.currentUser!.uid);
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(ControlView());
    });
  }
  // void signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //   // Once signed in, return the UserCredential
  //   FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  //   // saveUser(user);
  // }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        getCurrentUser(value.user!.uid);
      });

      Get.offAll(ControlView());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // showSnackBar(context, 'Wrong password provided for that user.');
      }
    }
  }

  Future register() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) {
        saveUser(user);
        Get.offAll(ControlView());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // showSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // showSnackBar(context, 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void saveUser(UserCredential? user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
      userId: user?.user?.uid,
      email: user?.user?.email,
      name: name == null ? user?.user?.displayName : name,
      pic: pic == null ? user?.user?.photoURL : pic,
    ));
    setUser(UserModel(
      userId: user?.user?.uid ?? 'null',
      email: user?.user?.email ?? 'null',
      name: name ?? 'null',
      pic: pic ?? 'user?.user?.photoURL',
    ));
  }

  void getCurrentUser(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data() as Map<dynamic, dynamic>));
    });
  }

  void setUser(UserModel? userModel) async {
    await localStorageData.setUser(userModel);
  }
}
