// import 'dart:convert';
//
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
// import '../models/user.dart';
//
// class UserController extends GetxController {
//   var userData = Rx<UserData>(UserData());  // UserData is your model class
//   var isLoading = false.obs;
//
//   get http => null;
//
//   // Fetch user data from API or storage
//   Future<void> fetchUserData() async {
//     try {
//       isLoading.value = true;
//       // Fetch user data here (e.g., from API or local storage)
//       final response = await http.get(Uri.parse('your_api_url'));
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         userData.value = UserData.fromJson(data); // Assuming UserData is a model class
//       } else {
//         // Handle error
//       }
//     } catch (e) {
//       // Handle exception
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
