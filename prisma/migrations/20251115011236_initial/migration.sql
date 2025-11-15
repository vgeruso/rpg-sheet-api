-- CreateEnum
CREATE TYPE "Coin" AS ENUM ('COPPER', 'SILVER', 'GOLD');

-- CreateEnum
CREATE TYPE "WeaponType" AS ENUM ('MELEE', 'DISTANCE');

-- CreateEnum
CREATE TYPE "DamageType" AS ENUM ('IMPACTFUL', 'PIERCING', 'CUTTING');

-- CreateEnum
CREATE TYPE "EquipmentType" AS ENUM ('ARMOR', 'WEAPON', 'SHIELD', 'GENERAL', 'CONTAINERS', 'MOUNTING');

-- CreateEnum
CREATE TYPE "Sytem" AS ENUM ('OLDRAGON', 'CUSTOM');

-- CreateEnum
CREATE TYPE "Race" AS ENUM ('HUMAN', 'DWARF', 'ELF', 'HALFELF', 'HALFLING', 'GNOME');

-- CreateEnum
CREATE TYPE "Class" AS ENUM ('ROGUE', 'WIZARD', 'CLERIC', 'FIGHTER');

-- CreateEnum
CREATE TYPE "SUBCLASS" AS ENUM ('BARBARIAN', 'PALADIN', 'DWARFADVENTURER', 'ARCHER', 'DRUID', 'ACADEMIC', 'SHAMAN', 'OUTLAWED', 'RANGER', 'BARD', 'KILLER', 'HALFLINGADVENTURER', 'ILLUSIONIST', 'NECROMANTE', 'WITCHER', 'ELFADVENTURER');

-- CreateEnum
CREATE TYPE "Alignment" AS ENUM ('ORDERLY', 'NEUTRAL', 'CHAOTIC');

-- CreateEnum
CREATE TYPE "MagicType" AS ENUM ('ARCANE', 'DIVINE');

