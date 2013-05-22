CREATE TABLE "secret"(
	"id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"path" Text NOT NULL,
	"value" Text NOT NULL, "desc" Text,
CONSTRAINT "unique_id" UNIQUE ( "id" ),
CONSTRAINT "unique_path" UNIQUE ( "path" ) )

CREATE TABLE "user"(
	"id"       Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"username" Text NOT NULL,
	"email"    Text NOT NULL,
	"fullname" Text NOT NULL,
	"groups"   Text NOT NULL,
CONSTRAINT "unique_id" UNIQUE ( "id" ),
CONSTRAINT "unique_username" UNIQUE ( "username" ) )

CREATE TABLE "group"(
	"id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name" Text NOT NULL,
CONSTRAINT "unique_id" UNIQUE ( "id" ),
CONSTRAINT "unique_name" UNIQUE ( "name" ) )