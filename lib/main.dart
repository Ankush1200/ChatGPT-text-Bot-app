import 'package:chatgpt_bot/screens/chat-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constant/constant.dart';
import 'providers/model_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
      ],
      child:
      
     MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'ChatGPT Clone',
      theme: ThemeData(
        scaffoldBackgroundColor:customBackgroundColor,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          color: cardcolor,
        ),
      ),
      home: const ChatScreen(),)
    );
  }
}

