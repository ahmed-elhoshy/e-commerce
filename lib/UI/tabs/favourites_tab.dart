import 'package:flutter/material.dart';

import '../Home/widgets/search_bar.dart';

class FavouritesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomSearchBar(),
          Text('fv'),
        ],
      ),
    );
  }
}
