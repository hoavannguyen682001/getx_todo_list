import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_list/app/core/utils/extension.dart';
import 'package:getx_todo_list/app/core/values/colors.dart';
import 'package:getx_todo_list/app/modules/home/controller.dart';

class DoneList extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  DoneList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeCtrl.doneTodos.isNotEmpty
          ? ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 3.0.wp, horizontal: 6.0.wp),
                  child: Text(
                    'Completed (${homeCtrl.doneTodos.length})',
                    style: TextStyle(
                        fontSize: 13.0.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ...homeCtrl.doneTodos
                    .map((element) => Dismissible(
                          key: ObjectKey(element),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) {
                            homeCtrl.deleteDoneTodo(element);
                            homeCtrl.service.showNotification(
                                id: 0,
                                title: 'Done todo',
                                body: 'Delete Success');
                          },
                          background: Container(
                            alignment: Alignment.centerRight,
                            color: Colors.red,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.done,
                                    color: blue,
                                  ),
                                ),
                                Text(
                                  element['title'],
                                  overflow: TextOverflow.visible,
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 2.85,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList()
              ],
            )
          : Container(),
    );
  }
}
