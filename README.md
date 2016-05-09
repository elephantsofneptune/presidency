## Presidency Rails Assessment

This is NEXTACADEMY Rails assessment. You are not allowed to copy or share the files from this repo without
written permission from NEXTACADEMY.

This is a mock exercise to create a voting app for a Presidential Election. This is by no means representative of the actual US electoral process :p

## Duration
8 Hours

## Passing Rate
80% coverage

## To Start
1. Fork the repo.
2. Clone the repo down to your local machine.
3. Add your Ruby version into Gemfile.
4. Work on your solution (on branch).
5. Push and commit as frequent as possible (at least every 2 hours).
6. Raise a Pull Request.


## Guard
This project uses `guard` and `guard-rspec`. In your terminal, run:

    $ guard

and it will show something like the following:

    21:23:55 - INFO - Guard::RSpec is running
    21:23:55 - INFO - Guard is now watching at 'xxx'
    [1] guard(main)>

Whenever you save a file, `guard` will automatically run your tests.

## Filtering tests

There are a lot of tests, and you may get overwhelmed. If you want to focus on just one test that you're trying to implement, see https://relishapp.com/rspec/rspec-core/v/3-4/docs/filtering/inclusion-filters#focus-on-an-example

## List of specs:

``` rspec

SessionsController
  GET #show
    returns http success
  POST #create
    valid login
      creates user session
      redirect to root path if user is created
      welcomes user
    invalid login without email
    invalid login without name
      redirects back to the logins path if user did not get created
      shows error message
  DELETE #destroy
    sets session to nil when user logs out
    redirects back to to sessions path if user logs out
    shows logged out message

HomeController
  GET #index
    redirects to the login page if user is not yet registered or logged in
    prompts user to login first
    logged in
      returns http success
      renders the index template
      prepares the form vote object
      assigns @candidates

VotesController
  POST #create
    successfully created vote
      valid creation will increase vote count
      redirect to root path
      shows success message
    unsuccessfully created vote
      shows error message
  GET #index
    returns http success
    renders the index template
    assigns @votes

Vote
  record creation
    belongs to a user
    belongs to a candidate
  cannot be created without a candidate
  cannot be created without a user
  can be created when both user and candidate are present
  validations for vote
    user can only vote once

Presidential Candidate
  record creation
    must have name, party and image_url columns
    cannot be created without a name
      Then { candidate.valid? == false }
    cannot be created without a party
      Then { candidate.valid? == false }
    cannot be created without a image url
      Then { candidate.valid? == false }
    can be created when all parameters are present
      Then { candidate.valid? == true }
  returns calculated votes
    calculate candidate percentage votes
    calculate total votes
    ensures votes percentage is rounded to one decimal

User
  record creation
    should have name and email
    cannot be created without a name
      Then { user.valid? == false }
    cannot be created without an email
      Then { user.valid? == false }
    can be created when both parameters are present
      Then { user.valid? == true }
  validations for user
    cannot sign up with duplicated emails
    sign up with valid email
    sign up with invalid email

home/index.html.erb
  user has not voted
    has h1 title
    displays form with list of presidential candidates
    has logout link
    has link to voters listing page
    displays a voting form with radio inputs
  user has voted
    has h1 title to show result
    shows list of presidential candidates
    shows total votes
    shows candidate votes
    shows percentage of votes won

votes/index.html.erb
  displays list of votes
    displays index number
    displays voter name
    displays candidate name
    displays party
    displays as a table

logins/show.html.erb
  displays the login screen

VotesHelper
  calculate total votes
```

Finished in 0.72489 seconds (files took 2.22 seconds to load)
64 examples

## Some related reading:

* https://robots.thoughtbot.com/how-we-test-rails-applications
* https://youtu.be/URSWYvyc42M