import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/route_names.dart';
import '../../../../shared/presentation/widgets/loading_widget.dart';
import '../manager/search_cubit.dart';
import '../widgets/search_view_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () => context.goNamed(RouteNames.homeName),
          failure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Search')),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const LoadingWidget(),
              orElse: () => const SearchViewBody(),
            );
          },
        ),
      ),
    );
  }
}
