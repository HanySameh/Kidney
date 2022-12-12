import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidney/models/user_model.dart';

import '../core/utils/enums.dart';
import '../services/auth_services.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  AuthFormType authFormType;

  AuthController({
    required this.auth,
    this.email = '',
    this.password = '',
    this.authFormType = AuthFormType.register,
  });

  void updateEmail(String email) => copyWith(email: email);

  void updatePassword(String password) => copyWith(password: password);

  void copyWith({
    String? email,
    String? password,
    AuthFormType? authFormType,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authFormType = authFormType ?? this.authFormType;
    notifyListeners();
  }

  bool isLoading = true;
  Future<void> submit({
    required String email,
    required String pass,
  }) async {
    try {
      if (authFormType == AuthFormType.login) {
        await auth.loginWithEmailAndPassword(email, pass);
        loadingState();
      } else {
        await auth.registerWithEmailAndPassword(email, pass);
        loadingState();
      }
    } catch (e) {
      loadingState();
      rethrow;
    }
  }

  void loadingState() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> createUser({
    required String name,
    required String email,
    required int age,
    required String gender,
    required double weight,
    required int phoneNumber,
    required String address,
    required String uId,
    required List<String> diseases,
  }) async {
    UserModel userModel = UserModel(
      name: name,
      email: email,
      age: age,
      gender: gender,
      weight: weight,
      phoneNumber: phoneNumber,
      address: address,
      diseases: diseases,
    );
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(userModel.toJson());
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    notifyListeners();
  }
}
