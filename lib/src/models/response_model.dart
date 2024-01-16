import 'package:cloud_firestore/cloud_firestore.dart';

class ResponseModel {
  String? message;
  bool? hasError;
  dynamic data;

  ResponseModel({this.message, this.hasError, this.data});
}
