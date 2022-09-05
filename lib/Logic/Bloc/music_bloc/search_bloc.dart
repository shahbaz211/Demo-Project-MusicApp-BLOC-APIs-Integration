

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Data/Repo/search_repo.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchRepo? searchRepo;
  SearchBloc(this.searchRepo) : super(SearchInitial()){
    on<SearchStartEvent>((event, emit) async {
      emit(LoadingState());

      Map<String, dynamic>? jsonResponse=await searchRepo!.SearchMusic(event.searchText,event.method);

      if(jsonResponse!=null){
        emit(SearchCompletedState(jsonResponse: jsonResponse));
      }
      else{
        emit(SearchInitial());
      }

    });
  }


}
