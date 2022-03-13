import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/Model/order_history_api/order_history_api.dart';

List<OrderHistoryApi> order_history_list = [];

List<OrderHistoryApi> order_active_main_list = [];
List<OrderHistoryApi> order_scheduled_list = [];

List<OrderHistoryApi> order_history_active_list = [];
List<OrderHistoryApi> order_history_failed_list = [];

//Seperate List for Active Status Order
List<OrderHistoryApi> get_order_active() {
  if (order_history_list.isEmpty) {
    return order_active_main_list;
  } else {
    Iterable gettt = order_history_list
        .where((element) => element.orderStatus!.contains("Active"));
    gettt.forEach((element) {
      order_active_main_list.add(element);
    });

    return order_active_main_list;
  }
}

//Seperate List for Completed Status Order
List<OrderHistoryApi> get_order_history_active() {
  if (order_history_list.isEmpty) {
    return order_history_active_list;
  } else {
    Iterable gettt = order_history_list
        .where((element) => element.orderStatus!.contains("Completed"));
    gettt.forEach((element) {
      order_history_active_list.add(element);
    });

    return order_history_active_list;
  }
}

//Seperate List for Failed Status Order
List<OrderHistoryApi> get_order_history_failed() {
  if (order_history_list.isEmpty) {
    return order_history_failed_list;
  } else {
    Iterable gettt = order_history_list
        .where((element) => element.orderStatus!.contains("Failed"));
    gettt.forEach((element) {
      order_history_failed_list.add(element);
    });

    return order_history_failed_list;
  }
}

//Seperate List for Scheduled Status Order
List<OrderHistoryApi> get_order_scheduled() {
  if (order_history_list.isEmpty) {
    return order_scheduled_list;
  } else {
    Iterable gettt = order_history_list
        .where((element) => element.orderStatus!.contains("Scheduled"));
    gettt.forEach((element) {
      order_scheduled_list.add(element);
    });

    return order_scheduled_list;
  }
}

//Order History All Seperator completed and failed

List<OrderHistoryApi> get_order_history_all() {
  if (order_history_list.isEmpty) {
    return order_scheduled_list;
  } else {
    Iterable gettt = order_history_list
        .where((element) => element.orderStatus!.contains("CompletedFailed"));
    gettt.forEach((element) {
      order_scheduled_list.add(element);
    });

    return order_scheduled_list;
  }
}

//Api call function

Future<List<OrderHistoryApi>> get_order_history_api() async {
  final response = await http.get(Uri.parse(
      "https://persecuted-admissio.000webhostapp.com/restaurant/restaurant_api/orders.php"));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    order_active_main_list.clear();
    order_scheduled_list.clear();
    order_history_list.clear();

    order_history_active_list.clear();
    order_history_failed_list.clear();
    for (Map i in data) {
      order_history_list.add(OrderHistoryApi.fromJson(i));
    }
    get_order_active();
    get_order_scheduled();
    get_order_history_active();

    get_order_history_failed();
    print(order_history_list.length);
    print(order_history_active_list.length);
    print(order_history_failed_list.length);
    return order_history_list;
  } else {
    return order_history_list;
  }
}
