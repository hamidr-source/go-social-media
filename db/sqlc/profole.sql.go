// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.18.0
// source: profole.sql

package db

import (
	"context"
)

const createProfile = `-- name: CreateProfile :one
INSERT INTO "profile" (
  user_id,  
  post_count,
  subscriber_count,
  subscription_count,
  bio
) VALUES (
  $1, $2, $3, $4, $5
) RETURNING user_id, post_count, subscriber_count, subscription_count, bio
`

type CreateProfileParams struct {
	UserID            int32  `json:"user_id"`
	PostCount         int32  `json:"post_count"`
	SubscriberCount   int32  `json:"subscriber_count"`
	SubscriptionCount int32  `json:"subscription_count"`
	Bio               string `json:"bio"`
}

func (q *Queries) CreateProfile(ctx context.Context, arg CreateProfileParams) (Profile, error) {
	row := q.db.QueryRowContext(ctx, createProfile,
		arg.UserID,
		arg.PostCount,
		arg.SubscriberCount,
		arg.SubscriptionCount,
		arg.Bio,
	)
	var i Profile
	err := row.Scan(
		&i.UserID,
		&i.PostCount,
		&i.SubscriberCount,
		&i.SubscriptionCount,
		&i.Bio,
	)
	return i, err
}

const getprofile = `-- name: Getprofile :one
SELECT user_id, post_count, subscriber_count, subscription_count, bio FROM "profile"
WHERE user_id = $1 LIMIT 1
`

func (q *Queries) Getprofile(ctx context.Context, userID int32) (Profile, error) {
	row := q.db.QueryRowContext(ctx, getprofile, userID)
	var i Profile
	err := row.Scan(
		&i.UserID,
		&i.PostCount,
		&i.SubscriberCount,
		&i.SubscriptionCount,
		&i.Bio,
	)
	return i, err
}

const listProfile = `-- name: ListProfile :many
SELECT user_id, post_count, subscriber_count, subscription_count, bio FROM "profile"
ORDER BY user_id
LIMIT $1
OFFSET $2
`

type ListProfileParams struct {
	Limit  int32 `json:"limit"`
	Offset int32 `json:"offset"`
}

func (q *Queries) ListProfile(ctx context.Context, arg ListProfileParams) ([]Profile, error) {
	rows, err := q.db.QueryContext(ctx, listProfile, arg.Limit, arg.Offset)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []Profile
	for rows.Next() {
		var i Profile
		if err := rows.Scan(
			&i.UserID,
			&i.PostCount,
			&i.SubscriberCount,
			&i.SubscriptionCount,
			&i.Bio,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}
