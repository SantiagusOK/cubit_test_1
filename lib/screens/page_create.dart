import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_task/cubit/list_cubit.dart';
import 'package:list_task/cubit/list_state.dart';
import 'package:list_task/entidades/list_item.dart';

class PageCreate extends StatelessWidget {
  const PageCreate({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nombreController = TextEditingController();

    return BlocBuilder<ListCubit, ListState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("CREATE A NEW LIST"),
          ),
          body: Center(
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      ListItem newItem = ListItem(
                          title: nombreController.text, content: "", id: 0);
                      context.read<ListCubit>().saveANewItem(newItem);
                    },
                    child: const Text("GUARDAR")),
                SizedBox(
                    width: 500,
                    child: TextField(
                        controller: nombreController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder()))),
              ],
            ),
          ),
        );
      },
    );
  }
}
