import 'package:flutter/material.dart';

class ChatListCard extends StatelessWidget {
  const ChatListCard({
    super.key,
    required this.userName,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.userImage,
    required this.userID,
    required this.isSeen,
  });
  final String userName;
  final String lastMessage;
  final String lastMessageTime;
  final String userImage;
  final String userID;
  final bool isSeen;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1, color: Colors.grey[400]!),
        ),
      ),
      child: Dismissible(
        key: Key(userID),
        onDismissed: (direction) {},
        direction: DismissDirection.endToStart,
        background: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red.shade400,
            ),
            child: Icon(Icons.delete, color: Colors.white),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20.0),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(blurRadius: 8, color: Colors.grey[800]!),
                      ],
                    ),
                    child: CircleAvatar(

                      radius: 30,
                      
                      backgroundColor: Colors.black,
                      child: Image.network(userImage),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          color: Color.fromARGB(255, 38, 70, 100),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                         !isSeen ? Container(
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade600,
                              shape: BoxShape.circle,
                            ),
                            child: Text("  "),
                          ) : Container(),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            lastMessage,
                            style: TextStyle(
                              fontSize: 15 + 1,
                              letterSpacing: 0.5,
                              fontWeight: isSeen ? FontWeight.w900 : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                   isSeen ? lastMessageTime :"5m ago",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                    child:!isSeen ? Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow.shade600,
                      ),
                      child: Text(
                        '2',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ): Container(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
