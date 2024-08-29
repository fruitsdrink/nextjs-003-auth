import "@/drizzle/envConfig";
import { defineConfig } from "drizzle-kit";

console.log("url: ", process.env.POSTGRES_URL);

export default defineConfig({
  schema: "./src/drizzle/schema.ts",
  out: "./migrations",
  dialect: "postgresql",
  // driver: "pg",
  dbCredentials: {
    url: process.env.POSTGRES_URL!,
  },
});
