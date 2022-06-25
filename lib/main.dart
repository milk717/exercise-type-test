import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

final firestore = FirebaseFirestore.instance;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  getFireBase() async{
    var result =  await firestore.collection('exercise').doc('exercise0').get();
    // return result.toString();
    print(result['NAME']);
  }

  @override
  void initState() {
    super.initState();
    getFireBase();
  }

  @override
  Widget build(BuildContext context) {
    getFireBase();
    return Scaffold(
      appBar: AppBar(title: Text('당신의 운동 유형은?'),),
      body: Text('so'),
    );
  }
}

