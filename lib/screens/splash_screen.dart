import 'package:bitcoin_ticker/services/coin_data.dart';
import 'package:bitcoin_ticker/screens/price_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SplashScreen extends StatefulWidget {

  final String selectedCurrency;
  SplashScreen({ @required this.selectedCurrency });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    getCoinData();
  }

  void getCoinData() async {
    var btcData = await getCurrencyData('BTC', widget.selectedCurrency);
    var ethData = await getCurrencyData('ETH', widget.selectedCurrency);
    var ltcData = await getCurrencyData('LTC', widget.selectedCurrency);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PriceScreen(btc: btcData, eth: ethData, ltc: ltcData);
        }
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 100.0,
              height: 100.0,
              child: Image.asset('assets/bitcoin_logo.png'),
            ),
          ),
          SpinKitRing(
            color: Colors.white,
            size: 120.0,
            lineWidth: 3.0,
          ),
        ],
      ),
    );
  }
}
