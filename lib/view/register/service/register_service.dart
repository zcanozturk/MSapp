import 'package:get_storage/get_storage.dart';
import 'package:vexana/vexana.dart';

import '../../../core/network/network_helper.dart';
import '../model/register_model.dart';

abstract class IregisterService {
  INetworkManager networkManager;
  IregisterService(this.networkManager);

  Future<List<registerModel>> fetchregisterItems();
}

class registerService extends IregisterService with NetworkHelper {
  registerService(INetworkManager networkManager) : super(networkManager);
  final box = GetStorage();

  @override
  Future<List<registerModel>> fetchregisterItems() async {
    final response = await networkManager.send<registerModel, List<registerModel>>(
      'https://jsonplaceholder.typicode.com/posts',
      
      //  queryParameters:
      //     Map.fromEntries([MapEntry('personelGuid', personelGuid)]),
      parseModel: registerModel(),
      method: RequestType.GET,
      // options: Options(// jwt can be written like in core/const/enums/get_s
      //   headers: {'Authorization':'Bearer '+ box.read('jwt') }
      // )
    );

    return response.data ?? [];
  }
}
