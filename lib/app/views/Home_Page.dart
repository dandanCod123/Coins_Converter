
import 'package:coins_converter/app/components/currency_bor.dart';
import 'package:coins_converter/app/controllers/home_controller.dart';
import 'package:coins_converter/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
   late HomeControler homeControler;
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();
  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  @override
  void initState() {
    super.initState();
    homeControler = HomeControler(fromText: fromText, toText: toText, toCurrency: toCurrency, fromCurrency: fromCurrency, currencies: []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 20),
          child: Column(
            children: [
              Image.asset(
                'assets/coins.jpg',
                height: 150,
                width: 150,
              ),
              SizedBox(
                height: 40,
              ),
              CurrencyBox(
                selectedCurrency: homeControler.toCurrency,
                controller: toText,
                items: homeControler.currencies,
                onChanged: (model) {
                  setState(
                    () {
                      homeControler.toCurrency = model;
                    },
                  );
                }, key: ,
              ),
              SizedBox(
                height: 10,
              ),
              CurrencyBox(
                selectedCurrency: homeControler.fromCurrency,
                items: homeControler.currencies,
                controller: fromText,
                onChanged: (model) {
                  setState(
                    () {
                      homeControler.fromCurrency = model;
                    },
                  );
                }, key: Key,
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                color: Colors.amber,
                child: Text('CONVERTER'),
                onPressed: () {
                  homeControler.convert();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}