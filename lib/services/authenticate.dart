import 'package:cricketfantasy/model/userInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class UserData {
  Future<userInfo> createUser(String name, String email, String social_type,
      String social_id, String device_id) async {
    final Uri uri = Uri.parse("https://mero11.com/wb/social_login");

    final response = await http.post(uri, body: {
      "name": name,
      "email": email,
      "social_type": social_type,
      "social_id": social_id,
      "device_id": device_id
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseString =
          JSON.jsonDecode(response.body);
      print(response.body);

      userInfo userinfo = userInfo.fromJson(responseString);
      print(userinfo.data.email);
      return userinfo;
    } else {
      print("Unsuccessful");
      return null;
    }
  }
}

class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<User> signInWithGoogle({BuildContext context}) async {
    User user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }
    //print(user.displayName);
    return user;
  }

  Stream<User> get user {
    return auth.authStateChanges();
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final AccessToken result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final FacebookAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.token);

    //print(facebookAuthCredential);
    // Once signed in, return the UserCredential

    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    User user = userCredential.user;
    print(user);

    return user;
  }

  signOut() {
    auth.signOut();
  }
}



/////////////////////////////////////////// SAMPLE CODE ////////////////////////////////////////////////////////

/*class FacebookAuthService {
  final facebookLogin = FacebookLogin();

  // sign in with mobile number
  Future<bool> signIn() async {
    bool flag = false;
    final result = await facebookLogin.logIn(['email']);
    print(result);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        Uri uri = Uri.parse(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
        final graphResponse = await http.get(uri);
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        flag = true;
        break;

      case FacebookLoginStatus.cancelledByUser:
        flag = false;
        break;
      case FacebookLoginStatus.error:
        flag = false;
        break;
    }
    return flag;
  }

  Future logOut() async {
    facebookLogin.logOut();
  }

  /*Future otpRegistration(String otp, String Id) async {
    try {
      await _auth
          .signInWithCredential(
              PhoneAuthProvider.credential(verificationId: Id, smsCode: otp))
          .then((value) async {
        print("Function Executed");
        if (value.user != null) {
          ///redirect to home screen
          print(value.user.toString());
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // register with mobile number

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }*/
  /*try {
      _auth.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: Duration(seconds: 120),
          verificationCompleted: (AuthCredential credential) async {
            UserCredential result =
                await _auth.signInWithCredential(credential);
            User user = result.user;
            print("Sign In successful");
          },
          verificationFailed: (FirebaseAuthException exception) {
            print(exception.toString());
          },
          codeSent: (String verificationId, [int forceResendingToken]) {
            return verificationId;
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            return verificationId;
          });
    } catch (e) {
      print(e.toString());
      return null;
    }*/
  // create user obj based on firebase user
  /*User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }*/

  // auth change user stream
  /*Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }*/

  /*// sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      print(result.toString());
      //return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }*/

}*/
/*class GoogleAuthService {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  bool flag = false;

  Future<bool> signIn() async {
    try {
      final result = await _googleSignIn.signIn();
      print(result.toString());
      flag = true;
    } catch (err) {
      print(err);
      flag = false;
    }
    return flag;
  }

  Stream<GoogleSignInAccount> get status {
    return _googleSignIn.onCurrentUserChanged;
  }

  signOut() {
    _googleSignIn.signOut();
  }
}*/























