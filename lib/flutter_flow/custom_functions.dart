import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double getLatitude(LatLng coords) {
  double latitude = coords.latitude;
  return latitude;
}

double getLongitude(LatLng coords) {
  double longitude = coords.longitude;
  return longitude;
}

List<UserPostsRecord> fetchPostV2(
  List<UserPostsRecord> postList,
  LatLng? userLocation,
) {
  List<UserPostsRecord> outputPosts = [];
  if (userLocation == null) {
    userLocation = LatLng(0, 0);
  }
  LatLng postLocation;
  for (UserPostsRecord post in postList) {
    //distance logic here
    if (post.postCoords != null) {
      postLocation = post.postCoords!;
      if (calculateDistance(userLocation, postLocation)! <= 50) {
        outputPosts.add(post);
      }
    }
  }

  return outputPosts;
}

double calculateDistance(
  LatLng coord1,
  LatLng coord2,
) {
  const double radiusOfEarthMiles = 3958.8; // Radius of the Earth in miles

  double lat1 = coord1.latitude;
  double lon1 = coord1.longitude;
  double lat2 = coord2.latitude;
  double lon2 = coord2.longitude;

  // Convert latitude and longitude from degrees to radians
  double lat1Rad = lat1 * (3.141592653589793 / 180);
  double lon1Rad = lon1 * (3.141592653589793 / 180);
  double lat2Rad = lat2 * (3.141592653589793 / 180);
  double lon2Rad = lon2 * (3.141592653589793 / 180);

  // Haversine formula
  double dLat = lat2Rad - lat1Rad;
  double dLon = lon2Rad - lon1Rad;
  double a = (math.sin(dLat / 2) * math.sin(dLat / 2)) +
      (math.cos(lat1Rad) *
          math.cos(lat2Rad) *
          math.sin(dLon / 2) *
          math.sin(dLon / 2));
  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  // Distance in miles
  double distance = radiusOfEarthMiles * c;

  return distance;
}
