import 'dart:io';

import 'package:crypto_calc/bloc/asset/asset_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widget/line_chart_widget.dart';

class ChartPage extends StatefulWidget {
  String? coinName;

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
  Widget build(BuildContext context) => WebView(
        initialUrl: "https://coinbase.com/price/${widget.coinName}",
        javascriptMode: JavascriptMode.unrestricted,
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
