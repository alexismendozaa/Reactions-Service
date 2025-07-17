# Reactions Service (Ruby on Rails)

This is a service built with Ruby on Rails to manage reactions (likes/dislikes) on posts. The service provides an API to register, remove, and query likes, as well as to retrieve the users who liked a post.

## Endpoints

### 1. `POST /likes`
**Register a Like**

This endpoint allows users to register a "like" on a specific post.

#### Request
- **URL**: `/likes`
- **Method**: `POST`
- **Body**:
```json
{
  "user_id": "integer",
  "post_id": "integer"
}
Description: This endpoint allows a user to register their "like" for a specific post.

Response
Status Code: 201 Created

Body:

json
Copiar
{
  "message": "Like successfully registered",
  "like_id": "integer"
}
2. DELETE /dislike
Remove a Like (Dislike)

This endpoint allows a user to remove a "like" previously registered on a post.

Request
URL: /dislike

Method: DELETE

Body:

json
Copiar
{
  "user_id": "integer",
  "post_id": "integer"
}
Description: This endpoint allows a user to remove their "like" (dislike) on a specific post.

Response
Status Code: 200 OK

Body:

json
Copiar
{
  "message": "Like successfully removed"
}
3. GET /likes/{post_id}
Count the Likes of a Post

This endpoint returns the total number of "likes" registered for a specific post.

Request
URL: /likes/{post_id}

Method: GET

Parameters:

post_id: The ID of the post for which likes should be counted.

Response
Status Code: 200 OK

Body:

json
Copiar
{
  "post_id": "integer",
  "likes_count": "integer"
}
Description: Returns the total number of "likes" for the post.

4. GET /likes/{post_id}/users
List Users Who Liked a Post

This endpoint returns a list of users who have "liked" a specific post.

Request
URL: /likes/{post_id}/users

Method: GET

Parameters:

post_id: The ID of the post for which users should be listed.

Response
Status Code: 200 OK

Body:

json
Copiar
{
  "post_id": "integer",
  "users": [
    {
      "user_id": "integer",
      "username": "string"
    },
    ...
  ]
}
Description: Returns a list of users who have "liked" the specified post.

Installation
Clone the repository:

bash
Copiar
git clone https://github.com/yourusername/reactions-service.git
Install dependencies:

bash
Copiar
cd reactions-service
bundle install
Set up the database:

bash
Copiar
rails db:create
rails db:migrate
Start the server:

bash
Copiar
rails server
The application will be available at http://localhost:3000.

