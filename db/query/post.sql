-- name: CreatePost :one
INSERT INTO "post" (
  title,
  body,
  author
) VALUES (
  $1, $2, $3
) RETURNING *;

-- name: GetPost :one
SELECT * FROM "post"
WHERE id = $1 LIMIT 1;

-- name: ListPost :many
SELECT * FROM "post"
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: UpdatePost :exec
UPDATE "post"
SET body = $2
WHERE id = $1;

-- name: DeletePost :exec
DELETE FROM "post"
WHERE id = $1;


