import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/billet_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBilletController {
  final formKey = GlobalKey<FormState>();
  BilletModel billetModel = BilletModel();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? 'O nome não pode ser vazio' : null;
  String? validateDueDate(String? value) =>
      value?.isEmpty ?? true ? 'A data de vencimento não pode ser vazia' : null;
  String? validateValue(double value) =>
      value == 0 ? 'Insira um valor maior que R\$ 0,00' : null;
  String? validateBarcode(String? value) =>
      value?.isEmpty ?? true ? 'O código do boleto não pode ser vazio' : null;

  void onChange({String? name, String? dueDate, double? value, String? barcode}) {
    billetModel = billetModel.copyWith(
        name: name, dueDate: dueDate, value: value, barcode: barcode);
  }

  Future<void> saveBillet() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      final instance = await SharedPreferences.getInstance();
      final billets = instance.getStringList('billets') ?? <String>[];
      billets.add(billetModel.toJson());
      await instance.setStringList('billets', billets);
      return;
    }
  }
}