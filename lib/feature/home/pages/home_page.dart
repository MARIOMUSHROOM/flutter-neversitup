import 'package:flutter/material.dart';
import 'package:never_test/feature/home/controller/home_controller.dart';
import 'package:never_test/models/department_model.dart';
import 'package:never_test/models/product_model.dart';
import 'package:never_test/setting/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  @override
  void initState() {
    controller = HomeController(context);
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: controller,
      child: Consumer<HomeController>(builder: (context, con, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  child: const Text("Department carousel"),
                ),
                Container(
                  padding: EdgeInsets.zero,
                  height: 100,
                  child: ListView.builder(
                    itemCount: con.departments?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      DepartmentModel only = con.departments![index];
                      return GestureDetector(
                        onTap: () {
                          con.onSelectDepartment(only);
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          color: Colors.white,
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.zero,
                                width: double.infinity,
                                child: Text(
                                  "${only.name}",
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Image.network("${only.imageUrl}")
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                      "Product listing : ${con.departmentSelected?.name ?? ""}"),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: con.products?.length ?? 0,
                  itemBuilder: (_, index) {
                    ProductModel only = con.products![index];
                    return GestureDetector(
                      onTap: () {
                        showDetail(only);
                      },
                      child: Container(
                        height: 150,
                        color: Colors.white,
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.zero,
                                width: double.infinity,
                                child: Image.network(
                                  "${only.imageUrl}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.zero,
                                    width: double.infinity,
                                    child: Text(
                                      "${only.name}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.zero,
                                    width: double.infinity,
                                    child: Text(
                                      "${only.desc}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.zero,
                                    width: double.infinity,
                                    child: Text(
                                      "${only.price}",
                                      maxLines: 1,
                                      textAlign: TextAlign.end,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Future<void> showDetail(ProductModel item) async {
    return showDialog(
        context: context,
        builder: (context) {
          return Align(
            alignment: Alignment.center,
            child: Container(
              width: 370.0,
              decoration: BoxDecoration(
                color: backgroundWhite,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Builder(builder: (context) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10.0),
                                child: Text(
                                  "${item.name}",
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 22.0,
                                    color: appTextPrimaryColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 22.0),
                                child: Text(
                                  "${item.desc}",
                                  maxLines: 5,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    color: appTextSecondaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              "Close",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: appTextSecondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  })
                ],
              ),
            ),
          );
        });
  }
}
