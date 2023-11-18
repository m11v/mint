import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'han.dart';

class MintHanView extends StatelessWidget {
  const MintHanView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HanBloc, HanState>(
      builder: (context, state) {
        return HanView(type: state.hanType);
      },
    );
  }
}
