
import 'package:build_context_provider/build_context_provider.dart';
import 'package:flutter/material.dart';
import 'package:idealtype/ui/round_bar.dart';
import '../../domain/Idle_list_vo.dart';
import '../../domain/Idle_vo.dart';
import '../../ui/select_button.dart';
import '../../ui/select_name.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class QuestionPage extends StatefulWidget {

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  final IdleList _idleList = IdleList(Get.arguments);

  List<Idle> _winners08 = [];
  List<Idle> _winners04 = [];
  List<Idle> _winners02 = [];
  List<Idle> _lastWinner = [];

  late Idle _selectName;

  late Idle _name1;
  late Idle _name2;

  late bool _where;
  String round = "16강";
  bool overlayShouldBevisible = false;






  @override
  void initState() {
    super.initState();;
    _name1 = _idleList.nextIdle!;
    _name2 = _idleList.nextIdle!;
  }

  void handleSelect(Idle name, bool where) {
    _selectName = name;
    _where = where;
    setState(() {
      overlayShouldBevisible = true;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          children: <Widget>[
            //Text("휴양지 월드컵 "+ round,  style: const TextStyle(color: Colors.black, fontSize: 30)),
            RoundBar(Get.arguments+" 월드컵", round),
            SelectButton(true, _name1, () => handleSelect(_name1, true)),
            SelectButton(false, _name2, () => handleSelect(_name2, false)),
          ],
        ),

        overlayShouldBevisible == true
            ?  SelectName(_selectName, _idleList.isEnd, () {

          // print(_idleList.index);
          // print(_idleList.length);
          if(_winners02.length == 4) {
            print("결승전");
            _lastWinner.add(_selectName);
            print("결승전 winner : " + _lastWinner[0].name);
          }
          else if(_winners04.length == 6) {
            _winners02.add(_selectName);
            print("4강");
            for(int i = 0; i < _winners02.length; i++){
              print((i+1).toString() + "라운드 winner : " + _winners02[i].name);
            }
            print("라운드 종료");
          }
          else if(_winners08.length == 10) {
            _winners04.add(_selectName);
            print("8강");
            for(int i = 0; i < _winners04.length; i++){
              print((i+1).toString() + "라운드 winner : " + _winners04[i].name);
            }
            print("라운드 종료");
          }
          else if(_idleList.length == 18) {
            _winners08.add(_selectName);
            print("16강");
            for(int i = 0; i < _winners08.length; i++){
              print((i+1).toString() + "라운드 winner : " + _winners08[i].name);
              print(_winners08.length);
            }
            print("라운드 종료");
          }else{
            print("dafaaaaaaaaaaaa");
          }

          // =============================================================
          // if(_idleList.length == 5) {
          //   _idleList.plus("images/휴양지/end.jpg");
          //   _idleList.plus("images/휴양지/end.jpg");
          // }
          if(_winners08.length == 8) {
            //_winners08.shuffle();
            _idleList.resetList(_winners08);
            //_winners = [];
            print("8강 시작");
            round = "8강";
            //return;
          }
          if(_winners04.length == 4) {
            //_winners04.shuffle();
            _idleList.resetList(_winners04);
            print("4강 시작");
            round = "4강";
            // return;
          }
          if(_winners02.length == 2) {
            //_winners02.shuffle();
            _idleList.winner(_winners02);
            print("결승전 시작");
            round = "결승전";
            //return;
          }
          if(_lastWinner.length == 1 ) {
            print("마무리");
            _idleList.resetList(_lastWinner);
            _lastWinner.removeLast();
            _lastWinner.removeLast();
            _idleList.index();
            return;
          }

          if (_idleList.isEnd == false) {
            setState(() {
              overlayShouldBevisible = false;
              if (_where == true) {
                _name1 = _idleList.nextIdle!;
                _name2 = _idleList.nextIdle!;
              } else {
                _name2 = _idleList.nextIdle!;
                _name1 = _idleList.nextIdle!;
              }
            });
            return;
          }
        })
            : Container(),
      ],
    );
  }
}

