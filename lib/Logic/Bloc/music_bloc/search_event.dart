part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}


class SearchStartEvent extends SearchEvent{
  String searchText;
  String method;

  SearchStartEvent({required this.searchText,required this.method});
}