import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_task/cubit/list_state.dart';
import 'package:list_task/entidades/list_item.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(ListInitialState(listItem: []));

  void saveANewItem(ListItem newItem) {
    List<ListItem> listFromCubit = (state as ListInitialState).listItem;
    if (newItem.title.isNotEmpty) {
      listFromCubit.add(newItem);
    }
    emit(ListInitialState(listItem: listFromCubit));
  }
}
