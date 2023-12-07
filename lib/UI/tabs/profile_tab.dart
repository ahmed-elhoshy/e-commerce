import 'package:flutter/material.dart';

import '../Home/widgets/search_bar.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomSearchBar(),
          Text('prof'),
        ],
      ),
    );
  }
}
