// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:boiler_plate/widget/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.black54,
                size: 28,
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search here",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(228, 241, 241, 239),
              Color.fromARGB(220, 175, 192, 199)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: RadialGradient(
                        colors: const [
                          Color.fromARGB(255, 13, 57, 84),
                          Color.fromARGB(255, 64, 161, 226)
                        ],
                        radius: 10,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellow.shade500,
                          ),
                          child: Icon(
                            Icons.chat,
                            color: Color.fromARGB(255, 13, 57, 84),
                            size: 28,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Talk to FriendAI.",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ChatTile()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

