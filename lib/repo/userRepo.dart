import 'package:cubit_demo/models/userPostModel.dart';

import '../models/userModel.dart';
import 'package:http/http.dart' as http;

class UserRepo {
  Future<List<UserModel>> getUsersData() async {
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    } else {
      throw Exception("Try Again later");
    }
  }

  Future<List<UserPost>> getUsersPostsData() async {
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      return userPostFromJson(response.body);
    } else {
      throw Exception("Try Again later");
    }
  }
}
