import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  /// 1. 유저에게 어떤 타입을 낼 것인지 물어보는 질의창

  // stdin 으로 들어오는 객체는 상수이기 때문에 final
  // stdin 으로 null 값이 들어올 수 있어서 String? userInput 으로 변수를 받거나 null 인 경우에 대한 처리를 해주어야 한다.(~~ ?? 'Error';)
  print('가위, 바위, 보 중 하나를 정해서 입력해 주세요.');
  final String userInput =
      stdin.readLineSync(encoding: utf8) ?? 'Error'; // 콘솔 입력을 받는 함수

  print(userInput);

  /// 2. 컴퓨터가 낼 타입이 어떤 것인지 결정하는 함수
  const selectList = ['가위', '바위', '보'];
  final cpuInput = selectList[Random().nextInt(3)];

  print(cpuInput);

  /// 3. 유저의 타입과 컴퓨터 타입에 대한 결과를 계산할 함수

  final result = getResult(userInput, cpuInput);
  print(result);

}

String getResult(String userInput, String cpuInput) {
  const cpuWin = 'CPU가 승리하였습니다.';
  const playerWin = 'Player가 승리하였습니다.';
  const draw = '비겼습니다.';
  String result = draw;

  switch (userInput) {
    case '가위':
      if (cpuInput == '바위') result = cpuWin;
      if (cpuInput == '보') result = playerWin;
    case '바위':
      if (cpuInput == '가위') result = playerWin;
      if (cpuInput == '보') result = cpuWin;
    case '보':
      if (cpuInput == '바위') result = playerWin;
      if (cpuInput == '가위') result = cpuWin;
    default : result = '올바른 값을 입력해 주세요.';
  }

  return result;
}
