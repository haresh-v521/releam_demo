import 'package:flutter/material.dart';
import 'package:flutter_todo/components/todo_item.dart';
import 'package:flutter_todo/components/widgets.dart';
import 'package:flutter_todo/realm/new_schema.dart';
import 'package:flutter_todo/realm/schemas.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/realm/realm_services.dart';
import 'package:realm/realm.dart';

import '../realm/sales_schema.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
bool isTrue = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final  realmServices = Provider.of<RealmServices>(context);
    return Stack(
      children: [
        Column(
          children: [
            // styledBox(
            //   context,
            //   isHeader: true,
            //   child: Row(
            //     children: [
            //       const Expanded(
            //         child: Text("Show All Tasks", textAlign: TextAlign.right),
            //       ),
            //       Switch(
            //         value: realmServices.showAll,
            //         onChanged: (value) async {
            //           if (realmServices.offlineModeOn) {
            //             infoMessageSnackBar(context,
            //                     "Switching subscriptions does not affect Realm data when the sync is offline.")
            //                 .show(context);
            //           }
            //           await realmServices.switchSubscription(value);
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: StreamBuilder<RealmResultsChanges<Sale>>(
                  stream: realmServices.realm
                      .all<Sale>()
                      .changes,
                  builder: (context, snapshot) {
                    final data = snapshot.data;

                    if (data == null) return waitingIndicator();

                    final results = data.results;
                   if(results.isNotEmpty){
                     print("this is result====>${results.first.items.length}");
                   }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: results.realm.isClosed ? 0 : results.length,
                      itemBuilder: (context, index) => results[index].isValid
                          ?Text("this is center")/*TodoItem(results[index])*/
                          : Container(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        realmServices.isWaiting ? waitingIndicator() : Container(),
      ],
    );
  }
}
