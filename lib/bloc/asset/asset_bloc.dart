import 'package:bloc/bloc.dart';
import 'package:crypto_calc/Repository/asset_repo.dart';
import 'package:crypto_calc/models/asset_chart.dart';
import 'package:crypto_calc/models/asset_response.dart';
import 'package:meta/meta.dart';

part 'asset_event.dart';
part 'asset_state.dart';

class AssetBloc extends Bloc<AssetEvent, AssetState> {
  AssetRepo assetRepo;
  AssetBloc({required this.assetRepo}) : super(AssetInitial()) {
    on<AssetEvent>((event, emit) async {
      if (event is getAssetEvent) {
        emit.call(AssetLoading());
        try {
          final AssetResponse model =
              await assetRepo.getCurrentPrice(coinName: event.coinname);
          emit.call(AssetSuccess(model: model));
        } catch (e) {
          print(e);
        }
      } else if (event is getAssetMarketEvent) {
        emit.call(AssetMarketLoading());
        try {
          final AssetPriceResponse model =
              await assetRepo.getChart(coinName: event.coinname);
          emit.call(AssetMarketSuccess(model: model));
        } catch (e) {
          print(e);
        }
      }
    });
  }
}
