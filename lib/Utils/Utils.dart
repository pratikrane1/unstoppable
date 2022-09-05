import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


mixin Utils {
  static String getString(BuildContext context, String key) {
    if (key != '') {
      return tr(key) ?? '';
    } else {
      return '';
    }
  }

  static formatPrice(double price) => '\$ ${price.toStringAsFixed(2)}';
  static formatDate(DateTime date) => DateFormat.yMd().format(date);


  //for currency
 static String getCurrencyPerLocale(String locale){
   var format = NumberFormat.simpleCurrency(locale: locale);
   String currencySymbol=format.currencySymbol;
   print("CURRENCY SYMBOL ${format.currencySymbol}"); // $
   print("CURRENCY NAME ${format.currencyName}");
    return currencySymbol;

 }

}