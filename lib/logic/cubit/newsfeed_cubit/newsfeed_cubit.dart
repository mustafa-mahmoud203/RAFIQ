import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafiq/data/data_API/newsfeed_API.dart';
import 'package:rafiq/data/models/newsfeed_model.dart';

part 'newsfeed_state.dart';

class NewsfeedCubit extends Cubit<NewsfeedState> {
  NewsFeedAPI newsFeedAPI;
  NewsfeedCubit({required this.newsFeedAPI}) : super(NewsfeedInitial());

  late NewsfeedModel newsFeedModel;

  Future<void> getposts() async {
    emit(GetPostsLoading());
    try {
      newsFeedModel = await newsFeedAPI.getPosts();
      log(newsFeedModel.newsFeed![0].authorInfo.toString());
      emit(GetPostsSuccess());
    } on DioError catch (error) {
      emit(GetPostsError());
      log(error.response!.data);
    }
  }

  String checkPostList({required int index}) {
    String messege = '';

    if (newsFeedModel.newsFeed![index].content!.text == "" &&
        newsFeedModel.newsFeed![index].content!.files!.isNotEmpty) {
      if (newsFeedModel.newsFeed![index].content!.files![0].contains('jpg')) {
        messege = 'justPhoto';
      } else {
        messege = 'justVideo';
      }
    } else if (newsFeedModel.newsFeed![index].content!.text != "" &&
        newsFeedModel.newsFeed![index].content!.files!.isEmpty) {
      messege = 'justText';
    } else if (newsFeedModel.newsFeed![index].content!.text != "" &&
        newsFeedModel.newsFeed![index].content!.files!.isNotEmpty) {
      if (newsFeedModel.newsFeed![index].content!.files![0].contains('jpg')) {
        messege = 'TextWithPhoto';
      }
    } else {
      messege = 'TextWithVideo';
    }
    return messege;
  }
}
