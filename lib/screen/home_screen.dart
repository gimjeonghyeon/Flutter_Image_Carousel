import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView( // PageView 추가
        children: [1, 2, 3, 4, 5, 6] // 샘플 리스트 생성
            .map( // 위젯으로 매핑
        (number) => Image.asset(
            'assets/wallpapers/wallpaper_$number.jpg',
            fit: BoxFit.cover, // BoxFit.cover 를 설정하면 이미지가 최대한 전체화면을 차지하도록 늘어남
            ),
          )
        .toList(),
      ),
    );
  }

}