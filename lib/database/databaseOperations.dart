import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DatabaseOperationFirebase {
  final db = FirebaseFirestore.instance;

  Future<void> createNewUserFirebase(String nome, String email, String CPF,
      String dataNascimento, String telefone) async {
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "nome": nome,
      "email": email,
      "CPF": CPF,
      "dataNascimento": dataNascimento,
      "telefone": telefone,
    };

// Add a new document with a generated ID
    await db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future<void> createUserWithEmailPass(context, String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // credential.user?.email;
    } on FirebaseAuthException catch (e) {
      print("O codigo é");
      print(e.code);
      if (e.code == 'weak-password') {//Codigo para senha fraca
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithEmailPass(context, String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
      );
    } on FirebaseAuthException catch (e) {
      print('O código é: ');
      print(e.code);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      else if (e.code == 'chanel-error') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Chanel Error')));
      } else if (e.code == 'invalid-credencial') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Credenciais inválidas')));
      }
    }
  }

}
