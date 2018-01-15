[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# User Manager

This repository contains a simple demo API built with NodeJS.
The API is used to manage users in a MongoDB database.

### Guide to Setup Docker and Deploy

## FOR LINUX USERS(NON-VIRTUALIZED PC[This computer doesn't have VT-X/AMD-v enabled])
* Clone the repository by entering the command in the terminal.
```bash
git clone https://github.com/nerdeveloper/UserManager.git

```
* Navigate to the project folder using `cd UserManager` on your terminal 

* Run the deployment script to set up 
```bash
npm i && touch .env && cp -r .env-sample .env && chmod +x setup.sh && ./setup.sh
```
#### Warning
There is no need to Install Docker or any other Program(manually). This [Shell Script](setup.sh) I have developed checks for all the Programs required(Installed or not) for a successful Deployment.

## FOR MAC OS/LINUX USERS(VIRTUALIZED PC[This computer has VT-X/AMD-v enabled])
* Clone the repository by entering the command in the terminal.
```bash
git clone https://github.com/nerdeveloper/UserManager.git

```
* Navigate to the project folder using `cd UserManager` on your terminal 

* Run the deployment script to set up 
```bash
npm i && touch .env && cp -r .env-sample .env && chmod +x install.sh && ./install.sh
```
#### Warning
There is no need to Install Docker or any other Program(manually). This [Shell Script](install.sh) I have developed checks for all the Programs required(Installed or not) for a successful Deployment.

### Development
This application was developed using [ExpressJS](http://expressjs.com/). MongoDB was used for persisting data with [Mongoose](https://mongoosejs.com/) as [ORM](https://en.wikipedia.org/wiki/Object-relational_mapping).

### Installation
* Start up your terminal (or Command Prompt on Windows OS).
* Ensure that you've `node` installed on your PC.
* Clone the repository by entering the command `git clone https://github.com/andela-bolajide/UserManager` in the terminal.
* Navigate to the project folder using `cd UserManager` on your terminal (or command prompt)
* After cloning, install the application's dependencies with the command `npm install`.
* Create a `.env` file in your root directory as described in `.env.sample` file. Variables such as DB_URL (which must be a mongoDB URL) and PORT are defined in the .env file and it is essential you create this file before running the application.
```
PORT=3000
DB_URL='mongodb://john:doe@localhost:27017/databaseName'
```
* After this, you can then start the server with the command: `npm start`.

### Testing
To ensure that your installation is successful you'll need to run tests.
The command: `npm test` makes this possible. It isn't functional right now, but once it's done you'll be notified via the README.

### API Documentation
The API only has one endpoint which is the `/users` endpoint for saving users to the database. The endpoint works with the HTTP verbs: `POST`, `GET`, `PUT`, `DELETE`.

###### POST HTTP Request
-   `POST` /users
-   INPUT:
```x-form-url-encoded
name: John Doe
email: john.doe@gmail.com
password: johndoe
```

###### HTTP Response

-   HTTP Status: `201: created`
-   JSON data
```json
{
  "_id": "59071791b0lkscm2325794",
  "name": "John Doe",
  "email": "john.doe@gmail.com",
  "password": "johndoe",
  "__v": 0
}
```

###### GET HTTP Response
-   `GET` /users

```json
[
    {
        "_id": "59071791b0lkscm2325794",
        "name": "John Doe",
        "email": "john.doe@gmail.com",
        "password": "johndoe",
        "__v": 0
    }
]
```

###### GET HTTP Response
-   `GET` /users/:id

```json
{
    "_id": "59071791b0lkscm2325794",
    "name": "John Doe",
    "email": "john.doe@gmail.com",
    "password": "johndoe",
    "__v": 0
}
```

###### DELETE HTTP Response
-   `DELETE` /users/:id

```json
User John Doe was deleted
```

###### POST HTTP Request
-   `PUT` /users/:id
-   INPUT:
```x-form-url-encoded
name: Jane Doe
email: jane.doe@gmail.com
password: janedoe
```

###### HTTP Response

-   HTTP Status: `200: OK`
-   JSON data
```json
{
  "_id": "59071791b0lkscm2325794",
  "name": "Jane Doe",
  "email": "jane.doe@gmail.com",
  "password": "janedoe",
  "__v": 0
}
```



### Author
**Olajide Bolaji 'Nuel** - Software Developer at Andela
