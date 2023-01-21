part of 'inbox_cubit.dart';

enum InboxStatus { initial, loading, success, error }

class InboxState extends Equatable {
  final List<InboxItem>? inboxItems;
  final InboxStatus status;

  const InboxState(
      {this.inboxItems, this.status = InboxStatus.initial});

  InboxState copyWith({
    List<InboxItem>? inboxItems,
    InboxStatus? status,
  }) =>
      InboxState(
        inboxItems: inboxItems ?? this.inboxItems,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [inboxItems, status];
}
