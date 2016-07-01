# FibonacciService

REST service to calculate a fibonacci seqenece

## Installation

    $ bundle install


## Dependencies
* ruby
* docker (optional)


## Deployment

### Docker
    bundle exec rake docker:build
    docker run -d -p 8080:8080 fibonacci_service
    
### Local
    bundle exec bundle exec rackup -o 127.0.0.1 -p 9292 config.ru
    

## Usage
### /fibonacci/\# 

Calling this endpoint will rerun a hash with the return code and an array containing fibonacci seqence for the number specified. If it is called with a non-positive integer a HTTP 400 will be returned.

  ex:
  
``` 
$ curl http://localhost:8080/fibonacci/10   
{"code":200,"value":[0,1,1,2,3,5,8,13,21,34]}
```   


## Testing

```
bundle exec rspec
```