import 'package:flutter/material.dart';
import 'package:testvascomm/presentation/common/colors_constant.dart';

class FilterCategory extends StatelessWidget {
  final int index;
  const FilterCategory({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor:
              index != 0 ? ColorSharedConstant.backProfile  : ColorSharedConstant.colorTitleBlue ,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
        ),
        child: Text(
          'AllProduct',
          style: TextStyle(color: index != 0 ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
