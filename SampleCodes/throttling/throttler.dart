import 'dart:async';

class Throttler {
  Throttler({
    required this.duration,
    required this.callback,
  });

  // 디바운싱 시간을 설정할 Duration
  final Duration duration;
  // 디바운싱 시간 카운팅할 Timer
  Timer? _timer;
  // 쓰로틀링이 진행 중인지 여부를 추적
  bool _isThrottling = false;
  // 실행될 함수
  void Function() callback;

  void run() {
    // 만약 쓰로틀링 중이라면 호출하지 않음
    if (_isThrottling) {
      return;
    }
    // 처음 실행할 때는 바로 실행하고, 이후엔 쓰로틀링 시작
    callback();
    _isThrottling = true;
    // 지정된 시간(duration) 후에 다시 콜백을 실행할 수 있게 함
    _timer = Timer(duration, () {
      _isThrottling = false; // 쓰로틀링 종료
    });
  }

  // 위젯이 화면에서 사라질 때 대비하여 타이머 중지시키는 메서드 구현
  void dispose() {
    _timer?.cancel();
  }
}
