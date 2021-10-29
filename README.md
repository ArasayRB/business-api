# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:
This is an JSON API small example in develop of how you can create an API RESTfull.

-Until now this API Endpoints:

* POST /signup 	Signup
* POST /auth/login 	Login
* GET /auth/logout 	Logout
* GET /busines 	List all busines
* POST /busines 	Create a new busine
* GET /busines/:id 	Get a busine
* PUT /busines/:id 	Update a busine
* DELETE /busines/:id 	Delete a busine and its services
* GET /busines/:id/services 	Get a busine service
* PUT /busines/:id/services 	Update a busine service
* DELETE /busines/:id/services 	Delete a busine service


* Ruby version: 6.1.4

* Configuration:

Have in count you need has install ruby language and rails framework for good function of this project, if you do not know how do it follow this instructions: https://tundaapo.medium.com/la-web-como-medio-de-comunicaci%C3%B3n-iniciando-con-rails-855c19ed0ef9
You need copy, download, or clone this project to your pc or test server and then unzip, you need position on the project folder by terminal

* Database creation:
This project was developed with sqlite data base, instelled by default with rails. Any case you need run:
 'rake db:create'

* Database initialization:
Then 'rails db:migrate' for this project function

* How to run the test suite
This API use Rspec, Shoulda, Faker, Factory and Database Cleaner for Test. Then you need execute 'bundle install', finally run 'bundle exec rspec'

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
Execute 'bundle install'

* ...
