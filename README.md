## Pincode Accounting
Two-factor authentication accounting service.

## Setup
1. Setup and start main service: https://github.com/IlyaDonskikh/pincode
2. Clone current repository and start like basic rails app.
3. Open web page and generate api_key.

## Operations

### Create
```ruby
POST '/v1/pins/', 
     api_key: $api_key, 
     id: $id, 
     message: $message, 
     phone: $phone, 
     attempts: $attempts, 
     expire: $expire, # seconds
     sender: $sender_params
```

### Check
```ruby
GET '/v1/pins/$id/check', api_key: $api_key, code: $code
```

## Responses
if code is valid server return the status ```200```, else response will be ```403```.

## Bonuces
Also i was started a cloud service and you can try this code in production mode here: http://www.pinc0de.com/. 

## License
Pinc0de Accounting is released under the [MIT License](http://www.opensource.org/licenses/MIT).

