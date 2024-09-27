import 'package:flutter/material.dart';

import 'progress_indicator_rating.dart';

class AkOverallProductRating extends StatelessWidget {
  const AkOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text('4.8',
                style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              AkProgressIndicator(text: '5', value: 0.9),
              AkProgressIndicator(text: '4', value: 0.7),
              AkProgressIndicator(text: '3', value: 0.4),
              AkProgressIndicator(text: '2', value: 0.3),
              AkProgressIndicator(text: '1', value: 0.1),
            ],
          ),
        )
      ],
    );
  }
}

