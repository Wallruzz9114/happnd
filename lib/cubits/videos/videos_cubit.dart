import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:happnd/models/video.dart';

part 'videos_state.dart';

class VideosCubit extends Cubit<VideosState> {
  VideosCubit() : super(VideosInitial());

  Future<void> loadVideos() async {}
}
