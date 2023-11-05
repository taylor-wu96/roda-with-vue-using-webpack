# Demonstration Todo Web App Combining Roda + Vue.js w/ Webpack

This is a small project to demonstrate how to combine Roda and Vue.js with webpack.
Running the application allows you to add/delete a todos the todo list.

## Setting up the project locally

1. set up the frontend module

  ```shell
  npm i
  ```

2. build the frontend module

  ```shell
  npm run prod
  ```

3. set the backend

  ```shell
  bundle config set --local without 'production'
  bundle install
  ```

4. set the envirnment

  Rename the `./backend_app/config/secrets_example.yml` to `./backend_app/config/secrets.yml`

5. set the db

  ```shell
  bundle exec rake db:migrate
  ```

## Run the web app

```shell
bundle exec foreman start
```

or:

```shell
bundle exec puma
```

## System Architecture

The application is split into files/folders for back-end and front-end. See the relevant files for each part of the application below.

### Frontend

```text
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

### Backend

```text
.ruby-version
Gemfile
Gemfile.lock
Procfile
Procfile.dev
Rakefile

[backend_app]
    ├── [config]
        ├── envirnoment.rb
        └── secrets_example.yml
    ├── [controllers]
        └── App.rb
    ├── [db]
        ├── [migration]
            └── 001_todos_create.rb
        └── [store]
            └── development.db
    └── [models]
        └── todo.rb
    
config.ru
require_app.rb
```
