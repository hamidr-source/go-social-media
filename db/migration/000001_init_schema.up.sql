CREATE TABLE "subscription" (
  "subscriber" integer,
  "target" integer
);

CREATE TABLE "user" (
  "id" integer PRIMARY KEY,
  "email" varchar(255),
  "password" integer,
  "is_admin" boolean DEFAULT False,
  "is_active" boolean DEFAULT True,
  "created_at" timestamptz DEFAULT (now())
);

CREATE TABLE "profile" (
  "user" integer,
  "post_count" integer DEFAULT 0,
  "subscriber_count" integer DEFAULT 0,
  "subscription_count" integer DEFAULT 0,
  "bio" varchar(1000)
);

CREATE TABLE "post" (
  "slug" varchar(100) PRIMARY KEY,
  "title" varchar(100) UNIQUE,
  "body" text,
  "author" integer,
  "created_at" timestamptz DEFAULT (now())
);

COMMENT ON COLUMN "profile"."post_count" IS 'positive';

COMMENT ON COLUMN "profile"."subscriber_count" IS 'positive';

COMMENT ON COLUMN "profile"."subscription_count" IS 'positive';

COMMENT ON COLUMN "post"."body" IS 'Content of the post';

ALTER TABLE "post" ADD FOREIGN KEY ("author") REFERENCES "user" ("id");

ALTER TABLE "subscription" ADD FOREIGN KEY ("subscriber") REFERENCES "user" ("id");

ALTER TABLE "subscription" ADD FOREIGN KEY ("target") REFERENCES "user" ("id");

ALTER TABLE "profile" ADD FOREIGN KEY ("user") REFERENCES "user" ("id");