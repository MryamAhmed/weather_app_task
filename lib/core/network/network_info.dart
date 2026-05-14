import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl(this._internetConnection);

  final InternetConnection _internetConnection;

  @override
  Future<bool> get isConnected => _internetConnection.hasInternetAccess;
}

@module
abstract class NetworkModule {
  @lazySingleton
  InternetConnection get internetConnection => InternetConnection();
}
