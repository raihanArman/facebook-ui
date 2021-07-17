import 'package:flutter/cupertino.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  static const Widget table = SizedBox();

  const Responsive({
    Key? key, required this.mobile, this.tablet = table, required this.desktop
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool isTable(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth >= 1200){
          return desktop;
        }else if(constraints.maxWidth >= 800){
          return tablet ?? mobile;
        }else{
          return mobile;
        }
      }
    );
  }
}
