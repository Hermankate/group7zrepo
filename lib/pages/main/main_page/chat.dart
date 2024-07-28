import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  final String jobId;
  final String posterId;
  final String receiverId;

  ChatScreen({
    required this.jobId,
    required this.posterId,
    required this.receiverId,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> _messages = [];
  late String currentUserId;
  late bool isPoster;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    currentUserId = _auth.currentUser!.uid;
    isPoster = currentUserId == widget.posterId;
    _isLoading = true;
    _loadMessages();
  }

  void _loadMessages() {
    String compositeId1 = widget.posterId + '_' + widget.receiverId;
    String compositeId2 = widget.receiverId + '_' + widget.posterId;

    _firestore
        .collection('messages')
        .where('jobId', isEqualTo: widget.jobId)
        .where('compositeId', whereIn: [compositeId1, compositeId2])
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
          setState(() {
            _messages = snapshot.docs;
            _isLoading = false;
          });
        });
  }

  void _sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      String compositeId = widget.posterId + '_' + widget.receiverId;

      await _firestore.collection('messages').add({
        'senderId': currentUserId,
        'receiverId': isPoster ? widget.receiverId : widget.posterId,
        'messageContent': _messageController.text,
        'timestamp': FieldValue.serverTimestamp(),
        'jobId': widget.jobId,
        'compositeId': compositeId,
      });
      _loadMessages();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${isPoster ? "Applicant" : "Job Poster"}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _messages.isEmpty
                    ? Center(child: Text('No messages yet.'))
                    : ListView.builder(
                        reverse: true,
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          var doc = _messages[index];
                          bool isMe = doc['senderId'] == currentUserId;
                          return Align(
                            alignment: isMe
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: isMe ? Colors.blue : Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doc['messageContent'],
                                    style: TextStyle(
                                        color:
                                            isMe ? Colors.white : Colors.black),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    isMe
                                        ? 'You'
                                        : (isPoster
                                            ? 'Applicant'
                                            : 'Job Poster'),
                                    style: TextStyle(
                                        color:
                                            isMe ? Colors.white : Colors.black,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Enter a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
