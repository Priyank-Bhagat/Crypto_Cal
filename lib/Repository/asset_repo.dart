import 'dart:convert';
import 'package:crypto_calc/models/asset_chart.dart';
import 'package:crypto_calc/models/asset_response.dart';
import 'package:http/http.dart' as http;

abstract class AssetRepo {
  Future<AssetResponse> getCurrentPrice({required String coinName});
  Future<AssetPriceResponse> getChart({required String coinName});
}

class AssetIMPL extends AssetRepo{
  @override
  Future<AssetPriceResponse> getChart({required String coinName}) async {
     final response =
        await http.get(Uri.parse("api.coincap.io/v2/assets/$coinName"), headers: {
      "Content-Type": "application/json",
    });
    print(">>>>>>>>>>>>>>>>>>${"api.coincap.io/v2/assets/$coinName"}");
    print(">>>>>>>>>>>>>>>>>>${response.request?.method}");
    print(">>>>>>>>>>>>>>>>>>Request-body$coinName");
    print(">>>>>>>>>>>>>>>>>>${response.statusCode}");
    print(">>>>>>>>>>>>>>>>>>Response_body${response.body}");
    if (response.statusCode == 200) {
      print(response.body);
      return AssetPriceResponse.fromJson(jsonDecode(response.body));
    } 
    throw UnimplementedError();
  }

  @override
  Future<AssetResponse> getCurrentPrice({required String coinName}) async {
     final response =
        await http.get(Uri.parse("api.coincap.io/v2/assets/$coinName/history?interval=d1"), headers: {
      "Content-Type": "application/json",
    });
    print(">>>>>>>>>>>>>>>>>>${"api.coincap.io/v2/assets/$coinName/history?interval=d1"}");
    print(">>>>>>>>>>>>>>>>>>${response.request?.method}");
    print(">>>>>>>>>>>>>>>>>>Request-body$coinName");
    print(">>>>>>>>>>>>>>>>>>${response.statusCode}");
    print(">>>>>>>>>>>>>>>>>>Response_body${response.body}");
    if (response.statusCode == 200) {
      print(response.body);
      return AssetResponse.fromJson(jsonDecode(response.body));
    } 
    throw UnimplementedError();
  }

}
