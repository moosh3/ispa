# Django
Based on the google doc, break down the site into Django views and models, specify what model fields are needed.

## Views
EX (just list them for now):
- EventHome
- Event 
- About Us
- TeamHome
- EventHistory
- Sponsors
- SignUp
- SignIn
- Blog
-Contact

## Models
EX:
- Event <-- MODEL NAME
  - name <-- MODEL FIELDS
  - date
  - location
  - description
  - time
  - type of event (speaker, ball game, meeting?)
  - rsvp? (going, not going, interested)

- Past Events (maybe seperate model for archiving special events (speakers or games??)
  - # of people that attended

- Blog
  - posts
    - author
    - date
    - time
    - description

