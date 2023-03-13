import 'dart:async';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef IndexedWidgetBuilder = Widget Function(
  BuildContext context,
  int index,
);
typedef FutureOrCallback = FutureOr<dynamic> Function();

class RefreshListView extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final int itemCount;
  final FutureOrCallback? onLoad;
  final FutureOrCallback? onRefresh;

  const RefreshListView({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.separatorBuilder,
    this.onLoad,
    this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
          header: const MaterialHeader(),
          footer: const MaterialFooter(),
          onLoad: onLoad,
          onRefresh: onRefresh,
          child: ListView.separated(

              itemBuilder: itemBuilder,
              separatorBuilder: separatorBuilder ??
                  (context, i) => const Divider(
                        height: .5,
                        thickness: 1,
                      ),
              itemCount: itemCount),
        );
  }
}
