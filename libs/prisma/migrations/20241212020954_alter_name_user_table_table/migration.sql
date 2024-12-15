/*
  Warnings:

  - You are about to drop the `user_table` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "user_table" DROP CONSTRAINT "user_table_tableId_fkey";

-- DropForeignKey
ALTER TABLE "user_table" DROP CONSTRAINT "user_table_userId_fkey";

-- DropTable
DROP TABLE "user_table";

-- CreateTable
CREATE TABLE "UserTable" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "tableId" TEXT NOT NULL,
    "isMaster" BOOLEAN NOT NULL,

    CONSTRAINT "UserTable_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "UserTable" ADD CONSTRAINT "UserTable_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserTable" ADD CONSTRAINT "UserTable_tableId_fkey" FOREIGN KEY ("tableId") REFERENCES "Table"("id") ON DELETE CASCADE ON UPDATE CASCADE;
