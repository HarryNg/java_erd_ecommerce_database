## User API

### Create a User

- **Method:** POST
- **Endpoint:** `/users`
- **Description:** Creates a new user account.

**Request Body:**

```
{
  "first_name": "John",
  "last_name": "Doe",
  "address": "123 Main St, Springfield, USA",
  "birth_date": "1990-01-01",
  "email": "john.doe@example.com",
  "phone": "+1234567890",
  "password": "securePassword123"
}
```

---

### User Login

- **Method:** POST
- **Endpoint:** `/users/login`
- **Description:** Authenticates a user and returns a session token.

**Request Body:**

```
{
  "email": "john.doe@example.com",
  "password": "securePassword123"
}
```

---

### Get All Users

- **Method:** GET
- **Endpoint:** `/users`
- **Description:** Retrieves a list of all users.

---

### Get User by ID

- **Method:** GET
- **Endpoint:** `/users/:id`
- **Description:** Retrieves details of a user by ID.

---

### Update User

- **Method:** PUT
- **Endpoint:** `/users/:id`
- **Description:** Updates the details of an existing user.

**Request Body:**

```
{
  "first_name": "Jane",
  "last_name": "Doe",
  "address": "456 Elm St, Springfield, USA",
  "birth_date": "1985-05-15",
  "email": "jane.doe@example.com",
  "phone": "+1987654321",
  "password": "newSecurePassword456"
}
```

---

### Delete User

- **Method:** DELETE
- **Endpoint:** `/users/:id`
- **Description:** Deletes a user account.

---

### User Logout

- **Method:** DELETE
- **Endpoint:** `/users/logout`
- **Description:** Logs out the current user session.

---

## Product API

### Create a Product

- **Method:** POST
- **Endpoint:** `/products`
- **Description:** Creates a new product.

**Request Body:**

```
{
  "name": "Wireless Headphones",
  "price": 199.99,
  "description": "High-quality wireless headphones with noise cancellation.",
  "images": ["image1.jpg", "image2.jpg"],
  "color": "Black",
  "meta": "Electronics, Audio",
  "rating": 4.5,
  "quantity": 100
}
```

---

### Get All Products

- **Method:** GET
- **Endpoint:** `/products`
- **Description:** Retrieves a list of all products.

---

### Get Product by ID

- **Method:** GET
- **Endpoint:** `/products/:id`
- **Description:** Retrieves details of a product by ID.

---

### Update Product

- **Method:** PUT
- **Endpoint:** `/products/:id`
- **Description:** Updates the details of an existing product.

**Request Body:**

```
{
  "name": "Bluetooth Speaker",
  "price": 49.99,
  "description": "Portable Bluetooth speaker with excellent sound quality.",
  "images": ["speaker1.jpg", "speaker2.jpg"],
  "color": "Blue",
  "meta": "Electronics, Audio",
  "rating": 4.7,
  "quantity": 50
}
```

---

### Delete Product

- **Method:** DELETE
- **Endpoint:** `/products/:id`
- **Description:** Deletes a product.

---

### Patch Product Quantity

- **Method:** PATCH
- **Endpoint:** `/products/:id`
- **Description:** Updates the quantity of an existing product.

**Request Body:**

```
{
  "quantity": 120
}
```

---

## Order API

### Create an Order

- **Method:** POST
- **Endpoint:** `/orders`
- **Description:** Creates a new order.

**Request Body:**

```
{
  "user_id": "1",
  "date_time": "2024-08-01T14:30:00Z",
  "comments": "Please deliver between 9 AM and 5 PM.",
  "status": 1,
  "address": "789 Maple Ave, Springfield, USA"
}
```

---

### Get All Orders

- **Method:** GET
- **Endpoint:** `/orders`
- **Description:** Retrieves a list of all orders.

---

### Get Order by ID

- **Method:** GET
- **Endpoint:** `/orders/:id`
- **Description:** Retrieves details of an order by ID.

