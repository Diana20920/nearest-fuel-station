# Nearest Fuel Station

### Versions

Ruby 2.5.3

Rails 5.2.4.3

### Set Up

You will need an API key from each [NREL](https://developer.nrel.gov/signup/) and [MAPQUEST](https://developer.mapquest.com/user/me/apps).

- Clone this repo (Fork first if you wish push to it)
- `bundle install`
- `bundle exec figaro install`
  - Set up your environment variables to `NREL` and `MAPQUEST`
- `rails db:{create,migrate}`
- `rails s`

### Used Resources
- [Original Repo from Turing](https://github.com/turingschool-examples/nearest-fuel-station)
- [NREL](https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/#json-output-format) Nearest Station Endpoint
- [Mapquest](https://developer.mapquest.com/documentation/directions-api/route/get/) Route Endpoint
