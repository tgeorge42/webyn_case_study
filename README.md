# Traffic Data API

## Description

This project includes an API based on PHP/Symfony returning the traffic data of a fictionnal website. You can also see the data on a Angular frontend dashboard.

## Installation & Running

### 1. Prerequisites

make

docker

docker-compose

### 2. Environment Variables Configuration

Once the project is cloned on your local repository, you will need to add a .env file in the backend directory with those samples in it :

APP_ENV=dev

APP_SECRET=1e3390cf5a7a195a34b83acad26900ef

DATABASE_URL="postgresql://app:!ChangeMe!@127.0.0.1:5432/app?serverVersion=16&charset=utf8"

CORS_ALLOW_ORIGIN='^https?://(localhost|127\.0\.0\.1)(:[0-9]+)?$'


And a .env.dev :

APP_ENV=test

APP_DEBUG=true

KERNEL_CLASS='App\Kernel'

APP_SECRET='$ecretf0rt3st'

SYMFONY_DEPRECATIONS_HELPER=999999

PANTHER_APP_ENV=panther

PANTHER_ERROR_SCREENSHOT_DIR=./var/error-screenshots

Also add an empty .env.dev 


### 3. Install Dependencies and start the project

Using the Makefile, you can install dependencies and start the server and the client automatically :

make

### 4. Access the dashboard

The dashboard will be available on your local machine at http://localhost:4200/


## Features

An API that returns the data for the traffic of a website

A dashboard to visualize those data, with a filter to only see the data above a certain threshold

make test to launch a basic unit test

Technologies Used :

Frontend: Angular

Backend: PHP/Symfony


## Author

Thomas George

