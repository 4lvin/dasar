

import 'package:dasar/src/models/pos_model.dart';
import 'package:dasar/src/service/api.dart';
import 'package:riverpod/riverpod.dart';

final posDataProvider = FutureProvider<List<Data>>((ref)async{
  List<Data> posModel = <Data>[];
  var response = await  ref.watch(provider).getPos();
  posModel.addAll((response['data'] as List).map((e) => Data.fromJson(e)).toList());
  return posModel;
});