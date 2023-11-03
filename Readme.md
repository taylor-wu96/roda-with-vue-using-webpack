# Roda project combine with Vue.js using webpack

This is a small project to combine Roda and Vue.js webpack
We implement a simple allow you to add a new todo the todo list using sequel and sqlite3 in ruby

1. set up the frontend module

```
$ npm i
```

2. build the frontend module

```
$ npm run prod
```

3. set the backend
```
$ bundle install
```

4. set the db
```
$ rake db:migrate
```

5.  Run the server
```
$ bundle exec puma config.ru
```
