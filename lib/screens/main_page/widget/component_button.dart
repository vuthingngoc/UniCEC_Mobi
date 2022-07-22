import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/main/main_bloc.dart';
import '../../../utils/app_color.dart';

class ComponentButton extends StatelessWidget {
  final int index;
  final Function() onPressed;
  final String label;

  const ComponentButton(
      {Key? key, required this.index, required this.onPressed, required this.label})
      : super(key: key);

  IconData getIconData(String label) {
    IconData iconData = Icons.warning;
    if (index == 1) {
      iconData = Icons.article;
    } else if (index == 3) {
      iconData = Icons.tag_faces;
    } else if (index == 4) {
      iconData = Icons.person;
    }
    return iconData;
  }

  @override
  Widget build(BuildContext context) {
    IconData iconData = getIconData(label);
    MainBloc bloc = BlocProvider.of<MainBloc>(context);
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 5),
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(
            iconData,
            color: bloc.state.currentPageIndex == index
                ? AppColors.primaryColor
                : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
                color: bloc.state.currentPageIndex == index
                    ? AppColors.primaryColor
                    : Colors.grey,
                fontSize: 13
            ),
          )
        ],
      ),
    );
  }
}