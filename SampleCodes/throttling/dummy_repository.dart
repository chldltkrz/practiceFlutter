class DummyRepository {
  Future<String> search(String query) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return "검색결과";
  }

  Future<bool> nicknameCk(String nickname) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }
}
