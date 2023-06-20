CREATE TABLE "subscription" (
  "subscriber" integer,
  "target" integer
);

CREATE TABLE "user" (
  "id" integer UNIQUE PRIMARY KEY,
  "email" varchar(255) NOT NULL,
  "password" integer NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "is_active" bool DEFAULT True,
  "is_admin" bool DEFAULT False
);

CREATE TABLE "post" (
  "slug" slugFeild(100) PRIMARY KEY NOT NULL,
  "title" varchar(100) UNIQUE,
  "content" text(1000) NOT NULL,
  "author" integer,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "profile" (
  "user" varchar,
  "post_count" positiveIntrger DEFAULT 0,
  "subscriber_count" positiveIntrger DEFAULT 0,
  "subscription_count" positiveIntrger DEFAULT 0,
  "bio" varchar(1000)
);

COMMENT ON COLUMN "post"."content" IS 'Content of the post';

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
  "subscription_target" integer,
  PRIMARY KEY ("user_id", "subscription_target")
);

ALTER TABLE "user_subscription(1)" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user_subscription(1)" ADD FOREIGN KEY ("subscription_target") REFERENCES "subscription" ("target");
