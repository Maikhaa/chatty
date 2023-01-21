import 'package:chatty/presentation/logic/inbox_cubit.dart';
import 'package:chatty/presentation/widgets/inbox_item_w.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InboxView extends StatefulWidget {
  const InboxView({Key? key}) : super(key: key);

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
  @override
  void initState() {
    BlocProvider.of<InboxCubit>(context).fetchInboxItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InboxCubit, InboxState>(
      bloc: BlocProvider.of<InboxCubit>(context),
      builder: (context, state) {
        switch (state.status) {
          case InboxStatus.success:
            return inbox(state);
          default:
            return loading();
        }
      },
    );
  }

  Widget inbox(InboxState state) {
    final inboxItems = state.inboxItems;

    return SizedBox(
      key: const Key('inbox'),
      width: MediaQuery.of(context).size.width * 0.4,
      child: ListView.builder(
        itemCount: inboxItems!.length,
        itemBuilder: (context, index) =>
            InboxItemW(inboxItem: inboxItems[index]),
      ),
    );
  }

  Widget loading() => const Center(child: CircularProgressIndicator());
}
