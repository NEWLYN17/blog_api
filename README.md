# Blog API

This is a simple Blog API built using Ruby on Rails (RoR) with JWT authentication, allowing users to create, read, update, and delete blog posts. The API also supports user registration and authentication, liking posts, and rate-limiting. Environment variables are used to manage sensitive credentials.

---

## Features

- **User Authentication**: JWT-based authentication for secure login and signup.
- **CRUD Operations**: Full CRUD support for blog posts.
- **Like Feature**: Users can like/unlike posts.
- **Pagination**: Posts can be paginated for better data management.
- **Search**: Search for posts by title.
- **Authorization**: Role-based access control using Pundit.
- **CORS**: Configured to handle cross-origin requests.
- **Rate Limiting**: Prevents excessive API calls.

---

## Prerequisites

Ensure you have the following installed:

- Ruby 3.x
- Rails 7.x
- SQlite
- Node.js
- Yarn
- Git

---

## Setup

1. **Clone the Repository:**
   ```bash
   git clone <repository_url>
   cd blog_api
   ```

2. **Install Dependencies:**
   ```bash
   bundle install
   yarn install
   ```

3. **Set Environment Variables:**
   Create a `.env` file in the root directory and add:
   ```bash
   JWT_SECRET_KEY=your_secret_key_here
   ```
   Generate a secret key using:
   ```bash
   rails secret
   ```

4. **Set Up the Database:**
   ```bash
   rails db:create
   rails db:migrate
   ```

5. **Start the Server:**
   ```bash
   rails server
   ```
   The server will run at `http://localhost:3000`.

---

## API Endpoints

### Authentication

1. **Register**
   - **URL**: `POST /auth/register`
   - **Description**: Create a new user account.
   - **Request Body**:
     ```json
     {
       "name": "John Doe",
       "email": "john@example.com",
       "password": "password123",
       "password_confirmation": "password123"
     }
     ```
   - **Response**:
     ```json
     {
       "token": "<jwt_token>",
       "user": {
         "id": 1,
         "name": "John Doe",
         "email": "john@example.com"
       }
     }
     ```

2. **Login**
   - **URL**: `POST /auth/login`
   - **Description**: Authenticate user and return a JWT token.
   - **Request Body**:
     ```json
     {
       "email": "john@example.com",
       "password": "password123"
     }
     ```
   - **Response**:
     ```json
     {
       "token": "<jwt_token>",
       "user": {
         "id": 1,
         "name": "John Doe",
         "email": "john@example.com"
       }
     }
     ```

### Posts

1. **List Posts**
   - **URL**: `GET /posts`
   - **Description**: Fetch all posts with optional pagination and search.
   - **Query Parameters**:
     - `page`: Page number (optional).
     - `query`: Search query for titles (optional).
   - **Response**:
     ```json
     [
       {
         "id": 1,
         "title": "My First Post",
         "content": "This is the content.",
         "user": {
           "id": 1,
           "name": "John Doe"
         }
       }
     ]
     ```

2. **Create Post**
   - **URL**: `POST /posts`
   - **Description**: Create a new post (requires authentication).
   - **Request Header**:
     - `Authorization: Bearer <jwt_token>`
   - **Request Body**:
     ```json
     {
       "title": "New Post",
       "content": "Post content here."
     }
     ```
   - **Response**:
     ```json
     {
       "id": 1,
       "title": "New Post",
       "content": "Post content here.",
       "user_id": 1
     }
     ```

3. **Get Post Details**
   - **URL**: `GET /posts/:id`
   - **Description**: Fetch details of a specific post.
   - **Response**:
     ```json
     {
       "id": 1,
       "title": "My First Post",
       "content": "This is the content.",
       "user": {
         "id": 1,
         "name": "John Doe"
       }
     }
     ```

4. **Update Post**
   - **URL**: `PATCH /posts/:id`
   - **Description**: Update a post (requires authentication).
   - **Request Header**:
     - `Authorization: Bearer <jwt_token>`
   - **Request Body**:
     ```json
     {
       "title": "Updated Title",
       "content": "Updated content."
     }
     ```
   - **Response**:
     ```json
     {
       "id": 1,
       "title": "Updated Title",
       "content": "Updated content.",
       "user_id": 1
     }
     ```

5. **Delete Post**
   - **URL**: `DELETE /posts/:id`
   - **Description**: Delete a post (requires authentication).
   - **Request Header**:
     - `Authorization: Bearer <jwt_token>`
   - **Response**:
     ```json
     {
       "message": "Post deleted successfully."
     }
     ```

### Likes

1. **Like a Post**
   - **URL**: `POST /posts/:post_id/likes`
   - **Description**: Like a specific post (requires authentication).
   - **Request Header**:
     - `Authorization: Bearer <jwt_token>`
   - **Response**:
     ```json
     {
       "message": "Post liked successfully."
     }
     ```

2. **Unlike a Post**
   - **URL**: `DELETE /posts/:post_id/likes`
   - **Description**: Unlike a specific post (requires authentication).
   - **Request Header**:
     - `Authorization: Bearer <jwt_token>`
   - **Response**:
     ```json
     {
       "message": "Like removed successfully."
     }
     ```

## Additional

- **Rate Limiting:**
  The API allows a maximum of 5 authentication attempts per minute.
- **Pagination:**
  Default: 10 posts per page. Use the `page` query parameter to navigate.
- **Search:**
  Use the `query` parameter to search posts by title.

---


