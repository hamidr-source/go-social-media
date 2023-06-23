-- name: CreateUser :one
INSERT INTO "user" (
  email,
  password,
  is_admin,
  is_active
) VALUES (
  $1, $2, $3, $4
) RETURNING *;

-- name: GetUser :one
SELECT * FROM "user"
WHERE id = $1 LIMIT 1;

-- name: ListUser :many
SELECT * FROM "user"
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: UpdateAuthor :exec
UPDATE "user"
SET password = $2
WHERE id = $1;