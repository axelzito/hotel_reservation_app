# Hotel Reservation App

### This is an example system for managing reservations and hotels. Read this guide to set up the project on your environment and start using it.

## Prerequisites
### Before you begin, make sure you have the following installed on your machine:

* Ruby (version 3.2.2)
* Rails (version 7.0.7.2)
* MongoDB
* Postman (or any other API client)

## Project Setup
### Follow these steps to set up the project on your machine:

1. Clone this repository:
    ```
    git clone https://github.com/axelzito/hotel_reservation_app.git
    ```

2. Navigate to the project directory:
    ```
    cd hotel_reservation_app
    ```

3. Install Ruby dependencies:
    ```
    bundle install
    ```

4. Start the Rails server:
    ```
    rails server
    ```

* The system should now be running locally at http://localhost:3000.

## Using Postman
#### You can use Postman to interact with the system's API and make GET and POST requests for hotels and reservations. Here are some examples of how to use Postman:

##### Get all hotels
* Method: GET
* URL: http://localhost:3000/hotels
* Body: None
* Result: You will receive a list of all hotels in the system.

Example:
```json
[
    {
        "_id": {
            "$oid": "64f38840f4f70c1eec913a75"
        },
        "address": "Calle 123",
        "created_at": "2023-09-02T19:08:48.912Z",
        "description": "A luxurious hotel in a prime location.",
        "email": "hotel@example.com",
        "name": "Hotel Example",
        "phone": "+1234567890",
        "price_range": "$$$$$",
        "stars": "5",
        "updated_at": "2023-09-02T19:08:48.912Z"
    }
]
```

#### Create a new hotel
* Method: POST
* URL: http://localhost:3000/hotels
* Body (JSON):
```json
{
  "name": "Hotel Example",
  "address": "Calle 123",
  "stars": "5",
  "price_range": "$$$$$",
  "phone": "+1234567890",
  "email": "hotel@example.com",
  "description": "A luxurious hotel in a prime location."
}
```
* Result: A new hotel will be created in the system.

#### Get all reservations
* Method: GET
* URL: http://localhost:3000/reservations
* Body: None
* Headers:
    * Key: `Accept`
    * Value: `application/json`
* Result: You will receive a list of all reservations in the system.

Example:
```json
[
    {
        "_id": {
            "$oid": "64f37b8cf4f70cf9b8aca703"
        },
        "check_in": "2023-09-10",
        "check_out": "2023-09-13",
        "created_at": "2023-09-02T18:14:36.059Z",
        "currency": "USD",
        "guest_email": "johndoe@example.com",
        "guest_name": "John Doe",
        "hotel_id": {
          "$oid": "64f38840f4f70c1eec913a75"
        },
        "price": "150.0",
        "updated_at": "2023-09-02T18:14:36.059Z"
    },
    {
        "_id": {
            "$oid": "64f38a69f4f70c1eec913a76"
        },
        "check_in": "2023-09-15",
        "check_out": "2023-09-20",
        "created_at": "2023-09-02T19:18:01.733Z",
        "currency": "USD",
        "guest_email": "guest_name@example.com",
        "guest_name": "Guest Name",
        "hotel_id": {
            "$oid": "64f38840f4f70c1eec913a75"
        },
        "price": "150.0",
        "updated_at": "2023-09-02T19:18:01.733Z"
    }
]
```

#### Create a new reservation
* Method: POST
* URL: http://localhost:3000/reservations
* Body (JSON):
```json
{
  "reservation": {
    "hotel_id": "hotel_id",
    "price": "150.0",
    "currency": "USD",
    "check_in": "2023-09-15",
    "check_out": "2023-09-20",
    "guest_name": "Guest Name",
    "guest_email": "guest_name@example.com"
  }
}
```
* Result: A new reservation will be created in the system.
