import 'package:chatty/core/types.dart';
import 'package:chatty/data/repository.dart';
import 'package:chatty/data/response/inbox_response.dart';
import 'package:chatty/domain/inbox_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'inbox_state.dart';

class InboxCubit extends Cubit<InboxState> {
  final Repository repo;

  InboxCubit(this.repo) : super(const InboxState());

  void fetchInboxItems() async {
    final ApiResponse<InboxResponse> failureOrResponse =
        await repo.fetchInboxItems();

    failureOrResponse
        .fold((failure) => emit(state.copyWith(status: InboxStatus.loading)),
            (response) {
      final List<InboxItem> inboxItems = response.getInboxItems();
      emit(state.copyWith(inboxItems: inboxItems, status: InboxStatus.success));
    });
  }
}
