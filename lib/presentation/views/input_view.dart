import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InputView extends StatelessWidget {
  const InputView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final width = kIsWeb ? screenWidth * 0.7 : screenWidth * 0.9;
    final height = MediaQuery.of(context).size.height * 0.1;

    return SizedBox(
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: TextFormField(
              onChanged: (_) {},
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
