import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hero_games_assignment/src/models/response_model.dart';

final ApiHelper apiHelper = ApiHelper();

class ApiHelper {
  final collectionName;
  ApiHelper({this.collectionName});
  FirebaseFirestore? fireStoreDb = FirebaseFirestore.instance;

  read(String queryName, dynamic data) async {
    ResponseModel response = ResponseModel();
    try {
      QuerySnapshot query = await FirebaseFirestore.instance
          .collection(collectionName)
          .where(queryName, isEqualTo: data)
          .get();
      if (query.docs.isNotEmpty) {
        for (var queryDocumentSnapshot in query.docs) {
          var data = queryDocumentSnapshot.data() as Map<String, dynamic>;

          if (query.docs.length <= 1) {
            response.data = data;
          } else {
            if (response.data == null) {
              response.data = [];
            }
            response.data.add(data);
          }
        }

        response.hasError = false;
        response.message = "OK";
      }
      return response;
    } catch (e) {
      return null;
    }
  }

  delete() async {}
  save(dynamic data) async {
    ResponseModel response = ResponseModel();
    try {
      final dataCollection = fireStoreDb!.collection(collectionName);
      await dataCollection!.add(data.toJson()).then((value) {
        response.hasError = false;
      }).catchError((error) {
        response.hasError = true;
        response.message = error;
      });
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  update(String query, dynamic data) async {
    ResponseModel response = ResponseModel();
    try {
      final dataCollection = fireStoreDb!.collection(collectionName);
      QuerySnapshot query =
          await dataCollection.where('email', isEqualTo: data.email).get();
      var foundedId = query.docs.first.id;
      await dataCollection
          .doc(foundedId)
          .update({'query': data.hobbies}).then((value) {
        response.hasError = false;
      }).catchError((error) {
        response.hasError = true;
        response.message = error;
      });
    } catch (e) {}
  }
}
