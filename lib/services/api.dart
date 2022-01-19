import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import 'package:netzstore/config.dart';
import 'package:netzstore/models/category.dart';
import 'package:netzstore/models/customer.dart';
import 'package:netzstore/models/login.dart';
import 'package:netzstore/models/product.dart';




class APIService{

  Future<bool> createCustomer(CustomerModel model) async{

    var authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.secret)
    );

    bool ret = false;

    try {
      var response = await Dio().post(
        Config.url + Config.customerURL,
        data: model.toJson(),
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: "application/json"
          }
        )
      );

      if(response.statusCode == 201){
         ret = true;
      }

    } on DioError catch (e) {
      
      if(e.response?.statusCode == 404){
        ret = false;
      }else {
        ret = false;
      }

      print(e.response!.data['message']);

    }

    return ret;
    
  }

  Future<LoginReponseModel> loginCustomer(
    String username, 
    String password
  ) async {

    late LoginReponseModel model;

    try {
      var response = await Dio().post(
        Config.tokenURL,
        data: {
          "username": username,
          "password": password
        },
        options: Options(
         headers: {
            HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
         }
        )
      );

      if(response.statusCode == 200){
        model = LoginReponseModel.fromJson(response.data);
      }
      
    } on DioError catch (e) {

      print(e.message);

    }

    return model;

  }

  Future<List<Category>> getCategories() async {

    List<Category> data = <Category>[];

    try {

      String url = Config.url +
                   Config.categoriesURL +
                   "?consumer_key=${Config.key}&consumer_secret=${Config.secret}";
      
      var response = await Dio().get(
        url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json"
          },
        ),
      );

      if(response.statusCode == 200){

        data = (response.data as List)
        .map(
          (i) => Category.fromJson(i)
        )
        .toList();

      }

    } on DioError catch (e) {
      debugPrint(e.response.toString());
    }

    return data;

  }

   Future<List<Product>> getProducts(String tagName) async {

    List<Product> data = <Product>[];

    try {

      String url = Config.url +
                   Config.productsURL +
                   "?consumer_key=${Config.key}&consumer_secret=${Config.secret}&tag=$tagName";
      
      var response = await Dio().get(
        url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json"
          },
        ),
      );

      if(response.statusCode == 200){

        data = (response.data as List)
        .map(
          (i) => Product.fromJson(i)
        )
        .toList();

      }

    } on DioError catch (e) {
      debugPrint(e.response.toString());
    }

    return data;

  }

}