import 'package:chatty/data/repository.dart';
import 'package:chatty/data/responses/inbox_response.dart';
import 'package:chatty/presentation/home.dart';
import 'package:chatty/presentation/logic/conversation/conversation_cubit.dart';
import 'package:chatty/presentation/logic/inbox/inbox_cubit.dart';
import 'package:chatty/presentation/views/input_view.dart';
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
    "topic": "pizza night",
    "modified_at": 1599814026153
  },] ''');

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

  testWidgets('Displays input view - when loading', (tester) async {
    FlutterError.onError = ignoreOverflowErrors;

    when(
          () => mockRepository.fetchInboxItems(),
    ).thenAnswer((_) async => Right(inboxResponse));

    await tester.pumpWidget(setupWidget(const Home(title: 'Test')));
    await tester.pumpAndSettle();

    final inboxItem = find.byType(InputView);
    expect(inboxItem, findsOneWidget);
  });
}