import 'package:chatt/app.dart';
import 'package:chatt/screens/select_user_screen.dart';
import 'package:chatt/theme.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

void main() {
  final client = StreamChatClient(streamKey);

  runApp(MyApp(
    client: client,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.client}) : super(key: key);

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      title: 'Chat App',
      builder: (context, child) {
        return StreamChatCore(
          client: client,
          child: ChannelsBloc(
            child: UsersBloc(child: child!),
          ),
        );
      },
      home: const SelectUserScreen(),
    );
  }
}
