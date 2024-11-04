// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:todo_app/model/my_user.dart';  // Assuming the MyUser model is in the model directory
//
// class SharedPreferenceUtils {
//   static late SharedPreferences sharedPreferences;
//
//   static Future<void> init() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }
//
//   static Future<bool> saveData({required String key, required dynamic value}) {
//     if (value is int) {
//       return sharedPreferences.setInt(key, value);
//     } else if (value is double) {
//       return sharedPreferences.setDouble(key, value);
//     } else if (value is String) {
//       return sharedPreferences.setString(key, value);
//     } else {
//       return sharedPreferences.setBool(key, value);
//     }
//   }
//
//   static Object? getData({required String key}) {
//     return sharedPreferences.get(key);
//   }
//
//   static Future<bool> removeData({required String key}) async {
//     return await sharedPreferences.remove(key);
//   }
//
//   // Save MyUser object as a JSON string
//   static Future<bool> saveUser(MyUser user) {
//     String userJson = json.encode(user.toFireStore());  // Convert MyUser to JSON
//     return sharedPreferences.setString('user', userJson);
//   }
//
//   // Retrieve MyUser object from SharedPreferences
//   static MyUser? getUser() {
//     String? userJson = sharedPreferences.getString('user');
//     if (userJson == null) return null;
//
//     Map<String, dynamic> userMap = json.decode(userJson);  // Decode JSON to Map
//     return MyUser.fromFireStore(userMap);  // Convert map to MyUser object
//   }
// }