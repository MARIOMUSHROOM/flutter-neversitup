import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:never_test/commons/toast_v3_widget.dart';
import 'package:never_test/models/department_model.dart';
import 'package:never_test/models/product_model.dart';
import 'package:never_test/service/department_api.dart';

class HomeController extends ChangeNotifier {
  HomeController(this.context);
  BuildContext context;
  List<DepartmentModel>? departments = [];
  List<ProductModel>? products = [];
  DepartmentModel? departmentSelected;

  init() async {
    await _fetchData();
    if (departments != null) {
      departmentSelected = departments!.first;
      _fetchProducts(departmentSelected!.id!);
    }
    notifyListeners();
  }

  _fetchData() async {
    try {
      var response = await DepartmentAPI().getDepartments();
      if (response.statusCode != 200) {
        throw "lost";
      }
      var data = jsonEncode(response.data);
      departments = departmentModelFromJson(data);
      notifyListeners();
    } catch (e) {
      log("error : $e");
      ToastWidget(context).show(message: "$e");
    }
  }

  _fetchProducts(String productId) async {
    try {
      var response = await DepartmentAPI().getProducts(productId);
      if (response.statusCode != 200) {
        throw "lost";
      }
      var data = jsonEncode(response.data);
      products = productModelFromJson(data);
      notifyListeners();
    } catch (e) {
      log("error : $e");
      ToastWidget(context).show(message: "$e");
    }
  }

  onSelectDepartment(DepartmentModel department) {
    products = [];
    departmentSelected = department;
    _fetchProducts(departmentSelected!.id!);
    notifyListeners();
  }
}
