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

      String userLat = userLocation.latitude.toString();
      String userLong = userLocation.longitude.toString();
      String postLat = postLocation.latitude.toString();
      String postLong = postLocation.longitude.toString();

      if (calculateDistance(userLat, userLong, postLat, postLong) <= 50) {
        outputPosts.add(post);
      }
    }
  }

  return outputPosts;
}

double calculateDistance(
  String userLat,
  String userLong,
  String postLat,
  String postLong,
) {
  const double radiusOfEarthMiles = 3958.8; // Radius of the Earth in miles

  double lat1 = double.parse(userLat);
  double lon1 = double.parse(userLong);
  double lat2 = double.parse(postLat);
  double lon2 = double.parse(postLong);

  // Convert latitude and longitude from degrees to radians
  double lat1Rad = lat1 * (math.pi / 180);
  double lon1Rad = lon1 * (math.pi / 180);
  double lat2Rad = lat2 * (math.pi / 180);
  double lon2Rad = lon2 * (math.pi / 180);
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

String? shortenState(String? longState) {
  // take in the full length name of a state and return the abbreviated variant using a map
  Map<String, String> stateAbbreviations = {
    'Alabama': 'AL',
    'Alaska': 'AK',
    'Arizona': 'AZ',
    'Arkansas': 'AR',
    'California': 'CA',
    'Colorado': 'CO',
    'Connecticut': 'CT',
    'Delaware': 'DE',
    'Florida': 'FL',
    'Georgia': 'GA',
    'Hawaii': 'HI',
    'Idaho': 'ID',
    'Illinois': 'IL',
    'Indiana': 'IN',
    'Iowa': 'IA',
    'Kansas': 'KS',
    'Kentucky': 'KY',
    'Louisiana': 'LA',
    'Maine': 'ME',
    'Maryland': 'MD',
    'Massachusetts': 'MA',
    'Michigan': 'MI',
    'Minnesota': 'MN',
    'Mississippi': 'MS',
    'Missouri': 'MO',
    'Montana': 'MT',
    'Nebraska': 'NE',
    'Nevada': 'NV',
    'New Hampshire': 'NH',
    'New Jersey': 'NJ',
    'New Mexico': 'NM',
    'New York': 'NY',
    'North Carolina': 'NC',
    'North Dakota': 'ND',
    'Ohio': 'OH',
    'Oklahoma': 'OK',
    'Oregon': 'OR',
    'Pennsylvania': 'PA',
    'Rhode Island': 'RI',
    'South Carolina': 'SC',
    'South Dakota': 'SD',
    'Tennessee': 'TN',
    'Texas': 'TX',
    'Utah': 'UT',
    'Vermont': 'VT',
    'Virginia': 'VA',
    'Washington': 'WA',
    'West Virginia': 'WV',
    'Wisconsin': 'WI',
    'Wyoming': 'WY',
  };

  return stateAbbreviations[longState];
}

List<UserPostsRecord>? filterPosts(
  List<UserPostsRecord>? userPosts,
  String? userLatitude,
  String? userLongitude,
  double maxDistance,
) {
  const double radiusOfEarthMiles = 3958.8; // Radius of the Earth in miles

  // Get a list of all posts
  List<UserPostsRecord> filteredPosts = [];

  // Handle null coordinates
  if (userLatitude == null || userLongitude == null) {
    userLatitude = "0";
    userLongitude = "0";
  }

  double userLatRad = double.parse(userLatitude) * (math.pi / 180);
  double userLonRad = double.parse(userLongitude) * (math.pi / 180);

  // Loop to check every post
  for (UserPostsRecord post in userPosts!) {
    // Determine distance between user and post coordinates
    double postLatRad = post.postLat * (math.pi / 180);
    double postLonRad = post.postLong * (math.pi / 180);
    // Haversine formula
    double dLat = postLatRad - userLatRad;
    double dLon = postLonRad - userLonRad;
    double a = (math.sin(dLat / 2) * math.sin(dLat / 2)) +
        (math.cos(userLatRad) *
            math.cos(postLatRad) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2));
    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    double distance = radiusOfEarthMiles * c;
    // If distance is less than user selected filter, show post
    if (distance <= maxDistance) {
      filteredPosts.add(post);
    }
  }

  return filteredPosts;
}

String getUsernameString(String username) {
  return "@" + username;
}

int removeOneCount(int numLikes) {
  return (numLikes - 1);
}

String? getUsernameWithoutAt(String? username) {
  if (username == null) {
    return null;
  }
  // this relies on "username" being a valid username starting with @
  // don't call this with anything else lol
  if (username[0] == '@')
    return username.substring(1);
  else
    return username;
}
