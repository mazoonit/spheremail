# SphereMail Task @mazoonit


### How to run migrations ?
- cd to the project dir
- bin/rails db:migrate
### How to run RSpec tests ?
- cd to the project dir
- rspec
### How to play with the models ?
- cd to the project dir
- bin/rails console
### How to run the server ? 
- cd to the project dir
- bin/rails server

### Problem
##Software Requirements Specification##
We need to store data about families living in a city. Specifically, we need the following info:

- Name and age of father;
- Name and age of mother;
- Name, sex (male, female) and age of each child in the family;
- House address.
Implement database and rails models for storing information we need. (Do not implement view and controllers)

Business constrains:

- Do not allow to store information about family without the house address provided.
- Do not allow to store information about children without the sex value provided.

Create RSpec tests to make sure the business constraints are working.

Implement a query that will count how many females and males living in the city.
