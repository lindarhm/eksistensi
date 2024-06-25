import 'package:flutter/material.dart';
import 'package:testvascomm/presentation/common/colors_constant.dart';

class SearchIput extends StatelessWidget {
  const SearchIput({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: ColorSharedConstant.colorPlaceHolderGrey),
            contentPadding: EdgeInsets.all(16.0),
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search),
          ),
        ),
      );
  }
}
