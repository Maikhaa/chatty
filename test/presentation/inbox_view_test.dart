import 'package:chatty/data/repository.dart';
import 'package:chatty/data/responses/inbox_response.dart';
import 'package:chatty/presentation/views/inbox_view.dart';
import 'package:chatty/presentation/logic/inbox/inbox_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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

  Widget setupWidget(Widget widget) => BlocProvider(
        create: (context) => InboxCubit(mockRepository),
        child: MaterialApp(
          home: widget,
        ),
      );

  testWidgets('Displays inbox', (tester) async {
    when(
      () => mockRepository.fetchInboxItems(),
    ).thenAnswer((_) async => Right(inboxResponse));

    await tester.pumpWidget(setupWidget(const InboxView()));
    final inboxItem = find.byKey(const Key('inbox'));
    expect(inboxItem, findsOneWidget);
  });
}
