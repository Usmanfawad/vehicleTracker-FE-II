// ignore_for_file: prefer_const_constructors

import 'dart:ffi';
import 'dart:ui';
import 'package:boiler_plate/widget/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  late List<Map<String, dynamic>> filteredData;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredData = List.from(data);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      filteredData = data.where((chat) {
        final String searchTerm = _searchController.text.toLowerCase();
        final String userName = chat['userName'] as String;

        return userName.toLowerCase().contains(searchTerm);
      }).toList();
    });
  }

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
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.black54,
                size: 28,
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _searchController,
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
                SizedBox(
                  height: MediaQuery.of(context).size.height + 20,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      return ChatListCard(
                        isSeen: filteredData[index]['isSeen'] as bool,
                        userName: filteredData[index]['userName'] as String,
                        lastMessageTime:
                            filteredData[index]['lastMessageTime'] as String,
                        lastMessage:
                            filteredData[index]['lastMessage'] as String,
                        userImage: filteredData[index]['userImage'] as String,
                        userID: filteredData[index]['userID'] as String,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final data = [
  {
    "userName": "John Doe",
    "lastMessage": "Hello!",
    "lastMessageTime": "2:30 PM",
    "userImage": "https://example.com/user1.jpg",
    "userID": "1",
    "isSeen": true
  },
  {
    "userName": "Alice Smith",
    "lastMessage": "Hi there!",
    "lastMessageTime": "1:45 PM",
    "userImage": "https://example.com/user2.jpg",
    "userID": "2",
    "isSeen": false
  },
  {
    "userName": "Bob Johnson",
    "lastMessage": "Hey!",
    "lastMessageTime": "12:15 PM",
    "userImage": "https://example.com/user3.jpg",
    "userID": "3",
    "isSeen": true
  },
  {
    "userName": "Emily Brown",
    "lastMessage": "How are you?",
    "lastMessageTime": "10:20 AM",
    "userImage": "https://example.com/user4.jpg",
    "userID": "4",
    "isSeen": false
  },
  {
    "userName": "Michael Wilson",
    "lastMessage": "What's up?",
    "lastMessageTime": "9:00 AM",
    "userImage": "https://example.com/user5.jpg",
    "userID": "5",
    "isSeen": true
  },
  {
    "userName": "Emma Taylor",
    "lastMessage": "Nice to meet you!",
    "lastMessageTime": "Yesterday",
    "userImage": "https://example.com/user6.jpg",
    "userID": "6",
    "isSeen": false
  },
  {
    "userName": "James Martinez",
    "lastMessage": "Good morning!",
    "lastMessageTime": "Yesterday",
    "userImage": "https://example.com/user7.jpg",
    "userID": "7",
    "isSeen": true
  },
  {
    "userName": "Olivia Garcia",
    "lastMessage": "Good night!",
    "lastMessageTime": "2 days ago",
    "userImage": "https://example.com/user8.jpg",
    "userID": "8",
    "isSeen": false
  },
  {
    "userName": "William Rodriguez",
    "lastMessage": "Have a nice day!",
    "lastMessageTime": "3 days ago",
    "userImage": "https://example.com/user9.jpg",
    "userID": "9",
    "isSeen": true
  },
  {
    "userName": "Sophia Hernandez",
    "lastMessage": "See you later!",
    "lastMessageTime": "3 days ago",
    "userImage": "https://example.com/user10.jpg",
    "userID": "10",
    "isSeen": false
  }
];
