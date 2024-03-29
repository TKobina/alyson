# README
I spent a while attempting to host MonicaHQ on my personal machine, unsuccessfully; ultimately, I decided this was a project that it would be worth my time to build myself, as there were a number of features in MonicaHQ that I didn't care about, and there are a number of features I want that didn't exist there, and I need to be spending more time in code.

# NOTES
## Seeding
### Mock Data
* Use SeederClass and seed_mock.rake to generate mock data
  * Prerequisites:
    * Faker gem
    * Devise gem
    * Gmail account for testing & a test password in the application credentials
      * Using credentials.yml.enc to store a base gmail account for testing
        * rails credentials:edit
        * add line with the base "username" (everything before the @gmail.com): 
          * mock_seeding_email: "testemail"
          * Accessible by Rails.application.credentials.mock_seeding_email
        * add line with the mock password:
          * mock_password: "TestPassword"
          * * Accessible by Rails.application.credentials.mock_password
  * Set options (like the number of mock users to generate, etc.) in the rake file
  * Commands
    * rails db:seed_mock
    * rails db:unseed_mock

# TO DO
## General
* ~~Rough-in: Events: Controller & Views~~
* Add: Seed!
  * ~~check that mock data isn't uploaded to github~~
  * ~~populate mock_data_example.yml~~
  * ~~add unseeed_mock.rake~~
* Add: flash for attempting to access record of different user?
  * send to 404?
  * Or, if attempting to access id that doesn't exist, flash and redirect to events/entities_path?
* Extend: all New/Edit views: add cancel button to form
* Rough-in: EntitiesEvents
  * Add to seeding
* Rough-in: Relationships
  * Add to seeding
* Add: Contact Methods
* Extend: Entities
  * Type
    * Person
    * Location
  * Contact information
  * Dates/Birthday
* Extend: Events
* Refactoring
  * ~~abstract: check_ownership into a concern?~~
* Development => Production
  * MongoDB?
* Buttons and links, uh
* ## Devise/Authentication
* Devise
  * https://medium.com/@learnwithalfred/rails-7-authentication-with-devise-gem-add-custom-fields-a633982bef58
    * look into all this
  * password resets, confirmation e-mails, etc.
  * require strong passwords
  * https://bogotobogo.com/RubyOnRails/RubyOnRails_Devise_Authentication_Sending_Confirmation_Email.php
  * How to stop non-privileged from accessing pages? Can easily restrict data, but....
    * https://stackoverflow.com/questions/11230130/rails-routes-based-on-condition
    * ??encrypt id's?? Do we care if id's of records are exposed??
* Deletion of accounts
  * Should probably add this functionality
  * Make sure to delete records belonging to that user
## Error Handling
* NoMethodError in EventsController#index
  * when not logged in and attempt to access a page that requires a user be privileged....

# NOTES FOR MYSELF
# Devise
* $ rails g devise:views
* configuring
  * config/initializers/devise.rb
    * config.timeout_in = 30.minutes
  * config/locales/devise.en.yml
* methods
  * user_signed_in?
  * current_user
  * user_session

# Resources
* https://guides.rubyonrails.org/getting_started.html
* Devise
  * https://dev.to/kevinluo201/how-to-setup-very-basic-devise-in-rails-7-55ia
* DB & ActiveRecord stuff
  * https://reintech.io/blog/how-to-add-and-remove-columns-from-a-database-in-rails
  * https://rachelaemmer.medium.com/building-a-many-to-many-relationship-in-rails-efeee50a23ad
  * https://emcorrales.com/blog/rails-setup-multiple-associations-same-model
* Rake Tasks
  * https://medium.com/geekculture/writing-custom-rake-tasks-f656f43336cc
* Forms & Buttons & Links
  * https://dev.to/konnorrogers/escaping-the-traditional-rails-form-4c4o