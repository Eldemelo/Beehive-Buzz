# Metrics Design

https://docs.google.com/presentation/d/1mC2QXKMn1SFNsurnxRa_i1DmB5VBXfBqUc-nJzoK9UQ/edit?usp=sharing

## Heart framework metrics

### Happiness

*  Net Promoter Score (Reviews) - Before logging out, ask new users to rate the app from 1 out of 5 stars. 

### Engagement

* Number of active daily users - Tracks how many users log in and use the app daily
* Average Engagement per active user - already available on Firebase

### Adoption

* Number of new accounts - Every time a user signs up, increment a counter saved in firebase


### Retention

* Compare Average engagement time per active user and number of logins in a period (with FlutterFlow variable).
* Monthly Active users - already available on Firebase

### Task Success

* Create/update profile - Increment a counter stored in Firebase when a user creates or updates their profile.