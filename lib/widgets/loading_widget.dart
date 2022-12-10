
import 'package:flutter/cupertino.dart';

import '../helpers/colors_data.dart';

class LoadingAnimationWidget extends StatefulWidget {
  final double? size;
  final Color? color;
  final double? paddingTop;

  const LoadingAnimationWidget({Key? key,this.size, this.color,this.paddingTop,}) : super(key: key);


  @override
  State<LoadingAnimationWidget> createState() => _LoadingAnimationWidgetState();
}

class _LoadingAnimationWidgetState extends State<LoadingAnimationWidget> {

  normalLoading({double? size,double? paddingTop,}){

    return Container(
      margin: EdgeInsets.only(top: paddingTop ?? 0),
      width: size ?? MediaQuery.of(context).size.width * 0.1,
      height: size ??MediaQuery.of(context).size.width* 0.1,
      child:CupertinoActivityIndicator(
        color: pinkColor,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return normalLoading(size:widget.size,paddingTop: widget.paddingTop );
  }
}