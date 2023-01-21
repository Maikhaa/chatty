import 'package:chatty/presentation/logic/conversation/conversation_cubit.dart';
import 'package:chatty/presentation/logic/inbox/inbox_cubit.dart';
import 'package:chatty/presentation/widgets/inbox_item_w.dart';
import 'package:flutter/foundation.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final width = kIsWeb ? screenWidth * 0.2 : screenWidth * 0.9;
    final height = kIsWeb ? screenHeight * 0.9 : screenHeight * 0.8;

    return SizedBox(
      width: width,
      height: height,
      child: BlocBuilder<InboxCubit, InboxState>(
        bloc: BlocProvider.of<InboxCubit>(context),
        builder: (context, state) {
          switch (state.status) {
            case InboxStatus.success:
              return inbox(state);
            default:
              return loading();
          }
        },
      ),
    );
  }

  Widget inbox(InboxState state) {
    final inboxItems = state.inboxItems;

    return ListView.builder(
      itemCount: inboxItems!.length,
      itemBuilder: (context, index) => InboxItemW(
        key: const Key('inbox-item'),
        inboxItem: inboxItems[index],
        onTap: () {
          final id = inboxItems[index].id;
          BlocProvider.of<ConversationCubit>(context).fetchConversation(id);
        },
      ),
    );
  }

  Widget loading() => const Center(child: CircularProgressIndicator());
}
