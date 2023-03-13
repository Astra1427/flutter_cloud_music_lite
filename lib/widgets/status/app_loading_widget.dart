import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<dynamic> loading(Future<dynamic> Function() block, {bool isShowLoading = true}) async{
  if(isShowLoading){
    showLoading();
  }
  try{
    return await block();
  }catch(e){
    rethrow;
  }
  finally{
    dismissLoading();
  }
}

void showLoading(){
  EasyLoading.show(status: '加载中');
}

void dismissLoading(){
  EasyLoading.dismiss();
}
