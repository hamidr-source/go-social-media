// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.18.0

package db

import (
	"database/sql"
	"time"
)

type Post struct {
	Slug  string         `json:"slug"`
	Title sql.NullString `json:"title"`
	// Content of the post
	Body      string    `json:"body"`
	Author    int32     `json:"author"`
	CreatedAt time.Time `json:"created_at"`
}

type Profile struct {
	User int32 `json:"user"`
	// positive
	PostCount int32 `json:"post_count"`
	// positive
	SubscriberCount int32 `json:"subscriber_count"`
	// positive
	SubscriptionCount int32  `json:"subscription_count"`
	Bio               string `json:"bio"`
}

type Subscription struct {
	Subscriber int32 `json:"subscriber"`
	Target     int32 `json:"target"`
}

type User struct {
	ID        int32     `json:"id"`
	Email     string    `json:"email"`
	Password  int32     `json:"password"`
	IsAdmin   bool      `json:"is_admin"`
	IsActive  bool      `json:"is_active"`
	CreatedAt time.Time `json:"created_at"`
}
