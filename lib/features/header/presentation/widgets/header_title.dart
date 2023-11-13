import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notez/features/header/presentation/presentation_logic_holders/header_title_state.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeaderTitleStateCubit, String>(
      builder: (context, state) {
        return Text(
          state,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        );
      },
    );
  }
}
