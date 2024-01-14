# README
I spent a while attempting to host MonicaHQ on my personal machine, unsuccessfully; ultimately, I decided this was a project that it would be worth my time to build myself, as there were a number of features in MonicaHQ that I didn't care about, and there are a number of features I want that didn't exist there, and I need to be spending more time in code.

# To Do
* Development => Production
  * MongoDB?
* Devise
  * https://medium.com/@learnwithalfred/rails-7-authentication-with-devise-gem-add-custom-fields-a633982bef58
    * look into all this
  * password resets, confirmation e-mails, etc.
  * require strong passwords
  * https://bogotobogo.com/RubyOnRails/RubyOnRails_Devise_Authentication_Sending_Confirmation_Email.php
  * How to stop non-privileged from accessing pages? Can easily restrict data, but....
    * https://stackoverflow.com/questions/11230130/rails-routes-based-on-condition
    * ??encrypt id's?? Do we care if id's of records are exposed??
  * Entitities Controller:
    * before_show: check that current_user has access to that id
    * https://blog.arkency.com/2014/07/4-ways-to-early-return-from-a-rails-controller/
  

# Resources
* https://guides.rubyonrails.org/getting_started.html
* https://dev.to/kevinluo201/how-to-setup-very-basic-devise-in-rails-7-55ia

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