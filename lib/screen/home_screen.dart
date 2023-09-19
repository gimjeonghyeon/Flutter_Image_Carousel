import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

// StatefulWidget 정의
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

// HomeScreen의 State 정의
class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  final int InitPageIndex = 0;
  final int LastPageIndex = 5;

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        int? pageIndex = pageController.page?.toInt(); // 현재 페이지 인덱스 가져오기

        // 페이지 값이 없을 때 예외 처리
        if (pageIndex == null) {
          return;
        }

        // 마지막 페이지인 경우 분기 처리
        if (pageIndex == LastPageIndex) {
          pageIndex = InitPageIndex;
        } else {
          pageIndex++;
        }

        pageController.animateToPage(
            pageIndex,
            duration: const Duration(milliseconds: 500), // 애니메이션 연출 시간
            curve: Curves.ease,
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    // 상태바 색상을 변경하기 위한 코드 (SystemUiOverlayStyle.dark 로 하면 검정색으로 설정 됨)
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: PageView( // PageView 추가
        controller: pageController, // controller 등록
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