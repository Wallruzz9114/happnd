import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happnd/components/record_preview.dart';
import 'package:happnd/cubits/record/record_cubit.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider<RecordCubit>(
        create: (_) => RecordCubit()..initialize(),
        child: const RecordPage(),
      ),
    );
  }

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Record'),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Text('Next', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: BlocBuilder<RecordCubit, RecordState>(
        builder: (context, state) {
          if (state is RecordInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RecordReady) {
            return RecordPreview(
              controller: state.controller,
              isPaused: true,
            );
          } else if (state is RecordInProgress) {
            return RecordPreview(
              controller: state.controller,
              isPaused: false,
            );
          } else if (state is RecordPaused) {
            return RecordPreview(
              controller: state.controller,
              isPaused: true,
            );
          } else if (state is RecordError) {
            return Center(child: Text(state.errorMessage));
          }
          return Container();
        },
      ),
    );
  }
}
