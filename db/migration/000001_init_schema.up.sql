CREATE TABLE "subscription" (
  "subscriber" integer NOT NULL,
  "target" integer NOT NULL
);

CREATE TABLE "user" (
  "id" integer PRIMARY KEY,
  "email" varchar(255) NOT NULL,
  "is_admin" boolean NOT NULL DEFAULT False,
  "is_active" boolean NOT NULL DEFAULT True,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "profile" (
  "user" integer,
  "post_count" integer NOT NULL DEFAULT 0,
  "subscriber_count" NOT NULL integer DEFAULT 0,
  "subscription_count" NOT NULL integer DEFAULT 0,
  "bio" varchar(1000)
);

CREATE TABLE "post" (
  "slug" varchar(100) PRIMARY KEY,
  "title" varchar(100) UNIQUE,
  "body" text NOT NULL,
  "author" integer NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

COMMENT ON COLUMN "profile"."post_count" IS 'positive';

COMMENT ON COLUMN "profile"."subscriber_count" IS 'positive';

COMMENT ON COLUMN "profile"."subscription_count" IS 'positive';

COMMENT ON COLUMN "post"."body" IS 'Content of the post';

ALTER TABLE "post" ADD FOREIGN KEY ("author") REFERENCES "user" ("id");

ALTER TABLE "subscription" ADD FOREIGN KEY ("subscriber") REFERENCES "user" ("id");

ALTER TABLE "subscription" ADD FOREIGN KEY ("target") REFERENCES "user" ("id");

ALTER TABLE "profile" ADD FOREIGN KEY ("user") REFERENCES "user" ("id");