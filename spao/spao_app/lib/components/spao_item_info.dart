import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpaoItemInfo extends StatefulWidget {
  const SpaoItemInfo({Key? key}) : super(key : key);

  @override
  State<SpaoItemInfo> createState() => _SpaoItemInfoState();
}

class _SpaoItemInfoState extends State<SpaoItemInfo> {

  int sequenceNum = 0; // 선택된 버튼 순번

  // 이미지 리스트
  List <String> selectedPic = [
    "assets/coat.jpg",
    "assets/jumper.jpg",
    "assets/padding.jpg",
    "assets/zipup.jpg",
  ];

  // 상품명 리스트
  List <String> selectedTit = [
    "후드 숏 더플 코트(SPJWD4TG01 RE)_SPJWE11G91",
    "트위드 크롭 자켓_SPJKD4TW21",
    "파스텔 푸퍼(SPJPD4TG01 RE)_SPJPE11G01",
    "플리스 크롭 하프 집업_G_SPFWD4TU03"
  ];

  // 상품 정보 리스트 [가격, 조회수, 별수]
  Map<String, List> goodsInfo = {
    "후드 숏 더플 코트(SPJWD4TG01 RE)_SPJWE11G91" : ['99,900', 51, 5.0],
    "트위드 크롭 자켓_SPJKD4TW21" : ['89,900', 22, 4.9],
    "파스텔 푸퍼(SPJPD4TG01 RE)_SPJPE11G01" : ['69,900', 561, 4.9],
    "플리스 크롭 하프 집업_G_SPFWD4TU03" : ['29,900', 11, 4.8]
  };

  // 상품 색상 리스트
  Map<String, List> goodsColor = {
    "후드 숏 더플 코트(SPJWD4TG01 RE)_SPJWE11G91" : [Color.fromRGBO(184, 186, 185, 1.0), Color.fromRGBO(3, 23, 94, 1.0) ],
    "트위드 크롭 자켓_SPJKD4TW21" : [ Color.fromRGBO(0, 0, 0, 1.0), Color.fromRGBO(227, 108, 157, 1.0), Color.fromRGBO(255, 254, 247, 1.0), Color.fromRGBO(226, 247, 240, 1.0) ],
    "파스텔 푸퍼(SPJPD4TG01 RE)_SPJPE11G01" : [Color.fromRGBO(0, 0, 0, 1.0), Color.fromRGBO(255, 254, 247, 1.0), Color.fromRGBO(168, 210, 232, 1.0), Color.fromRGBO(0, 0, 0, 1.0),
    Color.fromRGBO(141, 92, 51, 1.0), Color.fromRGBO(254, 253, 246, 1.0), Color.fromRGBO(199, 199, 199, 1.0)],
    "플리스 크롭 하프 집업_G_SPFWD4TU03" : [Color.fromRGBO(238, 207, 150, 1.0), Color.fromRGBO(188, 187, 187, 1.0), Color.fromRGBO(231, 221, 222, 1.0)]
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPicter(), // 1. 상품 이미지
        _buildSelector(), // 2. 선택 버튼
        _buildCartInfo(), // 3. 상품 정보
      ],
    );
  }

  // 1. 상품 이미지
  Widget _buildPicter(){
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: 
        AspectRatio(
          aspectRatio: 1/1.6,
          child: Image.asset(
            selectedPic[sequenceNum],
            fit: BoxFit.cover,
          ),
        )
      ,
    );
  }

  Widget _buildSelector(){
    return Padding(
      padding: const EdgeInsets.only(
        left: 30, right: 30, top: 10, bottom: 30
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // 버튼 4개 생성하기
        children: [
            _buildSelectButton(0, '코트'),
            _buildSelectButton(1, '자켓'),
            _buildSelectButton(2, '패딩'),
            _buildSelectButton(3, '집업'),
        ],
      ),
    );
  }

  // 2. 선택버튼 만들기
  Widget _buildSelectButton(int seq, String btnTxt){
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: seq == sequenceNum ? Colors.orange : Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: (){
          setState(() {
            sequenceNum = seq;
          });
        },
        child: Text(
          btnTxt,
          style: TextStyle(
              color: seq == sequenceNum ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
      )
    );
  }

  // 3. 상품명 + 상품가격 + 별점 + 리뷰수 + 색상옵션 + 버튼
  Widget _buildCartInfo(){
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 이름, 가격
          _buildNamePrice(),
          // 별점 , 리뷰수 
          _buildStarReview(),
          // 옵션 위젯
          _buildOption(),
          // 버튼
          _buildButton()
        ],
      ),
    );
  }

  // 이름 가격
  Widget _buildNamePrice(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            selectedTit[sequenceNum],
            style: TextStyle(
              fontSize : 10,
              fontWeight : FontWeight.bold
            ),
          ),
          Text(
            '${goodsInfo[selectedTit[sequenceNum]]? [0]}',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  // 별점, 리뷰수
  Widget _buildStarReview(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          // 별수
          for(int i=0; i<goodsInfo[selectedTit[sequenceNum]]? [2]; i++) Icon(Icons.star, color: Colors.pinkAccent),
          Spacer(),
          // 리뷰수
          Text(
            '리뷰 ${goodsInfo[selectedTit[sequenceNum]]? [1]}',
            style: TextStyle(
              fontSize: 15,
              color: Colors.green,
            ),
          )
        ]
      ),
    );
  }

  // 옵션 위젯
  Widget _buildOption(){
    dynamic selectedColor = goodsColor[selectedTit[sequenceNum]];
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('색상'),
          SizedBox(height: 7),
          Row(
            children: [
              for(int i=0; i<selectedColor.length; i++) _buildDetailIcon(selectedColor[i]),
            ],
          )
        ],
      ),
    );
  } 

  // 둥근모양 색상 아이콘 메서드
  Widget _buildDetailIcon(Color mColor){
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.white12,
              border: Border.all(),
              shape: BoxShape.circle
            ),
          ),
          Positioned(
            left: 2.5,
            top: 2.5,
            child: ClipOval(
              child: Container(
                color: mColor,
                width: 30,
                height: 30,
              ),
            ),
          )
        ],
      ),
    );
  }

  // 버튼
  Widget _buildButton(){
    return Align(
      child: TextButton(
        onPressed: (){
          showCupertinoDialog(
            context: context, 
            builder: (context) =>
              CupertinoAlertDialog(
                title: Text('장바구니에 담았습니다.'),
                actions: [
                  CupertinoDialogAction(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text(
                      '확인',
                      style: TextStyle(color: Colors.redAccent),
                    )
                  )
                ],
              ),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.orange,
          minimumSize: Size(300, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
        ),
        child: Text(
          '카트 추가',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}