import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/presentation/widgets/app_bar_widget.dart';
import '../../../../shared/presentation/widgets/error_widget.dart';
import '../../../../shared/presentation/widgets/loading_widget.dart';
import '../manager/home_cubit.dart';
import '../widgets/home_view_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.when(
            initial: () => const LoadingWidget(),
            loading: () => const LoadingWidget(),
            success: (weather) => HomeViewBody(weather: weather),
            failure: (message) => AppErrorWidget(message: message),
            empty: () => const Center(
              child: Text(
                'There is no weather. Start search.',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        },
      ),
    );
  }
}
