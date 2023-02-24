// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

// class ReactiveController extends GetxController {
//   var mall_id = ''.obs;
//   var prd_id = ''.obs;
//   var prd_name = ''.obs;
//   var exposure = ''.obs;
//   var click_count = ''.obs;
//   var click_per = ''.obs;
//   var click_per_cash = ''.obs;
//   var dates = ''.obs;
//   var type = ''.obs;

//   var x = ''.obs;
//   var y = 0.obs;
//   var y1 = 0.obs;
//   List<ChartData> data = [
//     ChartData('Germany', 128, 129, 101,1),
//     ChartData('Russia', 123, 92, 93,1),
//     ChartData('Norway', 107, 106, 90,1),
//     ChartData('USA', 87, 95, 71,1),
//   ].obs;

//   Future<void> sqlread() async {
//     var url = Uri.http('127.0.0.1:3000', '/cpc');
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
//       print(jsonResponse);
//       for (var i = 0; i < jsonResponse.length; i++) {
//         jsonResponse[i];
//         data.add(ChartData(jsonResponse[i].prd_name, jsonResponse[i].exposure, jsonResponse[i].click_count, y2))
//       }
//       // var itemCount = jsonResponse['mall_id'];
//       // print('Number of books about http: $itemCount.');
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }
// }

// class ChartData {
//   ChartData(this.x, this.y, this.y1, this.y2, this.y3);
//   final String x;
//   final double? y;
//   final double? y1;
//   final double? y2;
//   final double? y3;
//    final double? y3;
// }
