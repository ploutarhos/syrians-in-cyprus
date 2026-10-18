// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> anonymousSignIn() async {
  final supabase = SupaFlow.client;

  final existingUser = supabase.auth.currentUser;

  if (existingUser != null) {
    return existingUser.id;
  }

  final response = await supabase.auth.signInAnonymously();
  final user = response.user;

  if (user == null) {
    throw Exception('Anonymous sign-in failed');
  }

  return user.id;
}
