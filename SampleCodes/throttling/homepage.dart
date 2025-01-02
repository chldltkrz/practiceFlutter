import 'package:flutter/material.dart';
import 'package:flutter_throttling_debouncing_example/debouncer.dart';
import 'package:flutter_throttling_debouncing_example/dummy_repository.dart';
import 'package:flutter_throttling_debouncing_example/throttler.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nicknameController = TextEditingController();
  final searchController = TextEditingController();

  final dummyRepo = DummyRepository();

  late final debouncer = Debouncer(
    duration: Duration(seconds: 3),
    callback: () async {
      final result = await dummyRepo.nicknameCk(nicknameController.text);
      print("Debouncer $result");
    },
  );

  late final throttler = Throttler(
    duration: Duration(seconds: 3),
    callback: () async {
      final result = await dummyRepo.search(searchController.text);
      print("Debouncer $result");
    },
  );

  void onNicknameChanged(String value) {
    print("debouncer.run()");
    debouncer.run();
  }

  void onSearch(String value) {
    print("throttler.run()");
    throttler.run();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('닉네임 체크'),
          TextField(
            onChanged: onNicknameChanged,
            controller: nicknameController,
          ),
          Text('검색'),
          TextField(
            onSubmitted: onSearch,
            controller: searchController,
          ),
        ],
      ),
    );
  }
}
