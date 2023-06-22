-- name: CreateUser :one
INSERT INTO user {
    email,
    password,
    is_active,
    is_admin
} VALUES {
    $1, $2, $3, $4
} RETURNING *;