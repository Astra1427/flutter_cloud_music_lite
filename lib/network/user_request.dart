import 'package:flutter_cloud_music_lite/models/user/register_anonimous_model.dart';
import 'package:flutter_cloud_music_lite/network/RequestClient.dart';
import 'package:flutter_cloud_music_lite/network/apis.dart';
import 'package:flutter_cloud_music_lite/services/user_service.dart';

class UserRequest {
  /// 以游客身份登录
  Future<RegisterAnonymousModel> registerAnonymous() async {
    var result = await RequestClient.instance.get(Apis.register_anonymous);
    return RegisterAnonymousModel.fromRawJson(result.toString());
  }
}
