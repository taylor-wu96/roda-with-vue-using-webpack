# Roda project combine with Vue.js using webpack

This is a small project to combine Roda and Vue.js webpack
We implement a simple allow you to add a new todo the todo list using sequel and sqlite3 in ruby

## How to set-up the project locally

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

4. set the envirnment
- rename the `./config/secrets_exapmle.yml` to `./config/secrets.yml`

5. set the db
```
$ rake db:migrate
```

6.  Run the server
```
$ bundle exec puma config.ru
```

## system architecture

### frontend

```

[dist]
    ├── favicon.ico
    ├── index.html
    ├── main.bundle.js
    └── main.bundle.js.LICENSE.txt

[frontend_app]
    ├── App.vue
    ├── main.js
    ├── [pages]
        ├── AboutPage.Vue
        ├── HomePage copy.vue
        └── HomePage.vue
    ├── [router]
        └── index.js
    ├── [static]
        ├── favicon.ico
        ├── global.css
        └── images.png
    └── [templates]
        └── index.html

[node_modules]

package-lock.json
package.json

[webpack]
    ├── webpack.common.js
    ├── webpack.dev.js
    └── webpack.prod.js
```

### backend

```
.ruby-version
Gemfile
Gemfile.lock
Procfile
Procfile.dev
Rakefile

[backend_app]
    ├── [controllers]
        └── App.rb
    ├── [db]
        ├── [migration]
            └── 001_todos_create.rb
        └── [store]
            └── development.db
    └── [models]
        └── todo.rb

[config]
    ├── envirnoment.rb
    └── secrets_exapmle.yml
    
config.ru
require_app.rb

```
