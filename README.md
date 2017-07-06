[![Code Climate](https://codeclimate.com/github/dijonkitchen/shopping-api/badges/gpa.svg)](https://codeclimate.com/github/dijonkitchen/shopping-api)

[![Build Status](https://travis-ci.org/dijonkitchen/shopping-api.svg?branch=master)](https://travis-ci.org/dijonkitchen/shopping-api)

[![Test Coverage](https://codeclimate.com/github/dijonkitchen/shopping-api/badges/coverage.svg)](https://codeclimate.com/github/dijonkitchen/shopping-api/coverage)

# README

## What

An API for shopping

## Why

Testing [Grape](https://github.com/ruby-grape/grape/blob/v0.19.2/README.md) as a Rails API back-end.

I figure it's a good convention over configuration setup and can get things going pretty quickly compared to using a plain Rails API. Additionally, I think it's important that an API be well-documented for users, and I've read that Swagger would be a good convention for documentation.

Originally, I wanted to use [active_model_serializers](https://github.com/rails-api/active_model_serializers), but they're in the middle of overhauling it.

## How

Ensure you have Ruby and Rails installed, then clone the repo and run the following in the terminal:

```sh
bundle install
bundle exec rake db:setup
bundle exec rails server
```

## Where

You can track progress in the [Projects](https://github.com/dijonkitchen/shopping-api/projects) section.

Overall, the project was really interesting. I got to learn to use a new API-centric framework with popular conventions. Certain parts were more involved than I had predicted, but it was a good challenge and refreshed my skills in TDD, SQL, and algorithms.

### Future considerations

#### Features

If we wanted to give customers the ability to create lists of products for one-click ordering of bulk items, it should be possible to reuse the Orders table since it's already a collection of products. This saves some space in the database, but may be a little tricky taking into account time and quantity sold over time. Maybe instead, we could have customers create lists of things to buy and then let them make an order on a list. This would change the [schema](https://github.com/dijonkitchen/shopping-api/blob/master/db/schema.png) a bit and make counting the orders for a product a little harder, but not impossible.

If we knew the exact inventory of stores, and when facing a high traffic and limited supply of a particular item, we could distribute the inventory among customers checking out by just doing a simple first come, first serve model. One tradeoff of this is that someone could order a lot of a rare item and not let anyone else have it! Perhaps a fairer model would be to limit the amount people can buy by a certain number (5?) so that one person doesn't buy thousands.

#### Technical

Unfortunately, Grape also did a major version release to 1.0.0 while I built this, so it'll need to be converted. I don't foresee any big changes since this was a simple proof of concept.

After that, I'd also look into incorporating [grape-swagger](https://github.com/ruby-grape/grape-swagger) for documentation of the API for people to use it.

## Who

[Me](https://www.linkedin.com/in/jonathanschen/)
