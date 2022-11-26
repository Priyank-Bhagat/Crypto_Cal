import 'dart:developer';
import 'dart:io';
import 'package:crypto_calc/Screens/chart_page.dart';
import 'package:crypto_calc/Screens/size_config.dart';
import 'package:crypto_calc/bloc/asset/asset_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CryptoCalc extends StatefulWidget {
  const CryptoCalc({Key? key}) : super(key: key);

  @override
  State<CryptoCalc> createState() => _CryptoCalcState();
}

class _CryptoCalcState extends State<CryptoCalc> {
  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

    BlocProvider.of<AssetBloc>(context).add(GetAllAssets());
    super.initState();
  }


  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List<FaIcon> icons = [
      FaIcon(
        FontAwesomeIcons.bitcoin,
        color: const Color(0xfff7a731),
        size: SizeConfig.blockSizeVertical * 4.9,
      ),
      FaIcon(
        FontAwesomeIcons.ethereum,
        color: const Color(0xfff7a731),
        size:  SizeConfig.blockSizeVertical * 4.9,
      ),
      FaIcon(
        FontAwesomeIcons.circleDollarToSlot,
        color: const Color(0xfff7a731),
        size:  SizeConfig.blockSizeVertical * 4.9,
      ),
      FaIcon(
        FontAwesomeIcons.b,
        color: const Color(0xfff7a731),
        size:  SizeConfig.blockSizeVertical * 4.9,
      ),
      FaIcon(
        FontAwesomeIcons.dollarSign,
        color: const Color(0xfff7a731),
        size:  SizeConfig.blockSizeVertical * 4.9,
      ),
    ];


    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<AssetBloc>(context).add(GetAllAssets());
        },
        backgroundColor: Colors.red[700],
        child: FaIcon(
          FontAwesomeIcons.rotate,
          color: const Color(0xff151420),
        ),
      ),
      backgroundColor: const Color(0xff151420),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => exit(0),
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Uri emailopen = Uri.parse('mailto:helperdev@email.me?');
              if (await launchUrl(emailopen)) {
                //dialer opened
              } else {
                //dailer is not opened
              }
            },
            icon: const Icon(
              Icons.feedback,
            ),
          ),
        ],
        title: const Text('Live Prices'),
        backgroundColor: const Color(0xff151420),
        centerTitle: true,
      ),
      body: BlocBuilder<AssetBloc, AssetState>(
        builder: (context, state) {
          if (state is AllAssetsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AllAssetsSuccess) {
            var data = state.model.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: deviceHeight(context) * 0.05,
                        bottom: deviceHeight(context) * 0.015),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Market Cap',
                            style: TextStyle(
                              color: Colors.grey[700],
                              //Color(0xff3a3841),
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '24h Volume',
                            style: TextStyle(
                              color: Colors.grey[700],
                              //Color(0xff3a3841),
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            'BTC Sway ',
                            style: TextStyle(
                              color: Colors.grey[700],
                              //Color(0xff3a3841),
                              fontSize: 17,
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: deviceHeight(context) * 0.018,
                        bottom: deviceHeight(context) * 0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "\$${(data?.elementAt(0).marketCapUsd?.substring(0, 3))} B",
                              style: TextStyle(
                                  color: Color(0xffd0d1d2), fontSize: 25),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "\$${data?.elementAt(0).volumeUsd24Hr?.substring(0, 2)} B",
                              style: TextStyle(
                                  color: Color(0xffd0d1d2), fontSize: 25),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "${data!.elementAt(0).supply.toString().substring(0, 2)} B",
                              style: TextStyle(
                                  color: Color(0xffd0d1d2), fontSize: 25),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: deviceHeight(context) * 0.018,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.candlestick_chart,
                            color: double.parse(
                                        data.elementAt(0).changePercent24Hr!) >=
                                    0
                                ? Color(0xff189f59)
                                : Colors.red,
                            size: 18,
                          ),
                          Text(
                            '${data.elementAt(0).changePercent24Hr?.substring(0, 4)}%',
                            style: TextStyle(
                              color: double.parse(data
                                          .elementAt(0)
                                          .changePercent24Hr!) >=
                                      0
                                  ? Color(0xff189f59)
                                  : Colors.red,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.candlestick_chart,
                            color: Color(0xff189f59),
                            size: 18,
                          ),
                          Text(
                            '${data.elementAt(0).priceUsd?.substring(4, 7)}%',
                            style: TextStyle(
                              color: Color(0xff189f59),
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.candlestick_chart,
                            color: Color(0xff189f59),
                            size: 18,
                          ),
                          Text(
                            '0.09%',
                            style: TextStyle(
                              color: Color(0xff189f59),
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: deviceWidth(context) * 0.8,
                    child: const Divider(
                      height: 80,
                      thickness: 2,
                      color: Color(0xffd0d1d2),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChartPage(
                                        coinName: data.elementAt(index).id,
                                      )));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: deviceWidth(context) * 0.02,
                              vertical: deviceHeight(context) * 0.015),
                          child: Row(children: [
                            CircleAvatar(
                                radius: deviceHeight(context) * 0.04,
                                backgroundColor: Color(0xff23222c),
                                child: icons.elementAt(index)),
                            Container(
                              width: deviceWidth(context) * 0.25,
                              padding: const EdgeInsets.only(left: 11.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    data.elementAt(index).name.toString(),
                                    style: TextStyle(
                                        color: Color(0xffd0d1d2), fontSize: 18),
                                  ),
                                  Text(
                                    data.elementAt(index).symbol.toString(),
                                    style: TextStyle(
                                        color: Color(0xff5a5b62), fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: deviceWidth(context) * 0.37,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "\$${data.elementAt(index).priceUsd?.substring(0, 7)}",
                                  style: TextStyle(
                                      color: Color(0xffd0d1d2), fontSize: 18),
                                ),
                                Text(
                                  '${data.elementAt(index).changePercent24Hr?.substring(0, 5)}%',
                                  style: TextStyle(
                                    color: double.parse(data
                                                .elementAt(index)
                                                .changePercent24Hr!) >=
                                            0
                                        ? Color(0xff189f59)
                                        : Colors.red,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            )
                          ]),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
