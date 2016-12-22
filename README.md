# To run on test input:
Requires ruby 2.4.0 to be run and should be executed from command line by 

rake run

# To run other test cases

rspec

# Algorithm
Greedy algorithm to fill out first room and add rest of meetings to second.

Steps:
- read meetings from file,
- create Schedule with 2 available rooms:
  - create Capacity for each Meeting room
  - checking capacity for First Meeting room and adding meetings one by one to it
  - add rest to other room

# Todo
More test cases coverage