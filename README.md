# Carrie's-Closet
The Carrie's Closet app is a mobile app that centralizes the numerous donation requests received by Carrie's Closet and adds functionality
through the ability to submit requests, save contact information, view donation history, and more, benefiting both users and admins.


# Release Notes

## Version 1.0.0

### New Features

- Users can fill out a request form and hitting the “Submit Request” button will send the request to the database.
- Multiple items can be added to a single request.
- Users can view previously created requests.
- Users can delete previously created requests.
- Administrators can view all “processed” requests.
- Administrators can complete or deny requests.
- Administrators can view all users actively in the database.
- Administrators can make other users administrators.

### Bug Fixes

- System properly directs users/admins to their respective home pages after visiting a page that exists on both the user and admin home pages.
- The “View Orders” page for admins only displays “Processed” requests. “Completed” and “Denied” requests will no longer appear.
- The “View Users” page for admins now displays the users’ names and not their IDs from the database.
- Multi-form now validates for each field for every item.
- Multi-form works with adding multiple items in the confirmation page

### Known Bugs

- Edit profile will load in the previous user’s logged in information, and changing it will edit the previous user’s information. Occurs when you log in as one user, then logout and sign up as a new user.
- There is overflow on certain pages for some Android devices.


## Version 0.5.0

### Features

- Multi-items in one request: Can add multiple items in a single request, which will submit as separate requests in the database
- View current information through Edit Profile: Edit Profile information now populates with currently logged in user's information 
- Request confirmation page now properly loads in user's contact information and the delivery address

### Bug Fixes

- Fixed overflow issues on confirmation pages on android
- System now checks whether a user is an admin or not to redirect the user to the correct page. This fixed issues of users being redirected to admin pages when they were not admins
- View orders as admin now only see "Processed" requests. Completed and denied requests will not appear anymore 
- View users as admin will display the users' names and not their IDs from the database

### Known Issues

- Edit profile will load in previous user's logged in information and changing it will edit the past user's information. Happens when you log in as a user, then logout and sign up a new user.


## Version 0.4.0

### Features

- Delete user as Admin: Admins can now view the users in the system and also delete users
- Update user to be an Admin as Admin: Admins can update a regular user to be an Admin
- Delete request as User: users can delete their requests from the database

### Bug Fixes

- Fixed issue sign up not properly sending in all information to the database
- System now checks whether a user is an admin or not to redirect the user to the correct page. This fixed issues of users being redirected to admin pages when they were not admins.

### Known Issues

- If a user is an admin already, the "Make admin" button should be greyed out to signify that when viewing users as Admin
- Users should only be able to view the requests that they have made, not all requests in the database
- Admins are not able to complete or deny the status of the requests yet
- After an admin submits a request, the page goes to the user home page instead of the admin home page
- If there are multiple requests, there's no scroll down feature to view the requests below in the view requests page


## Version 0.3.0

### Features

- View Requests: Admins can now view requests currently in the database
- View Users: Admins can now view all users currently in the database

### Bug Fixes

- Fixed issue with login crashing when not entering values in email and/or password
- Fixed re-enter password so that passwords must now match and be typed separately
- Email used for signup must be a real email
- Users now to to profile page after clicking sign up 

### Known Issues

- No implemented logic yet to verify if a user has admin permissions or not


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
