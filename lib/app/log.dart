
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class Log {
  static RxList<DebugLogModel> debugLogs = <DebugLogModel>[].obs;

  static void addDebugLog(String content,Color? color){
    if(kReleaseMode){
      return;
    }

    try {
      debugLogs.insert(0, DebugLogModel(content, DateTime.now(),color: color));
    } catch (e, s) {
      if(kDebugMode){
        print(e);
      }
    }
  }

  static Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: false
    )
  );
  static void d(String message){
    addDebugLog(message, Colors.orange);
    logger.d('${DateTime.now()}\n$message');
  }

  static void i(String message){
    addDebugLog(message, Colors.blue);
    logger.i('${DateTime.now()}\n$message');
  }

  static void e(String message,StackTrace stackTrace){
    addDebugLog('$message\r\n\r\n$stackTrace', Colors.red);
    logger.e('${DateTime.now()}\n$message',stackTrace);

  }

  static void w(String message){
    addDebugLog(message, Colors.pink);
    logger.w('${DateTime.now()}\n$message');
  }

  static void logPrint(dynamic obj){
    addDebugLog(obj.toString(),Colors.red);
    if(kDebugMode){
      print(obj);
    }
  }
}

class DebugLogModel {
  final String content;
  final DateTime dateTime;
  final Color? color;

  DebugLogModel(this.content, this.dateTime, {this.color});
}
