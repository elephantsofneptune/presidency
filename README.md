## Presidency Rails Assessment

This is NEXTACADEMY Rails assessment. You are not allowed to copy or share the files from this repo without
written permission from NEXTACADEMY.

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

Vote
  a vote must have user_id
  a vote must have candidate_id

Presidential Candidate
  cannot be created without a name
    Then { candidate.valid? == false }
  cannot be created without a party
    Then { gift.valid? == false }
  can be created when both parameters are present
    Then { gift.valid? == true }
  can have many votes
    Then { votes.count == 5}
  scopes
    .highest_votes_first

User
  record creation
    cannot be created without a name
      Then { user.valid? == false }
    cannot be created without an email
      Then { user.valid? == false }
    can be created when both parameters are present
      Then { user.valid? == true }
  a user can vote for a president
    Then { president.votes.count += 1 }
  a user can only vote once
    Then { validate uniqueness of user_id }

home/index.html.erb
  displays president vote counts
  displays presidents for voting
  sets the current user's id as the voter inside the form

logins/show.html.erb
  displays the login screen

Finished in 0.66011 seconds (files took 1.74 seconds to load)
50 examples, 0 failures
```


## Some related reading:

* https://robots.thoughtbot.com/how-we-test-rails-applications
* https://youtu.be/URSWYvyc42M