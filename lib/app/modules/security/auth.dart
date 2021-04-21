import 'package:cache/app/modules/database/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cache/app/modules/user/cacheuser.dart';

// Authentication issues link: https://stackoverflow.com/questions/59377277/undefined-class-authresult-in-flutter

class AuthService{
    final FirebaseAuth _auth = FirebaseAuth.instance;

    CacheUser _userFromFirebaseUser(User user) {

      return user != null ? CacheUser(uid: user.uid, email:user.email): null;
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

    // sign in with email and password
    Future logInWithEmailAndPassword(String email, String password) async {
      try {

        UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);


        User user = result.user;

        print(" \n \n \n USER!!! $user \n \n \n ");

        return _userFromFirebaseUser(user);
      } catch (error) {
        print(error.toString());
        return null;
      }
    }

    // Register with email and password
    Future signUpWithEmailAndPassword(String email, String password, String firstName, String lastName) async {
      try {

        UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        User user = result.user;
        await Database(uid: user.uid).addUserToDatabase(email, firstName, lastName);

        return _userFromFirebaseUser(user);

      }catch (error) {

        if(error.code == 'ERROR_EMAIL_ALREADY_IN_USE'){

          return 1;
        }else {

          print(error.toString());
          return null;
        }
      }
    }
    // sign out
    Future signOut() async {
      try {
        return await _auth.signOut();
      } catch (error) {
        print(error.toString());
        return null;
      }
    }
}