import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseServices {
  static CollectionReference<EventModel> getEventsCollection() =>
      FirebaseFirestore.instance
          .collection('events')
          .withConverter<EventModel>(
            fromFirestore: (docSnapshot, _) =>
                EventModel.fromjson(docSnapshot.data()!),
            toFirestore: (eventModel, _) => eventModel.tojson(),
          );

  static Future<void> createEvent(EventModel event) {
    CollectionReference<EventModel> eventsCollection = getEventsCollection();
    DocumentReference<EventModel> doc = eventsCollection.doc();
    event.id = doc.id;
    return doc.set(event);
  }

  static Future<List<EventModel>> getEvents() async {
    CollectionReference<EventModel> eventsCollection = getEventsCollection();
    QuerySnapshot<EventModel> querySnapshot = await eventsCollection
        .orderBy('timestamp')
        .get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  static Future<UserModel> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    UserModel user = UserModel(
      favoriteEventsIds: [],
      id: credential.user!.uid,
      name: name,
      email: email,
    );

    CollectionReference<UserModel> usersCollection = getusersCollection();
    await usersCollection.doc(user.id).set(user);
    return user;
  }

  static Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    CollectionReference<UserModel> usersCollection = getusersCollection();
    DocumentSnapshot<UserModel> docsnapshot = await usersCollection
        .doc(credential.user!.uid)
        .get();

    return docsnapshot.data()!;
  }

  static Future<void> logout() => FirebaseAuth.instance.signOut();

  static CollectionReference<UserModel> getusersCollection() =>
      FirebaseFirestore.instance
          .collection('users')
          .withConverter<UserModel>(
            fromFirestore: (docSnapshot, _) =>
                UserModel.fromjson(docSnapshot.data()!),
            toFirestore: (user, _) => user.tojson(),
          );

  static Future<void> addFavoriteEvent(String eventId) async {
    CollectionReference<UserModel> usersCollection = getusersCollection();

    DocumentReference<UserModel> doc = usersCollection.doc(
      FirebaseAuth.instance.currentUser!.uid,
    );
   return doc.update({
      'favoriteEventsIds': FieldValue.arrayUnion([eventId]),
    });
  }
    static Future<void> removeFavoriteEvent(String eventId) async {
    CollectionReference<UserModel> usersCollection = getusersCollection();

    DocumentReference<UserModel> doc = usersCollection.doc(
      FirebaseAuth.instance.currentUser!.uid,
    );
   return doc.update({
      'favoriteEventsIds': FieldValue.arrayRemove([eventId]),
    });
  }


  static Future<void> updateEvent(EventModel event) async {
  final doc = getEventsCollection().doc(event.id);
  await doc.update(event.tojson());
}

static Future<void> deleteEvent(String eventId) async {
  final doc = getEventsCollection().doc(eventId);
  await doc.delete();
}
}
