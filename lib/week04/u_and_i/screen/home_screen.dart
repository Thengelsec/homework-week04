import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],  // 핑크 배경색 적용
      body: SafeArea(   // 시스템 UI 피해서 UI 그리기
        top: true,
        bottom: false,
        child: Column(
          // 위아래 끝에 위젯 배치
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // 반대축 최대 크기로 늘리기
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(
              // 하트 눌렀을 때 실행할 함수 전달하기
              onHeartPressed: onHeartPressed,
            ),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }

  void onHeartPressed(){  // 하트 눌렀을 때 실행할 함수
    print('클릭');
  }
}

class _DDay extends StatelessWidget {
  // 하트 눌렀을 때 실행할 함수
  final GestureTapCallback onHeartPressed;
  
  _DDay({
    required this.onHeartPressed, // 상위에서 함수 입력받기
  });

  @override
  Widget build(BuildContext context) {
    // 테마 불러오기
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text( // 최상단 U&I 글자
          'U&I',
          style: textTheme.headlineLarge, // headline1 스타일 적용
        ),
        const SizedBox(height: 16.0),
        Text( // 두 번째 글자
          '우리 처름 만난 날',
          style: textTheme.bodyLarge,  // bodyText1 스타일 적용
        ),
        Text( // 임시로 지정한 만난 날짜
          '2021.11.23',
          style: textTheme.bodyMedium,  // bodyText2 스타일 적용
        ),
        const SizedBox(height: 16.0),
        IconButton(   // 하트 아이콘 버튼
          iconSize: 60.0,
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
            color: Colors.red,  // 색상 빨강으로 변경
          ),
        ),
        const SizedBox(height: 16.0),
        Text( // 만난 후 DDay
          'D+365',
          // headline2 스타일 적용
          style: textTheme.headlineMedium,
        ),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(  // 이미지 중앙 정렬
      child: Image.asset(
        'asset/img/middle_image.png',

        // 화면의 반만큼 높이 구현
        height: MediaQuery.of(context).size.height / 2,
      ),
    );
  }
}