import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/billet_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BilletListController {
  final billetsNotifier = ValueNotifier<List<BilletModel>>(<BilletModel>[]);
  List<BilletModel> get billets => billetsNotifier.value;
  set billets(List<BilletModel> value) => billetsNotifier.value = value;

  BilletListController() {
    getBillets();
  }
  void getBillets() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList('billets');
      billets = response!.map((e) => BilletModel.fromJson(e)).toList();
    } catch (e) {}
  }

  void dispose() {
    billetsNotifier.dispose();
  }
}