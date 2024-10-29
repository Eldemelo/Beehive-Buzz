# Metrics Design

https://docs.google.com/presentation/d/1mC2QXKMn1SFNsurnxRa_i1DmB5VBXfBqUc-nJzoK9UQ/edit?usp=sharing

## Heart framework metrics

### Engagement

* Number of logins - Track when a user opens the app and logs in via a parameter that increases each time somebody logs in

### Adoption

* Number of new accounts - Every time a user signs up, increment a counter saved in firebase
* Create/update profile - Increment a counter stored in Firebase when a user creates or updates their profile.










## NPS (Net Promoter Score)

## Adoption

## DAU

## Retention 
Compare Average engagement time per active user and number of logins in a period (with FlutterFlow variable).

## CTR (Click Thru Rate) for an event on the Golden Path. 

 for each metric, have a bullet explaining how you are collecting data for that metric in the backend. 
 
 This may be data already available in Firebase (e.g. Adoption via authentication signups), 
 or it may be code you need to add to your app (e.g. a NPS question at the end of the Golden Path 
 with data recorded in the database for that user). 
 
 This detail does not go in the HEART grid, it goes in a bulleted list after your grid in METRICS.md:

Metric 1 - how to collect
Metric 2 - how to collect
etc

Each team member should commit to the document at least one metric collection bullet (the graders will check the commits on your repo).
