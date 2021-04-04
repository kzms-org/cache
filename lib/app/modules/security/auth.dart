import 'package:firebase_auth/firebase_auth.dart';
import 'package:cache/app/modules/user/cacheuser.dart';

// Authentication issues link: https://stackoverflow.com/questions/59377277/undefined-class-authresult-in-flutter

class AuthService{
    final FirebaseAuth _auth = FirebaseAuth.instance;

    CacheUser _userFromFirebaseUser(User user) {
      return user != null ? CacheUser(uid: user.uid): null;
    }

    Stream<CacheUser> get user {
      return _auth.authStateChanges().map(_userFromFirebaseUser);
    }

    // sign in anonymously
    Future logInAnonymously() async {
      try {
        UserCredential result = await _auth.signInAnonymously();
        User user = result.user;
        print(user);
        return _userFromFirebaseUser(user);
      } catch (e) {

        print(e.toString());
        return null;
      }
    }
}