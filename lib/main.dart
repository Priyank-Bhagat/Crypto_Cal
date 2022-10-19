import 'dart:io';
import 'package:crypto_calc/Repository/asset_repo.dart';
import 'package:crypto_calc/bloc/asset/asset_bloc.dart';
import 'package:crypto_calc/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(
      const MaterialApp(
        home: CryptoCalc(),
      ),
    );

class CryptoCalc extends StatefulWidget {
  const CryptoCalc({Key? key}) : super(key: key);

  @override
  State<CryptoCalc> createState() => _CryptoCalcState();
}

class _CryptoCalcState extends State<CryptoCalc> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => AssetBloc(assetRepo: AssetIMPL()),
      child: Scaffold(
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
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenHeight * 0.05, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                         Text(
                          'Market Cap',
                          style: TextStyle(
                            color: Colors.grey[700] ,
                            //Color(0xff3a3841),
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.018,
                        ),
                        const Text(
                          "\Asset.6B",
                          style: TextStyle(color: Color(0xffd0d1d2), fontSize: 20),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.018,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.candlestick_chart,
                              color: Color(0xff189f59),
                              size: 18,
                            ),
                            Text(
                              '9.09%',
                              style: TextStyle(
                                color: Color(0xff189f59),
                                fontSize: 17,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                         Text(
                          '24h Volume',
                          style: TextStyle(
                            color: Colors.grey[700],
                            //Color(0xff3a3841),
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.018,
                        ),
                         Text(
                          "\$191B",
                          style: TextStyle(color: Color(0xffd0d1d2), fontSize: 20),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.018,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.candlestick_chart,
                              color: Color(0xff189f59),
                              size: 18,
                            ),
                            Text(
                              '6.09%',
                              style: TextStyle(
                                color: Color(0xff189f59),
                                fontSize: 17,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                         Text(
                          'BTC Sway ',
                          style: TextStyle(
                            color: Colors.grey[700],
                            //Color(0xff3a3841),
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.018,
                        ),
                        const Text(
                          "60.9%",
                          style: TextStyle(color: Color(0xffd0d1d2), fontSize: 20),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.018,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.candlestick_chart,
                              color: Color(0xff189f59),
                              size: 18,
                            ),
                            Text(
                              '7.09%',
                              style: TextStyle(
                                color: Color(0xff189f59),
                                fontSize: 17,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: SizeConfig.screenWidth * 0.8,
                child: const Divider(
                  height: 50,
                  thickness: 2,
                  color: Color(0xffd0d1d2),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 2),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: SizeConfig.blockSizeVertical * 4.2,
                            backgroundColor: const Color(0xff23222c),
                            child: FaIcon(
                              FontAwesomeIcons.bitcoin,
                              color: const Color(0xfff7a731),
                              size: SizeConfig.blockSizeVertical * 3.9,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const [
                                  Text(
                                    'Bitcoin',
                                    style: TextStyle(
                                        color: Color(0xffd0d1d2), fontSize: 18),
                                  ),
                                  Text(
                                    'BTC',
                                    style: TextStyle(
                                        color: Color(0xff5a5b62), fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:  [
                              Text(
                                "\$50,000",
                                style: TextStyle(
                                    color: Color(0xffd0d1d2), fontSize: 18),
                              ),
                              Text(
                                '7.09%',
                                style: TextStyle(
                                  color: Color(0xff189f59),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 2),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: SizeConfig.blockSizeVertical * 4.2,
                            backgroundColor: const Color(0xff23222c),
                            child: FaIcon(
                              FontAwesomeIcons.ethereum,
                              color: const Color(0xfff7a731),
                              size: SizeConfig.blockSizeVertical * 3.9,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const [
                                  Text(
                                    'Ethereum',
                                    style: TextStyle(
                                        color: Color(0xffd0d1d2), fontSize: 18),
                                  ),
                                  Text(
                                    'ETH',
                                    style: TextStyle(
                                        color: Color(0xff5a5b62), fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:  [
                              Text(
                                "\$18,00",
                                style: TextStyle(
                                    color: Color(0xffd0d1d2), fontSize: 18),
                              ),
                              Text(
                                '7.09%',
                                style: TextStyle(
                                  color: Color(0xff189f59),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 2),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: SizeConfig.blockSizeVertical * 4.2,
                            backgroundColor: const Color(0xff23222c),
                            child: FaIcon(
                              FontAwesomeIcons.litecoinSign,
                              color: const Color(0xfff7a731),
                              size: SizeConfig.blockSizeVertical * 3.9,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const [
                                  Text(
                                    'Litecoin',
                                    style: TextStyle(
                                        color: Color(0xffd0d1d2), fontSize: 18),
                                  ),
                                  Text(
                                    'LTC',
                                    style: TextStyle(
                                        color: Color(0xff5a5b62), fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:  [
                              Text(
                                "\$227",
                                style: TextStyle(
                                    color: Color(0xffd0d1d2), fontSize: 18),
                              ),
                              Text(
                                '9.09%',
                                style: TextStyle(
                                  color: Color(0xff189f59),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 2),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: SizeConfig.blockSizeVertical * 4.2,
                            backgroundColor: const Color(0xff23222c),
                            child: FaIcon(
                              FontAwesomeIcons.monero,
                              color: const Color(0xfff7a731),
                              size: SizeConfig.blockSizeVertical * 3.9,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const [
                                  Text(
                                    'Monero',
                                    style: TextStyle(
                                        color: Color(0xffd0d1d2), fontSize: 18),
                                  ),
                                  Text(
                                    'XMR',
                                    style: TextStyle(
                                        color: Color(0xff5a5b62), fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "\$70",
                                style: TextStyle(
                                    color: Color(0xffd0d1d2), fontSize: 18),
                              ),
                              Text(
                                '7.09%',
                                style: TextStyle(
                                  color: Color(0xff189f59),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 2),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: SizeConfig.blockSizeVertical * 4.2,
                            backgroundColor: const Color(0xff23222c),
                            child: FaIcon(
                              FontAwesomeIcons.dollarSign,
                              color: const Color(0xfff7a731),
                              size: SizeConfig.blockSizeVertical * 3.9,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const [
                                  Text(
                                    'USD Coin',
                                    style: TextStyle(
                                        color: Color(0xffd0d1d2), fontSize: 18),
                                  ),
                                  Text(
                                    'USDC',
                                    style: TextStyle(
                                        color: Color(0xff5a5b62), fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:  [
                              Text(
                                "\$1",
                                style: TextStyle(
                                    color: Color(0xffd0d1d2), fontSize: 18),
                              ),
                              Text(
                                '1.59%',
                                style: TextStyle(
                                  color: Color(0xff189f59),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}
