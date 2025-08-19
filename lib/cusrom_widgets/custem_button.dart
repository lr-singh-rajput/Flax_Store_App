import 'package:flutter/cupertino.dart';
import 'package:flux_store/utils/app_colors.dart';

class CustemButton extends StatelessWidget {
 final String text;
  const CustemButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
      width: w*0.70,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.secondaryTextColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.white,
          width: 2,
        ),
      ),
      child: Center(child: Text(text),),
    );
  }
}
