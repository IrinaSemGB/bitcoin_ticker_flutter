import 'package:bitcoin_ticker/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/coin_data.dart';
import '../widgets/coin_card_widget.dart';
import 'dart:io' show Platform;



class PriceScreen extends StatefulWidget {

  final CoinModel btc;
  final CoinModel eth;
  final CoinModel ltc;

  PriceScreen({
    @required this.btc,
    @required this.eth,
    @required this.ltc,
  });

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedCurrency = 'USD';
  bool showGetCurrencyButton = false;

  DropdownButton getDropdownButton() {
    List<DropdownMenuItem> listCurrencyItems = [];

    for (String currency in currenciesList) {
      listCurrencyItems.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }

    return DropdownButton(
      value: selectedCurrency,
      items: listCurrencyItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          showGetCurrencyButton = true;
        });
      },
    );
  }
  CupertinoPicker getCupertinoPicker() {
    List<Text> listPickerItems = [];
    for (String currency in currenciesList) {
      listPickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
        background: Colors.transparent,
      ),
      children: listPickerItems,
      useMagnifier: true,
      magnification: 1.2,
      itemExtent: 34.0,
      onSelectedItemChanged: (selectedIndex) {
        selectedCurrency = currenciesList[selectedIndex];
        setState(() {
          showGetCurrencyButton = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('🤑 Coin Ticker'),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CoinCard(coinModel: widget.btc),
                CoinCard(coinModel: widget.eth),
                CoinCard(coinModel: widget.ltc),
              ],
            ),
            Column(
              children: [
                Visibility(
                  visible: showGetCurrencyButton,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SplashScreen(selectedCurrency: selectedCurrency);
                        }),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          'GET PRICE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18.0),
                Container(
                  height: 150.0,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 30.0),
                  color: Colors.black.withOpacity(0.8),
                  child: Platform.isIOS ? getCupertinoPicker() : getDropdownButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


