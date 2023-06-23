-- name: CreateProfile :one
INSERT INTO "profile" (
  user_id,  
  post_count,
  subscriber_count,
  subscription_count,
  bio
) VALUES (
  $1, $2, $3, $4, $5
) RETURNING *;

-- name: Getprofile :one
SELECT * FROM "profile"
WHERE user_id = $1 LIMIT 1;

-- name: ListProfile :many
SELECT * FROM "profile"
ORDER BY user_id
LIMIT $1
OFFSET $2;

