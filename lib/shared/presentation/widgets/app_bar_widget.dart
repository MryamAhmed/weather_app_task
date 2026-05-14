import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/route_names.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'WEATHER APP',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => context.pushNamed(RouteNames.searchName),
          icon: const Icon(Icons.search_outlined),
        ),
      ],
    );
  }
}
