import 'package:coins_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeControler {
  
  List<CurrencyModel> currencies;

  final TextEditingController toText;
  final TextEditingController fromText;

  CurrencyModel toCurrency;
  CurrencyModel fromCurrency;

  HomeControler({required this.toText, required this.fromText, required this.fromCurrency,required this.toCurrency,required this.currencies}){
    currencies = CurrencyModel.getCurrencies();
    toCurrency=currencies[0];
    fromCurrency=currencies[1];
  }

  void convert(){

    String text= toText.text;
    double valeu= double.tryParse(text) ?? 1.0;
    double returnValeu = 0;
    
    if (fromCurrency == 'Real') {
      returnValeu = valeu * toCurrency.real;
    }else if(fromCurrency == 'Dolar'){
      returnValeu = valeu * toCurrency.dolar;
    }else if(fromCurrency == 'Euro'){
      returnValeu = valeu * toCurrency.euro;
    }else if(fromCurrency == 'Bitcoin'){
      returnValeu = valeu * toCurrency.bitcoin;
    }

    fromText.text = returnValeu.toStringAsFixed(2);

  }
}