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

    return BlocConsumer<ListCubit, ListState>(
      builder: (context, state) {
        if (state is ListInitialState) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 209, 209, 209),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 0,
                          blurRadius: 1, // changes position of shadow
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "CUBIT TEST 1",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 25),
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.menu))
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 0,
                            blurRadius: 1, // changes position of shadow
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                        itemCount: state.listItem.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return Text(state.listItem[index].title);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PageCreate()));
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          );
        } else {
          return Container();
        }
      },
      listener: (context, state) {},
    );
  }
}
