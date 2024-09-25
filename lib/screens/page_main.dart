import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_task/cubit/list_cubit.dart';
import 'package:list_task/cubit/list_state.dart';
import 'package:list_task/entidades/list_item.dart';
import 'package:list_task/screens/page_create.dart';

class PageMain extends StatelessWidget {
  const PageMain({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nombreController = TextEditingController();

    void sendData() {
      ListItem newItem =
          ListItem(title: nombreController.text, content: "", id: 0);
      context.read<ListCubit>().saveANewItem(newItem);
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PageCreate()));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("CUBIT TEST"),
                IconButton(onPressed: () {}, icon: Icon(Icons.menu))
              ],
            ),
          ),
          BlocConsumer<ListCubit, ListState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ListInitialState) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: state.listItem.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return Text(state.listItem[index].title);
                    },
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
