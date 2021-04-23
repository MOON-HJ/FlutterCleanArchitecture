abstract class Network {
  Future<bool> get hasConnection;
}

class NetworkImpl implements Network {

  
  @override
  Future<bool> get hasConnection => throw UnimplementedError();

}
