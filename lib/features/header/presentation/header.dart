import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:notez/features/header/presentation/bloc/header_bloc.dart';
import 'package:notez/features/header/presentation/bloc/header_state.dart';
import 'package:notez/features/search/presentation/search_field.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HeaderBloc(),
      child: BlocBuilder<HeaderBloc, HeaderState>(
        builder: (context, state) {
          return Row(
            children: [
              Text(
                state.title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Spacer(),
              const SizedBox(
                width: 500,
                child: SearchField(),
              ),
              const Spacer(),
              if (state is NoUserHeaderState) const Spacer(),
              if (state is UserAvailableHeaderState)
                Text(
                  state.userName ?? '',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              const SizedBox(width: 10.0),
              if (state is UserAvailableHeaderState && state.photoUrl != null)
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image(
                      loadingBuilder: (context, child, loadingProgress) {
                        return const Icon(Ionicons.person_outline);
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Ionicons.person_outline,
                          color: Colors.red,
                        );
                      },
                      image: NetworkImage(state.photoUrl!),
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
