import 'package:list_task/entidades/list_item.dart';

abstract class ListState {}

class ListInitialState extends ListState {
  List<ListItem> listItem;
  ListInitialState({required this.listItem});
}
