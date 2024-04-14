import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height + 20,
      child: ListView.builder(
        physics:
            ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey[400]!),
              ),
            ),
            child: Dismissible(
              key: Key('1'),
              onDismissed: (direction) {
               
              },
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 8,
                                  color: Colors.grey[800]!),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Andy Robertson",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                color: Color.fromARGB(
                                    255, 38, 70, 100),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.shade600,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text("  "),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "oh yes",
                                  style: TextStyle(
                                    fontSize: 15 + 1,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w900,
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
                          "5m ago",
                          style: TextStyle(
                              color: Colors.grey.shade600),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 3),
                          child: Container(
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
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
