import 'dart:async';
import 'package:faker/faker.dart';
import 'package:get/get.dart';

class SocketClientController extends GetxController {
  RxString _message = "".obs;
  RxString get message => _message;
  RxString _searchText = "".obs;

  Timer _timer;

  final _faker = Faker();

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() {
    // ever(_searchText, (_) {
    //   print(_searchText.value);
    // });

    // once(_counter, (_) {
    //   print("🔄 _counter has been changed ${_counter.value}");
    // });

    interval(
      _searchText,
      (_) {
        print(_searchText.value);
      },
      time: Duration(microseconds: 500),
    );

    _timer = Timer.periodic(
      Duration(seconds: 5),
      (timer) {
        _message.value = _faker.lorem.sentence();
      },
    );

    // _timerCounter = Timer.periodic(
    //   Duration(seconds: 1),
    //   (timer) {
    //     _counter.value++;
    //   },
    // );
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer.cancel();
    }

    super.onClose();
  }

  setSearchText(String text) {
    _searchText.value = text;
  }
}
