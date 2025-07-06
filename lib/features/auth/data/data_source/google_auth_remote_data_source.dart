import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/core/errors/errors.dart';

abstract class GoogleAuthRemoteDataSource {
  Future<AuthResponse> googleAuth();
}

class GoogleAuthRemoteDataSourceImpl extends GoogleAuthRemoteDataSource {
  SupabaseClient userClient = Constant.supabase;
  @override
  Future<AuthResponse> googleAuth() async {
    try {
      final googleSignIn = GoogleSignIn(
        serverClientId:
            '385558626026-jnjce476cq3ove25mgt4vp9533gcobq1.apps.googleusercontent.com',
        scopes: ['email', 'profile'],
      );

      final account = await googleSignIn.signIn();
      if (account == null) {
        debugPrint('User cancelled the sign-in');
        throw extractErrorMessage('Signin was Cancelled');
      }
      final authentication = await account.authentication;
      final idToken = authentication.idToken;
      if (idToken == null) {
        debugPrint('-----ID--------------------$idToken');

        throw extractErrorMessage('Signin was Canceld');
      }
      final res = await userClient.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
      );
      return res;
    } on Exception catch (e) {
      debugPrint('-*-*-*-**-*-*-*-*-*-*-*${e.toString()}');
      throw extractErrorMessage(e);
    }
  }
}
