import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo_list/app/data/services/notification_services.dart';
import 'package:getx_todo_list/app/data/services/storage/service.dart';
import 'package:getx_todo_list/app/modules/home/binding.dart';
import 'package:getx_todo_list/app/modules/home/view.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(
    () => StorageService().init(),
  );

  NotificationService().initializePlatformNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo List',
      home: const HomePage(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      builder: EasyLoading.init(),
    );
  }
}
