-- name: CreateUser :one
INSERT INTO "user" (
  email,
  password,
  is_admin,
  is_active
) VALUES (
  $1, $2, $3, $4
) RETURNING *;