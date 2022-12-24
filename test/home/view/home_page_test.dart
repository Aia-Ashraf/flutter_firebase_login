import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/app/app.dart';
import 'package:flutter_firebase_login/home/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBaseBloc extends MockBloc<BaseEvent, AppState> implements BaseBloc {}

class MockUser extends Mock implements User {}

void main() {
  const logoutButtonKey = Key('homePage_logout_iconButton');
  group('HomePage', () {
    late BaseBloc baseBloc;
    late User user;

    setUp(() {
      baseBloc = MockBaseBloc();
      user = MockUser();
      when(() => user.email).thenReturn('test@gmail.com');
      when(() => baseBloc.state).thenReturn(AppState.authenticated(user));
    });

    group('calls', () {
      testWidgets('AppLogoutRequested when logout is pressed', (tester) async {
        await tester.pumpWidget(
          BlocProvider.value(
            value: baseBloc,
            child: const MaterialApp(home: HomePage()),
          ),
        );
        await tester.tap(find.byKey(logoutButtonKey));
        verify(() => baseBloc.add(const AppLogoutRequested())).called(1);
      });
    });

    group('renders', () {
      testWidgets('avatar widget', (tester) async {
        await tester.pumpWidget(
          BlocProvider.value(
            value: baseBloc,
            child: const MaterialApp(home: HomePage()),
          ),
        );
        expect(find.byType(Avatar), findsOneWidget);
      });

      testWidgets('email address', (tester) async {
        await tester.pumpWidget(
          BlocProvider.value(
            value: baseBloc,
            child: const MaterialApp(home: HomePage()),
          ),
        );
        expect(find.text('test@gmail.com'), findsOneWidget);
      });

      testWidgets('name', (tester) async {
        when(() => user.name).thenReturn('Joe');
        await tester.pumpWidget(
          BlocProvider.value(
            value: baseBloc,
            child: const MaterialApp(home: HomePage()),
          ),
        );
        expect(find.text('Joe'), findsOneWidget);
      });
    });
  });
}
