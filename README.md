# Key-Value As A Service API

## Introduction

The Key-Value As A Service API provides endpoints for managing key-value pairs, suitable for IoT projects and other applications requiring simple storage.

## Requirements

- Ruby on Rails
- PostgreSQL (or other database of choice)

## Installation

1. Clone the repository.
2. Install dependencies:
   ```bash
   bundle install

   ```
3. Set up environment variables for PostgreSQL user, password, host, and port. Example:
   ```bash
   export POSTGRES_USER=your_username
   export POSTGRES_PASSWORD=your_password
   export POSTGRES_HOST=localhost
   export POSTGRES_PORT=5432
   ```
4. Create the PostgreSQL database:
   ```bash
   rails db:create
   ```
5. Run migrations:
   ```bash
   rails db:migrate
   ```
6. Start the server:
   ```bash
   rails server
   ```

## API Endpoints

### 1. GET /keys/{key}

Retrieves the value associated with the specified key.

#### Example:

```bash
GET http://localhost:3000/keys/temp_dev0
```

Response:

```json
{
  "key": "temp_dev0",
  "value": "87"
}
```

### 2. POST /keys or PUT /keys

Adds a new key-value pair to the store.

#### Example:

```bash
POST http://localhost:3000/keys

Body:
{
  "key": "humidity_dev1",
  "value": "60"
}
```

Response (Status code 201 - Created):

```json
{
  "key": "humidity_dev1",
  "value": "60"
}
```

### 3. PATCH /keys/{key}/{value}

Updates the value of the specified key.

#### Example:

```bash
PATCH http://localhost:3000/keys/temp_dev0/90
```

Response:

```json
{
  "key": "temp_dev0",
  "value": "90"
}
```

### 4. DELETE /keys/{key}

Deletes the key-value pair associated with the specified key.

#### Example:

```bash
DELETE http://localhost:3000/keys/humidity_dev1
```

Response (Status code 204 - No Content):

No content returned.
