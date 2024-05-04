
import 'package:dasar/src/component/snackbar.dart';
import 'package:dasar/src/models/pos_model.dart';
import 'package:dasar/src/provider/pos_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final pos = ref.watch(posDataProvider);
    ref.listen(posDataProvider, (previous, next) {
      if (next.hasError) {
        showSnackbar(context, next.error.toString());
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("LIST POS"),
      ),
      body: pos.when(
          data: (pos) {
            List<Data> posList = pos.map((e) => e).toList();
            return ListView.builder(
                itemCount: posList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 70,
                    padding: EdgeInsets.only(left: 16),
                    margin: EdgeInsets.only(top: 2),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey.shade200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(posList[index].location?.name ?? "-",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                        Text(DateTime.parse(posList[index].location?.createdAt ?? "-").year.toString() +
                            "-" +
                            DateTime.parse(posList[index].location?.createdAt ?? "-").month.toString() +
                            "-" +
                            DateTime.parse(posList[index].location?.createdAt ?? "-").day.toString()),
                      ],
                    ),
                  );
                });
          },
          error: (error, s) {
            return Center(child: Text(error.toString()));
          },
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
