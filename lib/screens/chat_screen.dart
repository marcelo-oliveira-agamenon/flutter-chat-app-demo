import 'package:flutter/material.dart';
import 'package:teste_flutter/models/message_model.dart';
import 'package:teste_flutter/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen(
    {
      this.user
    }
  );

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                message.time,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 9),
              Text(
                message.text,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
            borderRadius: isMe ? BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15)
            ) : BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15)
            )
          ),
          margin: isMe ? EdgeInsets.only(
            top: 8,
            bottom: 8,
            left: 80
          ) : EdgeInsets.only(
            top: 8,
            bottom: 8
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 18
          ),
          width: MediaQuery.of(context).size.width * 0.75,
        );

        if (isMe) {
          return msg;
        }

    return Row(
      children: <Widget>[
        msg,
        IconButton(
            icon: message.isLiked ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border),
            iconSize: 30,
            color: message.isLiked ? Theme.of(context).primaryColor : Colors.blueGrey,
            onPressed: () {},
          )
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                
              },
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message'
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(100),
          child: Text(
            widget.user.name,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
          children: <Widget>[
            Expanded(
                        child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
                child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                        ),
                        child: ListView.builder(
                          reverse: true,
                          padding: EdgeInsets.only(top: 15),
                        itemCount: messages.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Message message = messages[index];
                          bool isMe = message.sender.id == currentUser.id;

                          return _buildMessage(message, isMe);
                        },
                      ),
                )
              ),
            ),
            _buildMessageComposer()
          ],
        ),
      ),
    );
  }
}