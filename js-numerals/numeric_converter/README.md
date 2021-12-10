# README
This application convert the numeric input to English phrase of that number.

* Ruby version 3.0.0

* Rails version 6.1.4

## Getting started

To get started with the app, first clone the repo and `cd` into the directory:

```
$ git clone https://github.com/Harkamal/assessment.git
$ cd assessment/js-numerals/numeric_converter
```

Then install the needed gems (while skipping any gems needed only in production):

```
$ bundle install --without production
```

Install JavaScript dependencies:

```
$ yarn install
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test

$ rspec spec
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

## Application is deployed for testing.
[Try here](https://arcane-lake-87430.herokuapp.com/)
