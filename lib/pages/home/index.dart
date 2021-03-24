import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';
import 'package:getx_quick_start/pages/list_detail/index.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: ListView(
        children: [
          // 导航
          ListTile(
            title: Text("导航-命名路由-自动层级"),
            subtitle: Text('Get.toNamed("/home/list")'),
            onTap: () => Get.toNamed("/home/list"),
          ),
          ListTile(
            title: Text("导航-类对象"),
            subtitle: Text("Get.to(DetailView())"),
            onTap: () => Get.to(DetailView()),
          ),
          ListTile(
            title: Text("导航-清除上一个"),
            subtitle: Text("Get.off(DetailView())"),
            onTap: () => Get.off(DetailView()),
          ),
          ListTile(
            title: Text("导航-清除所有"),
            subtitle: Text("Get.offAll(DetailView())"),
            onTap: () => Get.offAll(DetailView()),
          ),
          ListTile(
            title: Text("导航-arguments传值+返回值"),
            subtitle: Text(
                'Get.toNamed("/home/list/detail", arguments: {"id": 999})'),
            onTap: () async {
              var result = await Get.toNamed("/home/list/detail",
                  arguments: {"id": 999});
              Get.snackbar("返回值", "success -> " + result["success"].toString());
            },
          ),
          ListTile(
            title: Text("导航-parameters传值+返回值"),
            subtitle: Text('Get.toNamed("/home/list/detail?id=666")'),
            onTap: () async {
              var result = await Get.toNamed("/home/list/detail?id=666");
              Get.snackbar("返回值", "success -> " + result["success"].toString());
            },
          ),
          ListTile(
            title: Text("导航-参数传值+返回值"),
            subtitle: Text('Get.toNamed("/home/list/detail/777")'),
            onTap: () async {
              var result = await Get.toNamed("/home/list/detail/777");
              Get.snackbar("返回值", "success -> " + result["success"].toString());
            },
          ),
          ListTile(
            title: Text("导航-not found"),
            subtitle: Text('Get.toNamed("/aaa/bbb/ccc")'),
            onTap: () => Get.toNamed("/aaa/bbb/ccc"),
          ),
          Divider(),

          // 组件
          ListTile(
            title: Text("组件-snackbar"),
            subtitle: Text('Get.snackbar("标题","消息",...)'),
            onTap: () => Get.snackbar(
              "标题",
              "消息",
            ),
          ),
          ListTile(
            title: Text("组件-dialog"),
            subtitle: Text('Get.defaultDialog(...)'),
            onTap: () => Get.defaultDialog(
              title: "标题",
              content: Column(
                children: [
                  Text("第1行"),
                  Text("第2行"),
                  Text("第3行"),
                ],
              ),
              textConfirm: "确认",
              textCancel: "取消",
              onConfirm: () => Get.back(),
            ),
          ),
          ListTile(
            title: Text("组件-bottomSheet"),
            subtitle: Text('Get.bottomSheet(...)'),
            onTap: () => Get.bottomSheet(
              Container(
                height: 200,
                color: Colors.white,
                child: Column(
                  children: [
                    Text("第1行"),
                    Text("第2行"),
                    Text("第3行"),
                  ],
                ),
              ),
            ),
          ),

          //
        ],
      ),
    );
  }
}