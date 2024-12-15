-- CreateEnum
CREATE TYPE "Sytem" AS ENUM ('OLDRAGON', 'CUSTOM');

-- CreateEnum
CREATE TYPE "Race" AS ENUM ('HUMAN', 'DWARF', 'ELF', 'HALFLING');

-- CreateEnum
CREATE TYPE "Class" AS ENUM ('CLERIC', 'MANOFARM', 'WIZARD', 'ROGUE');

-- CreateEnum
CREATE TYPE "Alignment" AS ENUM ('ORDERLY', 'NEUTRAL', 'CHAOTIC');

-- CreateEnum
CREATE TYPE "MagicType" AS ENUM ('ARCANE', 'DIVINE');

-- CreateEnum
CREATE TYPE "Size" AS ENUM ('SM', 'MD', 'LG');

-- CreateTable
CREATE TABLE "user_table" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "tableId" TEXT NOT NULL,
    "isMaster" BOOLEAN NOT NULL,

    CONSTRAINT "user_table_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Table" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "system" "Sytem" NOT NULL DEFAULT 'OLDRAGON',
    "createdAt" TIMESTAMP(3) NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT,

    CONSTRAINT "Table_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Character" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "race" "Race" NOT NULL,
    "class" "Class" NOT NULL,
    "alignment" "Alignment" NOT NULL DEFAULT 'NEUTRAL',
    "physycalCharacteristcs" VARCHAR(1000) NOT NULL,
    "player" TEXT NOT NULL,
    "tableId" TEXT NOT NULL,
    "atributesId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Character_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Atributes" (
    "id" TEXT NOT NULL,
    "strengthId" TEXT NOT NULL,
    "dexterityId" TEXT NOT NULL,
    "constituitionId" TEXT NOT NULL,
    "intelligenceId" TEXT NOT NULL,
    "wisdomId" TEXT NOT NULL,
    "charismaId" TEXT NOT NULL,

    CONSTRAINT "Atributes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Strength" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "adjustment" INTEGER NOT NULL,

    CONSTRAINT "Strength_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Dexterity" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "adjustment" INTEGER NOT NULL,
    "rogueTalents" TEXT NOT NULL,

    CONSTRAINT "Dexterity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Constituition" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "adjustment" INTEGER NOT NULL,
    "resurection" INTEGER NOT NULL,

    CONSTRAINT "Constituition_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Intelligence" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "aditionalLanguage" INTEGER NOT NULL,
    "percentLearnMagic" INTEGER NOT NULL,
    "aditionalsArcaneMagics" TEXT NOT NULL,

    CONSTRAINT "Intelligence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Wisdom" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "adjustment" INTEGER NOT NULL,
    "aditionalsDivineMagics" TEXT NOT NULL,

    CONSTRAINT "Wisdom_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Charisma" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "maxFollowers" INTEGER NOT NULL,
    "adjustmentReactionPercent" INTEGER NOT NULL,
    "livingDeadAway" TEXT NOT NULL,

    CONSTRAINT "Charisma_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Inventory" (
    "id" TEXT NOT NULL,
    "characterId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Inventory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Equipment" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "weight" TEXT NOT NULL,
    "inventoryId" TEXT NOT NULL,

    CONSTRAINT "Equipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Magic" (
    "id" TEXT NOT NULL,
    "characterId" TEXT NOT NULL,
    "circle" INTEGER NOT NULL,
    "type" "MagicType" NOT NULL,
    "range" TEXT NOT NULL,
    "duration" TEXT NOT NULL,
    "description" VARCHAR(1000) NOT NULL,

    CONSTRAINT "Magic_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Gun" (
    "id" TEXT NOT NULL,
    "characterId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "initiative" INTEGER NOT NULL,
    "baTotal" INTEGER NOT NULL,
    "damage" TEXT NOT NULL,
    "range" TEXT NOT NULL,
    "size" "Size" NOT NULL DEFAULT 'MD',
    "price" INTEGER NOT NULL,
    "weight" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Gun_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Character_atributesId_key" ON "Character"("atributesId");

-- CreateIndex
CREATE UNIQUE INDEX "Atributes_strengthId_key" ON "Atributes"("strengthId");

-- CreateIndex
CREATE UNIQUE INDEX "Atributes_dexterityId_key" ON "Atributes"("dexterityId");

-- CreateIndex
CREATE UNIQUE INDEX "Atributes_constituitionId_key" ON "Atributes"("constituitionId");

-- CreateIndex
CREATE UNIQUE INDEX "Atributes_intelligenceId_key" ON "Atributes"("intelligenceId");

-- CreateIndex
CREATE UNIQUE INDEX "Atributes_wisdomId_key" ON "Atributes"("wisdomId");

-- CreateIndex
CREATE UNIQUE INDEX "Atributes_charismaId_key" ON "Atributes"("charismaId");

-- CreateIndex
CREATE UNIQUE INDEX "Inventory_characterId_key" ON "Inventory"("characterId");

-- AddForeignKey
ALTER TABLE "user_table" ADD CONSTRAINT "user_table_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_table" ADD CONSTRAINT "user_table_tableId_fkey" FOREIGN KEY ("tableId") REFERENCES "Table"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Table" ADD CONSTRAINT "Table_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_atributesId_fkey" FOREIGN KEY ("atributesId") REFERENCES "Atributes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_player_fkey" FOREIGN KEY ("player") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_tableId_fkey" FOREIGN KEY ("tableId") REFERENCES "Table"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Atributes" ADD CONSTRAINT "Atributes_strengthId_fkey" FOREIGN KEY ("strengthId") REFERENCES "Strength"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Atributes" ADD CONSTRAINT "Atributes_dexterityId_fkey" FOREIGN KEY ("dexterityId") REFERENCES "Dexterity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Atributes" ADD CONSTRAINT "Atributes_constituitionId_fkey" FOREIGN KEY ("constituitionId") REFERENCES "Constituition"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Atributes" ADD CONSTRAINT "Atributes_intelligenceId_fkey" FOREIGN KEY ("intelligenceId") REFERENCES "Intelligence"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Atributes" ADD CONSTRAINT "Atributes_wisdomId_fkey" FOREIGN KEY ("wisdomId") REFERENCES "Wisdom"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Atributes" ADD CONSTRAINT "Atributes_charismaId_fkey" FOREIGN KEY ("charismaId") REFERENCES "Charisma"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inventory" ADD CONSTRAINT "Inventory_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD CONSTRAINT "Equipment_inventoryId_fkey" FOREIGN KEY ("inventoryId") REFERENCES "Inventory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Magic" ADD CONSTRAINT "Magic_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Gun" ADD CONSTRAINT "Gun_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;
