import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final fakeApiProvider = Provider((_)=>FakeService());

class FakeService{
  Future<String>fetchGreetings()async{
    await Future.delayed(Duration(seconds: 2));
    //simukate a 30% chance of faliure
    if(Random().nextDouble()<0.3){
      throw Exception("Failed to fetch greetng");
    }
    return "Hello from Async";
  }
}