import 'package:flutter/material.dart';
import 'package:toonfilx/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffE7626C),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xff232B55),
          ),
        ),
        cardColor: const Color(0xffF4EDDB),
      ),
      home: const HomeScreen(),
    );
  }
}

// - **scaffoldBackgroundColor**: 전체 화면의 배경색을 지정합니다.
// - **textTheme**: 텍스트 스타일을 설정하며, `headlineLarge` 스타일은 전체 앱에서 기본 제목 색상을 설정합니다.
// - **cardColor**: 카드와 버튼 같은 컴포넌트의 배경색을 지정합니다.
