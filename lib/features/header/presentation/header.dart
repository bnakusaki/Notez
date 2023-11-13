import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:notez/features/header/presentation/widgets/header_title.dart';
import 'package:notez/features/search/presentation/search_field.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final User? currentUser = sl<AuthenticationBloc>().getCurrentUser();

    return Row(
      children: [
        const HeaderTitle(),
        const Spacer(),
        const SizedBox(
          width: 500,
          child: SearchField(),
        ),
        const Spacer(),
        Text(
          '', // currentUser?.displayName ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(width: 10.0),
        FirebaseAuth.instance.currentUser?.photoURL != null
            ? Padding(
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
                    image: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!),
                  ),
                ),
              )
            : const SizedBox(
                width: 20.0,
              ),
      ],
    );
  }
}
