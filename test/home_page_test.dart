import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/home_page.dart';
import 'package:flutter_tests/user_model.dart';

void main() {
  testWidgets(
    'Displays List of users with title as name and  subtitle as email', (widgetTester) async {
      final users = [
        User(id: 1, name: 'Anuj', email: 'anuj@gmail.com'),
        User(id: 2, name: 'Pandey', email: 'pandey@gmail.com'),
      ];

      Future<List<User>> mockFetchUsers() {
        return Future.delayed(
          const Duration(seconds: 1),
          () => users,
        );
      }

      await widgetTester.pumpWidget(
        MaterialApp(
          home: HomeScreen(
            futureUsers: mockFetchUsers(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await widgetTester.pumpAndSettle();//it keeps calling pump until future is resolved

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(users.length));

      for (final user in users) {
        expect(find.text(user.name), findsOneWidget);
        expect(find.text(user.email), findsOneWidget);
      }
    },
  );
}