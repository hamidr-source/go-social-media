// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.18.0
// source: subscription.sql

package db

import (
	"context"
)

const createSubscription = `-- name: CreateSubscription :one
INSERT INTO "subscription" (
  subscriber,
  target
) VALUES (
  $1, $2
) RETURNING subscriber, target
`

type CreateSubscriptionParams struct {
	Subscriber int32 `json:"subscriber"`
	Target     int32 `json:"target"`
}

func (q *Queries) CreateSubscription(ctx context.Context, arg CreateSubscriptionParams) (Subscription, error) {
	row := q.db.QueryRowContext(ctx, createSubscription, arg.Subscriber, arg.Target)
	var i Subscription
	err := row.Scan(&i.Subscriber, &i.Target)
	return i, err
}

const deletesubScription = `-- name: DeletesubScription :exec
DELETE FROM "subscription"
WHERE subscriber = $1
`

func (q *Queries) DeletesubScription(ctx context.Context, subscriber int32) error {
	_, err := q.db.ExecContext(ctx, deletesubScription, subscriber)
	return err
}
