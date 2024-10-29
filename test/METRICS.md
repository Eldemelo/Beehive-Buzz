# Metrics Design

https://docs.google.com/presentation/d/1mC2QXKMn1SFNsurnxRa_i1DmB5VBXfBqUc-nJzoK9UQ/edit?usp=sharing

## Heart framework metrics

### Happiness

* 

### Engagement

* Number of logins - Track when a user opens the app and logs in via a parameter that increases each time somebody logs in
* Average Engagement per active user - already available on Firebase

### Adoption

* Number of new accounts - Every time a user signs up, increment a counter saved in firebase


### Retention

* Compare Average engagement time per active user and number of logins in a period (with FlutterFlow variable).
* Monthly Active users - already available on Firebase

### Task Success

* Create/update profile - Increment a counter stored in Firebase when a user creates or updates their profile.