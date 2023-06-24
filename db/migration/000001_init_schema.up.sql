CREATE TABLE "subscription" (
  "subscriber" integer NOT NULL,
  "target" integer NOT NULL
);

CREATE TABLE "user" (
  "id" integer PRIMARY KEY NOT NULL,
  "email" varchar(255) NOT NULL,
  "hashed_password" integer NOT NULL,
  "is_admin" boolean DEFAULT False NOT NULL,
  "is_active" boolean DEFAULT True NOT NULL,
  "created_at" timestamptz DEFAULT (now()) NOT NULL
);

CREATE TABLE "profile" (
  "user_id" integer NOT NULL,
  "post_count" integer DEFAULT 0 NOT NULL,
  "subscriber_count" integer DEFAULT 0 NOT NULL,
  "subscription_count" integer DEFAULT 0 NOT NULL,
  "bio" varchar(1000) NOT NULL
);

CREATE TABLE "post" (
  "id" integer PRIMARY KEY NOT NULL, 
  "title" varchar(100) UNIQUE NOT NULL,
  "body" text NOT NULL,
  "author" integer NOT NULL,
  "created_at" timestamptz DEFAULT (now()) NOT NULL
);

COMMENT ON COLUMN "profile"."post_count" IS 'positive';

COMMENT ON COLUMN "profile"."subscriber_count" IS 'positive';

COMMENT ON COLUMN "profile"."subscription_count" IS 'positive';

COMMENT ON COLUMN "post"."body" IS 'Content of the post';

ALTER TABLE "post" ADD FOREIGN KEY ("author") REFERENCES "user" ("id");

ALTER TABLE "subscription" ADD FOREIGN KEY ("subscriber") REFERENCES "user" ("id");

ALTER TABLE "subscription" ADD FOREIGN KEY ("target") REFERENCES "user" ("id");

ALTER TABLE "profile" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");