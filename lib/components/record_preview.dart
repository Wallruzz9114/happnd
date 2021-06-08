import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happnd/cubits/record/record_cubit.dart';

class RecordPreview extends StatelessWidget {
  const RecordPreview({
    Key? key,
    required this.controller,
    required this.isPaused,
  }) : super(key: key);

  final CameraController controller;
  final bool isPaused;

  @override
  Stack build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ClipRect(
          child: OverflowBox(
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                height: 600,
                child: AspectRatio(
                  aspectRatio: 1 / controller.value.aspectRatio,
                  child: CameraPreview(controller),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: null,
          bottom: MediaQuery.of(context).padding.bottom + 24,
          child: SizedBox(
            width: 70,
            height: 70,
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              child: InkWell(
                onTap: () {
                  if (isPaused) {
                    BlocProvider.of<RecordCubit>(context).startRecording();
                  } else {
                    BlocProvider.of<RecordCubit>(context).pauseRecording();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(isPaused ? 100 : 8),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
