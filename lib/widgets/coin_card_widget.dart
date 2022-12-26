import 'package:flutter/material.dart';
import '../services/coin_data.dart';


class CoinCard extends StatelessWidget {

  final CoinModel coinModel;

  CoinCard({ @required this.coinModel });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.white,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            width: 0.2,
            color: Colors.black54,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 ${coinModel.name} = ${coinModel.convertCurrencyValue.round()} ${coinModel.convertCurrencyName}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}