postgres:
	docker run --name postgres11 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it postgres11 createdb --username=root --owner=root go_socialmedia

dropdb:
	docker exec -it postgres11 dropdb go_socialmedia

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/go_socialmedia?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/go_socialmedia?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migrateup migratedown