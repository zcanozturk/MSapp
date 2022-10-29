import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instance;

  static VexanaManager get instance {
    if (_instance != null) return _instance!;
    _instance = VexanaManager._init();
    return _instance!;
  }

  static const String _iosBaseUrl = '';
  static const String _androidBaseUrl = '';

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager(
      isEnableLogger: true,
      onRefreshFail: () {
        print('ON REFRESH FAIL');
      },
      interceptor: InterceptorsWrapper(onError: (DioError e, handler) async {
        //FILE LOGGER FOR ERRORS WILL BE COME

        print('NETWORK MANAGER ERROR HAPPENED');

        return handler.next(e);
      }),
      options: BaseOptions(

          //maxRedirects: 1,
          )
      //baseUrl: Platform.isAndroid ? _androidBaseUrl : _iosBaseUrl),
      );
}
