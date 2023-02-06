



import 'package:flutter/material.dart';
import 'package:idealtype/vo/commentVO.dart';

class Banking extends StatelessWidget {
  const Banking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args= ModalRoute.of(context)!.settings.arguments as CommentVO;
    return Scaffold(
      appBar: AppBar(title: Text(
            args.imgName
          )
      ),
      body: ElevatedButton(
        child: Text(args.cupName),
        onPressed: (){
          Navigator.popAndPushNamed(context, '/');
        },
      )
    );
  }
}
