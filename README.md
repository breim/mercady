# Hello ( Introduction ) !

This project aims to be a platform where markets can post their products / prices. Where are found according to the user's proximity.

We accept forks!


# How start ?

It's simple! clone current branch.

Terminal
```sh
git clone https://github.com/breim/mercady.git
```

Now you need create database configuration. We uses mysql on development,however in procution we uses postgresql.

```sh
cd mercady/config
touch database.yml
```

Now edit database.yml with your configurations like this

```sh
default: &default
  adapter: mysql2
  encoding: utf8
  pool: 5
  username: YOUR USER DB HERE
  password: YOUR PASSWORD DB HERE
  socket: /var/run/mysqld/mysqld.sock
```
After do this step return to mercady root app and run these ones commands

```sh
bundle install
rake db:create
rake db:migrate
```

Yeah! everything ok ?
RUN RUN FOREST!

```sh
rails server
```

And now access in your browser http://0.0.0.0:3000

##### Be happy :)