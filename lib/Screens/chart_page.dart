import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ChartPage extends StatefulWidget {


 final String? coinName;

  ChartPage({this.coinName, super.key});
  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

    // BlocProvider.of<AssetBloc>(context)
    //     .add(getAssetMarketEvent(coinname: widget.coinName.toString()));
  super.initState();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    child: WebView(
          initialUrl: "https://coinbase.com/price/${widget.coinName}",
          javascriptMode: JavascriptMode.unrestricted,
        ),
  );
  //  Card(
  //       elevation: 4,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(32),
  //       ),
  //       color: const Color(0xff020227),
  //       child: Padding(
  //         padding: EdgeInsets.only(top: deviceHeight(context) * .2),
  //         child: SizedBox(),
  //       ),
  //     );
}
