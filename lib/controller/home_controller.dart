import 'package:get/get.dart';
import 'package:getx_demo/api/users_api.dart';
import 'package:getx_demo/models/user.dart';
import 'package:getx_demo/pages/profile_page.dart';

class HomeController extends GetxController {
  int _contador = 0;
  List<User> _users = [];
  bool _loading = true;

  int get contador => _contador;
  List<User> get users => _users;
  bool get loading => _loading;

  @override
  void onInit() {
    super.onInit();
    print('same as iniState');
  }

  @override
  void onReady() {
    super.onReady();
    print("On ready");
    this.loadUsers();
  }

  Future<void> loadUsers() async {
    final data = await UsersAPI.instance.getUsers(1);
    this._users = data;
    this._loading = false;
    update(['users']);
  }

  void incremtar() {
    this._contador++;
    update(['text'], _contador >= 10);
  }

  Future<void> showUserProfile(User user) async {
    final result = await Get.to<String>(
      ProfilePage(),
      arguments: user,
    );
    if (result != null) {
      print("😒 result $result");
    }
  }
}

// import 'package:get/get.dart';

// class HomeController extends GetxController {
//   int _contador = 0;

//   int get contador => _contador;

//   void incrementar() {
//     this._contador++;
//     update();
//   }
// }