---

### Update Order

- **Method:** PUT
- **Endpoint:** `/orders/:id`
- **Description:** Updates the details of an existing order.

**Request Body:**

```
{
  "user_id": "1",
  "date_time": "2024-08-02T10:00:00Z",
  "comments": "Leave package at the front door.",
  "status": 2,
  "address": "101 Pine St, Springfield, USA"
}
```

---

### Delete Order

- **Method:** DELETE
- **Endpoint:** `/orders/:id`
- **Description:** Deletes an order.

---

## Wishlist API

### Create a Wishlist

- **Method:** POST
- **Endpoint:** `/wishlists`
- **Description:** Creates a new wishlist for a user.

**Request Body:**

```
{
  "user_id": "1",
  "name": "Holiday Gifts"
}
```

---

### Get All Wishlists

- **Method:** GET
- **Endpoint:** `/wishlists`
- **Description:** Retrieves a list of all wishlists.

---

### Get Wishlist by ID

- **Method:** GET
- **Endpoint:** `/wishlists/:id`
- **Description:** Retrieves details of a wishlist by ID.

---

### Update Wishlist Name

- **Method:** PATCH
- **Endpoint:** `/wishlists/:id`
- **Description:** Updates the name of an existing wishlist.

**Request Body:**

```
{
  "name": "Birthday Gifts"
}
```

---

### Delete Wishlist

- **Method:** DELETE
- **Endpoint:** `/wishlists/:id`
- **Description:** Deletes a wishlist.

---

## Cart API

### Create a Cart

- **Method:** POST
- **Endpoint:** `/carts`
- **Description:** Creates a new cart for a user.

**Request Body:**

```
{
  "user_id": "1",
  "products": [
    {"product_id": "101", "quantity": 2},
    {"product_id": "102", "quantity": 1}
  ]
}
```

---

### Get Cart by User ID

- **Method:** GET
- **Endpoint:** `/carts/:userId`
- **Description:** Retrieves the cart for a specific user.

---

### Delete Cart

- **Method:** DELETE
- **Endpoint:** `/carts/:userId`
- **Description:** Deletes the cart for a specific user.

---

## Payment API

### Create a Payment

- **Method:** POST
- **Endpoint:** `/payments`
- **Description:** Creates a new payment for an order.

**Request Body:**

```
{
  "order_id": "5001",
  "method": 1,  // 0 for Cash, 1 for Credit Card, etc.
  "amount": 249.99
}
```

---

### Get Payments by User ID

- **Method:** GET
- **Endpoint:** `/payments/:userId`
- **Description:** Retrieves a list of all payments made by a specific user.

---

### Get Payment by ID

- **Method:** GET
- **Endpoint:** `/payments/:id`
- **Description:** Retrieves details of a payment by ID.

---

## Review API

### Create a Review

- **Method:** POST
- **Endpoint:** `/reviews`
- **Description:** Creates a new review for a product.

**Request Body:**

```
{
  "product_id": "101",
  "review": "Great sound quality and battery life.",
  "rating": 5,
  "images": ["review1.jpg", "review2.jpg"]
}
```

---

### Update Review

- **Method:** PUT
- **Endpoint:** `/reviews/:id`
- **Description:** Updates the details of an existing review.

**Request Body:**

```
{
  "review": "Excellent sound and comfortable to wear.",
  "rating": 5,
  "images": ["updated_review1.jpg"]
}
```

---

### Get Reviews by User ID

- **Method:** GET
- **Endpoint:** `/reviews/:userId`
- **Description:** Retrieves all reviews made by a specific user.

---

### Get Reviews by Product ID

- **Method:** GET
- **Endpoint:** `/reviews/:productId`
- **Description:** Retrieves all reviews for a specific product.

---

### Delete Review

- **Method:** DELETE
- **Endpoint:** `/reviews/:id`
- **Description:** Deletes a review.
