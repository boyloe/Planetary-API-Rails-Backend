# Planetary-API

> Hackathon solar system visualization

![Planetary GIF](https://media4.giphy.com/media/drpYCTRAjkM8AVMWJ2/giphy.gif)

![Planetary Image](https://i.imgur.com/ITMBORH.png)

## Table of Contents

- [General Info](#general-info)
- [Technologies](#technologies)
- [Setup](#setup)
- [Code Examples](#code-examples)
- [Features](#features)

## General Info

We built this project for a half-day hackathon. The project includes a fun visualization of the solar system along with cards displaying planet-specific data fetched from an API.

## Technologies

- HTML5
- CSS
- Flaticon
- JavaScript
- Ruby
- Rails
- OpenData of the Solar System API

## Setup

- Clone down the Backend (https://github.com/boyloe/Planetary-API-Rails-Backend), run `rails db:migrate`, run `rails:db seed`, and start the server by running `rails s` (must be on port 3000).
- Clone down the Frontend (https://github.com/TJBachorz/planetary-api-front-end) and start a server (we recommend lite-server).

## Code Examples

```ruby
def get_data
    response = RestClient.get("https://api.le-systeme-solaire.net/rest/bodies/")
    data = JSON.parse(response)
    planets =  data['bodies'].select do |body|
        body['isPlanet'] == true && !body['name'].match(/\d/)
    end
    planets = planets.min_by(planets.length) {|planet| planet["perihelion"]}
    planets
end
```

```ruby
def create_planets
    get_data.each do |planet|
        Planet.create(
            name: planet["englishName"],
            moons: planet["moons"] ? planet["moons"].length : 0,
            diameter: (planet["meanRadius"]*2),
            gravity: (planet["gravity"]/9.8).round(2),
            perihelion: planet["perihelion"])
    end
end
```

## Features

- View a fun visualization of the solar system
- View cards with planet-specific data
