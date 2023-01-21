import 'package:chatty/data/repository.dart';
import 'package:chatty/data/responses/conversation_response.dart';
import 'package:chatty/data/responses/inbox_response.dart';
import 'package:chatty/presentation/home.dart';
import 'package:chatty/presentation/logic/conversation/conversation_cubit.dart';
import 'package:chatty/presentation/logic/inbox/inbox_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../test_helper.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  final mockRepository = MockRepository();

  final InboxResponse inboxResponse = InboxResponse('''[{
    "id": "9991",
    "last_message": "How about tomorrow then?",
    "members": ["John", "Daniel", "Rachel"],
    "topic": "First",
    "modified_at": 1599814026153
  },] ''');

  final ConversationResponse conversationResponse = ConversationResponse('''[{
    "id": "1003",
    "message": "How about tomorrow then?",
    "modified_at": 1599814026153,
    "sender": "John"
  },]''');

  Widget setupWidget(Widget widget) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => InboxCubit(mockRepository),
          ),
          BlocProvider(
            create: (context) => ConversationCubit(mockRepository),
          ),
        ],
        child: MaterialApp(
          home: widget,
        ),
      );



  testWidgets('Displays message - when tapping inbox item', (tester) async {
    FlutterError.onError = ignoreOverflowErrors;

    when(
      () => mockRepository.fetchInboxItems(),
    ).thenAnswer((_) async => Right(inboxResponse));

    when(
      () => mockRepository.fetchConversation(any()),
    ).thenAnswer((_) async => Right(conversationResponse));

    await tester.pumpWidget(setupWidget(const Home(title: 'Test')));
    await tester.pumpAndSettle();

    final inboxItem = find.byKey(const Key('inbox-item'));
    expect(inboxItem, findsOneWidget);

    await tester.tap(inboxItem);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('message')), findsOneWidget);
  });
}
