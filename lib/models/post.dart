import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Post {
  final String description;
  final String uid;
  final String postId;
  final String username;
  final datePublished;
  final String postUrl;
  final String profileImage;
  final likes;

  const Post(
      {required this.description,
      required this.uid,
      required this.postId,
      required this.username,
      required this.datePublished,
      required this.postUrl,
      required this.profileImage,
      required this.likes});

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "description": description,
        "postUrl": postUrl,
        "datePublished": datePublished,
        "profileImage": profileImage,
        "postId": postId,
        "likes": likes
      };

  //return a User model from a snapshot
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
        description: snapshot['description'],
        uid: snapshot['uid'],
        postUrl: snapshot['postUrl'],
        username: snapshot['username'],
        profileImage: snapshot['profImage'],
        postId: snapshot['postId'],
        datePublished: snapshot['datePublished'],
        likes: snapshot['likes']);
  }
}
