import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'question_page.dart';
import 'package:idealtype/domain/Idle_list_vo.dart';
import 'package:idealtype/view/question_page.dart';
class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final args= ModalRoute.of(context)!.settings.arguments;
    return  Material(
      color: Colors.green[400],
      child:  InkWell(
        onTap: () {
          // Navigator.popAndPushNamed(context, '/question',
          //     arguments: args.toString());
          // Navigator.of(context).push( MaterialPageRoute(
          //     builder: (BuildContext context) =>  QuestionPage(args.toString())));
        Get.off(()=>QuestionPage(),arguments: args.toString());
        },
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            Text(
              args.toString()+" 월드컵",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "시작",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
