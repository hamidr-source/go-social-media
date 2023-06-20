postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSGRES_PASSWORD=secret -d postgres

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root social_media

dropdb:
	docker exec -it postgres12 dropdb social_media

.PHONY: postgres createdb dropdb