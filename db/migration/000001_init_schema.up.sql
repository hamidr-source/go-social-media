CREATE TABLE "subscription" (
  "subscriber" integer NOT NULL,
  "traget" integer NOT NULL
);

CREATE TABLE "user" (
  "id" integer UNIQUE PRIMARY KEY,
  "email" varchar(255) NOT NULL,
  "password" integer NOT NULL,
  "created_at" timestampz NOT NULL DEFAULT (now()),
  "is_active" bool NOT NULL DEFAULT True,
  "is_admin" bool NOT NULL DEFAULT False
);

CREATE TABLE "post" (
  "slug" slugFeild(100) PRIMARY KEY NOT NULL,
  "title" varchar(100) UNIQUE,
  "content" text(1000) NOT NULL,
  "author" integer NOT NULL,
  "created_at" timestampz NOT NULL DEFAULT (now())
);

CREATE TABLE "profile" (
  "user" varchar NOT NULL,
  "post_count" integer NOT NULL DEFAULT 0,
  "subscriber_count" integer NOT NULL DEFAULT 0,
  "subscription_count" integer NOT NULL DEFAULT 0,
  "bio" varchar(1000)
);

COMMENT ON COLUMN "post"."content" IS 'Content of the post';

COMMENT ON COLUMN "profile"."post_count" IS 'positive';

COMMENT ON COLUMN "profile"."subscriber_count" IS 'positive';

COMMENT ON COLUMN "profile"."subscription_count" IS 'positive';

ALTER TABLE "post" ADD FOREIGN KEY ("author") REFERENCES "user" ("id") ON DELETE SET NULL;

ALTER TABLE "profile" ADD FOREIGN KEY ("user") REFERENCES "user" ("id");

CREATE TABLE "user_subscription" (
  "user_id" integer,
  "subscription_subscriber" integer,
  PRIMARY KEY ("user_id", "subscription_subscriber")
);

ALTER TABLE "user_subscription" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user_subscription" ADD FOREIGN KEY ("subscription_subscriber") REFERENCES "subscription" ("subscriber");


CREATE TABLE "user_subscription(1)" (
  "user_id" integer,
  "subscription_traget" integer,
  PRIMARY KEY ("user_id", "subscription_traget")
);

ALTER TABLE "user_subscription(1)" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user_subscription(1)" ADD FOREIGN KEY ("subscription_traget") REFERENCES "subscription" ("traget");