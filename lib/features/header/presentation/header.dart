import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:notez/features/authentication/domain/entities/user.dart';
import 'package:notez/features/header/presentation/bloc/header_bloc.dart';
import 'package:notez/features/search/presentation/search_field.dart';

class Header extends StatefulWidget {
  const Header({
    super.key,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late String title;
  @override
  Widget build(BuildContext context) {
    context.select((HeaderBloc bloc) {
      setState(() {
        title = bloc.state.$1;
      });
    });
    return BlocBuilder<HeaderBloc, (String, User?)>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const Spacer(),
            const SizedBox(
              width: 500,
              child: SearchField(),
            ),
            const Spacer(),
            state.$2 != null
                ? InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: ProfileCard(
                        user: state.$2!,
                      ),
                    ),
                  )
                : const Spacer()
          ],
        );
      },
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.user});

  final User user;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          user.displayName ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 10.0),
          child: CircleAvatar(
            child: user.photoUrl != null
                ? Image(
                    loadingBuilder: (context, child, loadingProgress) {
                      return const Icon(Ionicons.person_outline);
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Ionicons.person_add_outline,
                        color: Theme.of(context).colorScheme.scrim,
                      );
                    },
                    image: NetworkImage(user.photoUrl!),
                  )
                : const Icon(Ionicons.person_add_outline),
          ),
        )
      ],
    );
  }
}
