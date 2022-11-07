import 'package:app_authentication/common/datas/interfaces/interfaces.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityNetworkInfo implements INetworkInfo {
  ConnectivityNetworkInfo(this._connectivity);

  final Connectivity _connectivity;

  @override
  Future<bool> get isConnected async {
    final ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
