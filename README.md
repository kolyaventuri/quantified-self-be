# Quantified Self
### Backend Service

[![Build Status](https://travis-ci.com/kolyaventuri/quantified-self-be.svg?branch=master)](https://travis-ci.com/kolyaventuri/quantified-self-be)

Quantified Self is a self-hosted calorie tracker. Simply add foods, and keep track of what meals you ate it with to keep track of your calorie intake. **This is the backend API service.**

---
## Usage
### Installation

Clone down the repository and run `bundle install` to fetch the necessary gems.

### Running Quantified self

Quantified Self is a Rails app, and can therefore be run simply by using the `rails s` or `rails server` command. This will start the server on `localhost:3000`

**Please run or deploy the [frontend service](https://github.com/kolyaventuri/quantified-self-fe) in order to interact with the application as an end user.**

### Running Tests

The test suite can be run with `bundle exec rspec`. More simply, please refer to our [Travis CI])(https://travis-ci.com/kolyaventuri/quantified-self-be) page for the most up to date build and coverage statistics (without requiring a clone).

---
## Endpoints

#### GET /api/v1/foods
- Returns a JSON array of all foods in the database. Each food is represented as follows:
```js
{
  "id": 1,
  "name": "Banana",
  "calories": 150
},
```

#### GET /api/v1/foods/:id
- Returns a singular food object with the specified `:id`. Returns a 404 status code if the food does not exist.

#### POST /api/v1/foods
- Creates a new food with the following parameters. Returns a 400 status code if an error occurs. Both name and calories are required.
```js
{
  "food": {
    "name": "NAME",
    "calories": 100
  }
}
```

#### PATCH /api/v1/foods/:id
- Updates an existing food with the specified `:id`, with otherwise identical behavior to POST /api/v1/foods

#### DELETE /api/v1/foods/:id
- Deletes the food with the specified `:id` from the database and returns a 201 status code. Returns a 404 status code if the food is not found/

#### GET /api/v1/meals
- Returns all meals in the database, and their associated foods in the following format. Returns a 404 status code if the meal does not exist.
```js
[
  {
    "id": 1,
    "name": "Breakfast",
    "foods": [
      { <Food> },
      . . .
    ]
  },
  . . .
]
```

#### GET /api/v1/meals/:meal_id/foods
- Returns the meal specified by `:meal_id` and it's foods in the following format. Returns a 404 status code if the meal does not exist.
```js
{
  "id": 1,
  "name": "Breakfast",
  "foods": [
    { <Food> },
    . . .
  ]
}
```

#### POST /api/v1/meals/:meal_id/foods/:id
- Adds the food specified by `:id` to the meal specified by `:meal_id` and returns a 201 with the following body. If the meal _or_ food cannot be found, a 404 status code is returned.
```js
{
  "message": "Successfully added FOODNAME to MEALNAME"
}
```

#### DELETE /api/v1/meals/:meal_id/foods/:id
- Deletes the food specified by `:id` from the meal specified by `:meal_id`. Returns a 404 status code if the meal _or_ the food cannot be found.
```js
{
  "message": "Successfully removed FOODNAME from MEALNAME"
}
```
