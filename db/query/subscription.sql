-- name: CreateSubscription :one
INSERT INTO "subscription" (
  subscriber,
  target
) VALUES (
  $1, $2
) RETURNING *;

-- name: DeletesubScription :exec
DELETE FROM "subscription"
WHERE subscriber = $1;