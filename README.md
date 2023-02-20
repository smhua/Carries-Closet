# Carrie's-Closet
The Carrie's Closet app is a mobile app that centralizes the numerous donation requests received by Carrie's Closet and adds functionality
through the ability to submit requests, save contact information, view donation history, and more, benefiting both users and admins.


# Release Notes

## Version 0.2.0

### Features

- Login: Login page now communicates with the database and authorizes users
- Sign up: Sends a new user with new information to the database for future log in
- Forgot Password: User can replace their old password
- Requests: Users can fill out a request form and hitting "Submit" will send the request to the database

### Bug Fixes

- Fixed many issues with frontend spacing lining up on Android but not properly on IOS
- Fixed issues with user log in not properly communicating with Firebase authentication

### Known Issues

- Profile page filled with new user information when signing up a new user cannot has been linked to the database yet


## Version 0.1.0

### Features

- Front end: Created admin and user login page, opening page, sign up page, and make account page
- Back end: Set up the date base and python file with CRUD operations that initalizes and connects to Firebase database and Flask API

### Bug Fixes

- N/A

### Known Issues

- Sign up page which should create a new unique user in the database has not been implemented yet 