-- CreateEnum
CREATE TYPE "Size" AS ENUM ('SM', 'MD', 'LG');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserCampaign" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "tableId" TEXT NOT NULL,
    "isMaster" BOOLEAN NOT NULL,

    CONSTRAINT "UserCampaign_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Campaign" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "system" "Sytem" NOT NULL DEFAULT 'OLDRAGON',
    "createdAt" TIMESTAMP(3) NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Campaign_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Character" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "race" "Race" NOT NULL,
    "class" "Class" NOT NULL,
    "subclass" "SUBCLASS" NOT NULL,
    "alignment" "Alignment" NOT NULL DEFAULT 'NEUTRAL',
    "level" INTEGER NOT NULL,
    "experience" INTEGER NOT NULL,
    "lifePoints" INTEGER NOT NULL,
    "armorClass" INTEGER NOT NULL,
    "initiative" INTEGER NOT NULL,
    "baseAttackC" INTEGER NOT NULL,
    "baseAttackD" INTEGER NOT NULL,
    "savingThrowC" INTEGER NOT NULL,
    "savingThrowD" INTEGER NOT NULL,
    "savingThrowS" INTEGER NOT NULL,
    "initialMoviment" INTEGER NOT NULL,
    "physycalCharacteristcs" VARCHAR(1000) NOT NULL,
    "personality" VARCHAR(1000) NOT NULL,
    "history" VARCHAR(1000) NOT NULL,
    "goldPieces" INTEGER NOT NULL,
    "silverPieces" INTEGER NOT NULL,
    "copperPieces" INTEGER NOT NULL,
    "actualCharge" INTEGER NOT NULL,
    "maximumCharge" INTEGER NOT NULL,
    "player" TEXT NOT NULL,
    "campaignId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Character_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Strength" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "adjustment" INTEGER NOT NULL,
    "characterId" TEXT NOT NULL,

    CONSTRAINT "Strength_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Dexterity" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "adjustment" INTEGER NOT NULL,
    "rogueTalents" TEXT NOT NULL,
    "characterId" TEXT NOT NULL,

    CONSTRAINT "Dexterity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Constituition" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "adjustment" INTEGER NOT NULL,
    "resurection" INTEGER NOT NULL,
    "characterId" TEXT NOT NULL,

    CONSTRAINT "Constituition_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Intelligence" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "aditionalLanguage" INTEGER NOT NULL,
    "percentLearnMagic" INTEGER NOT NULL,
    "aditionalsArcaneMagics" TEXT NOT NULL,
    "characterId" TEXT NOT NULL,

    CONSTRAINT "Intelligence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Wisdom" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "adjustment" INTEGER NOT NULL,
    "aditionalsDivineMagics" TEXT NOT NULL,
    "characterId" TEXT NOT NULL,

    CONSTRAINT "Wisdom_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Charisma" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "maxFollowers" INTEGER NOT NULL,
    "adjustmentReactionPercent" INTEGER NOT NULL,
    "livingDeadAway" TEXT NOT NULL,
    "characterId" TEXT NOT NULL,

    CONSTRAINT "Charisma_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Attack" (
    "id" TEXT NOT NULL,
    "characterId" TEXT NOT NULL,
    "EquipmentId" TEXT NOT NULL,

    CONSTRAINT "Attack_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Grimoire" (
    "id" TEXT NOT NULL,
    "use" INTEGER NOT NULL,
    "characterId" TEXT NOT NULL,
    "magicId" TEXT NOT NULL,

    CONSTRAINT "Grimoire_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Inventory" (
    "id" TEXT NOT NULL,
    "characterId" TEXT NOT NULL,
    "equipmentId" TEXT NOT NULL,

    CONSTRAINT "Inventory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Equipment" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "charge" INTEGER NOT NULL,
    "price" INTEGER NOT NULL,
    "coin" "Coin" NOT NULL,
    "type" "EquipmentType" NOT NULL,
    "isMagic" BOOLEAN NOT NULL,
    "size" "Size" NOT NULL,
    "equipped" BOOLEAN NOT NULL,
    "weaponType" "WeaponType",
    "damageType" "DamageType",
    "damage" TEXT,
    "damageBonus" INTEGER,
    "armorBonus" INTEGER,
    "attackBonusC" INTEGER,
    "attackBonusD" INTEGER,
    "range" INTEGER,
    "increasesLoad" INTEGER,
    "description" VARCHAR(1000) NOT NULL,

    CONSTRAINT "Equipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Magic" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" "MagicType" NOT NULL,
    "circle" INTEGER NOT NULL,
    "range" TEXT NOT NULL,
    "duration" TEXT NOT NULL,
    "protectivePlay" TEXT,
    "description" VARCHAR(1000) NOT NULL,

    CONSTRAINT "Magic_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Strength_characterId_key" ON "Strength"("characterId");

-- CreateIndex
CREATE UNIQUE INDEX "Dexterity_characterId_key" ON "Dexterity"("characterId");

-- CreateIndex
CREATE UNIQUE INDEX "Constituition_characterId_key" ON "Constituition"("characterId");

-- CreateIndex
CREATE UNIQUE INDEX "Intelligence_characterId_key" ON "Intelligence"("characterId");

-- CreateIndex
CREATE UNIQUE INDEX "Wisdom_characterId_key" ON "Wisdom"("characterId");

-- CreateIndex
CREATE UNIQUE INDEX "Charisma_characterId_key" ON "Charisma"("characterId");

-- CreateIndex
CREATE UNIQUE INDEX "Inventory_characterId_key" ON "Inventory"("characterId");

-- AddForeignKey
ALTER TABLE "UserCampaign" ADD CONSTRAINT "UserCampaign_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserCampaign" ADD CONSTRAINT "UserCampaign_tableId_fkey" FOREIGN KEY ("tableId") REFERENCES "Campaign"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Campaign" ADD CONSTRAINT "Campaign_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_campaignId_fkey" FOREIGN KEY ("campaignId") REFERENCES "Campaign"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_player_fkey" FOREIGN KEY ("player") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Strength" ADD CONSTRAINT "Strength_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dexterity" ADD CONSTRAINT "Dexterity_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Constituition" ADD CONSTRAINT "Constituition_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Intelligence" ADD CONSTRAINT "Intelligence_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Wisdom" ADD CONSTRAINT "Wisdom_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Charisma" ADD CONSTRAINT "Charisma_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attack" ADD CONSTRAINT "Attack_EquipmentId_fkey" FOREIGN KEY ("EquipmentId") REFERENCES "Equipment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attack" ADD CONSTRAINT "Attack_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Grimoire" ADD CONSTRAINT "Grimoire_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Grimoire" ADD CONSTRAINT "Grimoire_magicId_fkey" FOREIGN KEY ("magicId") REFERENCES "Magic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inventory" ADD CONSTRAINT "Inventory_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inventory" ADD CONSTRAINT "Inventory_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES "Equipment"("id") ON DELETE CASCADE ON UPDATE CASCADE;
