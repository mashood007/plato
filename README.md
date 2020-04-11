# README

PLATO 

Things which are used:

* Ruby 2.5.1 

* Rails 5.2

* Postgres 10.1

The GEMS which helped me
 => Devise
  In this project I used the devise GEM for user authentication
  
  
 => omniauth-facebook
  This GEM is used to help user authentication with the facebook account
  
  
 => bootstrap
  This GEM is used to include the bootstrap libraries
  
  
 => jquery-rails
  THis GEM is used to include the jquery libraires
  

* Prepends

  => rake db:migrate
  
  => rake db:seed
  
    ( Here some default records, which are enterd to the subscriptions tables)
    
=> Project Importing

curl -v   -H "Accept: application/json"   -H "Content-type: application/json"   -X POST   -d ' {"project":{"organisation":{"name":"sample","loacation":"org","subscription_id":"2", "number_of_users":"2","number_of_boards":"-1"},"users":{"0":{"user":{"email":"benz@sample.com","name":"ben","password":"123456", "normal_user":"false"}},"1":{"user":{"email":"senz@sample.com","name":"sen","password":"123456", "normal_user":"true"}}}}}'    https://paltov2.herokuapp.com/api/v1/projects

