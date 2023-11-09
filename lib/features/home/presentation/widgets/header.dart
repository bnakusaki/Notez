import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notez/features/authentication/presentation/presentation_logic_holders/authentication_bloc.dart';
import 'package:notez/features/home/presentation/widgets/home_title.dart';
import 'package:notez/features/home/presentation/widgets/search_field.dart';
import 'package:notez/features/note/note_dependency_injection.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final User? currentUser = sl<AuthenticationBloc>().getCurrentUser();

    return Row(
      children: [
        const HomeTitle(),
        const SizedBox(width: 20.0),
        const SizedBox(
          width: 500,
          child: SearchField(),
        ),
        const Spacer(),
        Text(
          currentUser?.displayName ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(width: 10.0),
        FirebaseAuth.instance.currentUser?.photoURL != null
            ? CircleAvatar(
                backgroundImage: NetworkImage(
                  FirebaseAuth.instance.currentUser!.photoURL!,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
