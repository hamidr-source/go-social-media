-- name: CreateUser :one
INSERT INTO "user" (
  email,
  hashed_password,
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

-- name: UpdateUser :exec
UPDATE "user"
SET hashed_password = $2
WHERE id = $1;

-- name: DeleteUser :exec
DELETE FROM "user"
WHERE id = $1;