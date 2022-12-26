import 'package:bitcoin_ticker/services/networking.dart';
import 'package:flutter/cupertino.dart';


const String apiKey = 'B381278E-C441-4196-BCA5-996131027229';
const String coinApiURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinModel {
  final String name;
  final String convertCurrencyName;
  final double convertCurrencyValue;

  CoinModel({
    @required this.name,
    @required this.convertCurrencyName,
    @required this.convertCurrencyValue,
  });
}

Future<CoinModel> getCurrencyData(String name, String currencyName) async {
  NetworkHelper networkHelper = NetworkHelper(
      url: '$coinApiURL/$name/$currencyName?apikey=$apiKey');

  var coinData = await networkHelper.getData();

  CoinModel btc = CoinModel(
    name: name,
    convertCurrencyName: currencyName,
    convertCurrencyValue: coinData['rate'],
  );

  return btc;
}

const List<String> currenciesList = [
  'USD',
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
