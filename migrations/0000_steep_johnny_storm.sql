CREATE TABLE IF NOT EXISTS "nextjs_003_auth_sessions" (
	"id" serial PRIMARY KEY NOT NULL,
	"userId" integer NOT NULL,
	"expires_at" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "nextjs_003_auth_users" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"email" text NOT NULL,
	"password" text NOT NULL,
	CONSTRAINT "nextjs_003_auth_users_email_unique" UNIQUE("email")
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "nextjs_003_auth_sessions" ADD CONSTRAINT "nextjs_003_auth_sessions_userId_nextjs_003_auth_users_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."nextjs_003_auth_users"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE UNIQUE INDEX IF NOT EXISTS "unique_idx" ON "nextjs_003_auth_users" USING btree ("email");