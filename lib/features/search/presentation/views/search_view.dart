import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Center(
            child: Text(
                'WEATHER APP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,

            ),)),
      ),
      body: SearchViewBody(),
    );
  }
}
