CREATE TABLE "subscribe" (
  "subscriber_user_id" integer,
  "subscribed_user_id" integer,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "email" varchar,
  "password" integer,
  "created_at" timestamp DEFAULT (now()),
  "object" baseUserManager,
  "is_active" bool DEFAULT True,
  "is_admin" bool DEFAULT False
);

CREATE TABLE "posts" (
  "id" integer PRIMARY KEY,
  "title" varchar,
  "body" text,
  "user_id" integer,
  "status" varchar,
  "created_at" timestamp DEFAULT (now())
);

COMMENT ON COLUMN "posts"."body" IS 'Content of the post';

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "subscribe" ADD FOREIGN KEY ("subscriber_user_id") REFERENCES "users" ("id");

ALTER TABLE "subscribe" ADD FOREIGN KEY ("subscribed_user_id") REFERENCES "users" ("id");