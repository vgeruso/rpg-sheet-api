-- CreateEnum
CREATE TYPE "coin" AS ENUM ('copper', 'silver', 'gold');

-- CreateEnum
CREATE TYPE "weapon_type" AS ENUM ('melee', 'distance');

-- CreateEnum
CREATE TYPE "damage_type" AS ENUM ('impactful', 'piercing', 'cutting');

-- CreateEnum
CREATE TYPE "equipment_type" AS ENUM ('armor', 'weapon', 'shield', 'general', 'containers', 'mounting');

-- CreateEnum
CREATE TYPE "system" AS ENUM ('od', 'ded', 'fda', 'torm', 'custom');

-- CreateEnum
CREATE TYPE "race" AS ENUM ('human', 'dwarf', 'elf', 'halfelf', 'halflingHALFLING', 'gnome');

-- CreateEnum
CREATE TYPE "class" AS ENUM ('rogue', 'wizard', 'cleric', 'fighter');

-- CreateEnum
CREATE TYPE "subclass" AS ENUM ('barbarian', 'paladin', 'dwarfadventurer', 'archer', 'druid', 'academic', 'shaman', 'outlawed', 'ranger', 'bard', 'killer', 'halflingadventurer', 'illusionist', 'necromancer', 'witcher', 'elfadventurer');

-- CreateEnum
CREATE TYPE "alignment" AS ENUM ('orderly', 'neutral', 'chaotic');

-- CreateEnum
CREATE TYPE "magic_type" AS ENUM ('arcane', 'divine');

-- CreateEnum
CREATE TYPE "size" AS ENUM ('sm', 'md', 'lg');

-- CreateTable
CREATE TABLE "campaign" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "resume" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "system" "system" NOT NULL DEFAULT 'od',
    "master" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "campaign_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "character" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "race" "race" NOT NULL,
    "classId" "class" NOT NULL,
    "subclassId" "subclass" NOT NULL,
    "alignment" "alignment" NOT NULL DEFAULT 'neutral',
    "level" INTEGER NOT NULL,
    "experience" INTEGER NOT NULL,
    "life_points" INTEGER NOT NULL,
    "armor_class" INTEGER NOT NULL,
    "initiative" INTEGER NOT NULL,
    "base_attack_c" INTEGER NOT NULL,
    "base_attack_d" INTEGER NOT NULL,
    "saving_throw_c" INTEGER NOT NULL,
    "saving_throw_d" INTEGER NOT NULL,
    "saving_throw_s" INTEGER NOT NULL,
    "initial_moviment" INTEGER NOT NULL,
    "physical_characteristics" VARCHAR(1000) NOT NULL,
    "personality" VARCHAR(1000) NOT NULL,
    "others_characteristic_and_habilities" TEXT NOT NULL,
    "history" VARCHAR(1000) NOT NULL,
    "avatar" TEXT NOT NULL,
    "gold_pieces" INTEGER NOT NULL,
    "silver_pieces" INTEGER NOT NULL,
    "copper_pieces" INTEGER NOT NULL,
    "actual_charge" INTEGER NOT NULL,
    "maximum_charge" INTEGER NOT NULL,
    "player" TEXT NOT NULL,
    "campaign_id" TEXT,
    "is_active" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "character_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "strength" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "modifier" INTEGER NOT NULL,
    "character_id" TEXT NOT NULL,

    CONSTRAINT "strength_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dexterity" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "modifier" INTEGER NOT NULL,
    "rogue_talents" TEXT NOT NULL,
    "character_id" TEXT NOT NULL,

    CONSTRAINT "dexterity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "constituition" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "modifier" INTEGER NOT NULL,
    "resurection" INTEGER NOT NULL,
    "character_id" TEXT NOT NULL,

    CONSTRAINT "constituition_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "intelligence" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "modifier" INTEGER NOT NULL,
    "additional_language" INTEGER NOT NULL,
    "percent_learn_magic" INTEGER NOT NULL,
    "additional_arcane_magics" TEXT NOT NULL,
    "character_id" TEXT NOT NULL,

    CONSTRAINT "intelligence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "winsdom" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "modifier" INTEGER NOT NULL,
    "additional_divine_magics" TEXT NOT NULL,
    "character_id" TEXT NOT NULL,

    CONSTRAINT "winsdom_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "charisma" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "modifier" INTEGER NOT NULL,
    "max_followers" INTEGER NOT NULL,
    "adjustment_reaction_percent" INTEGER NOT NULL,
    "living_dead_away" TEXT NOT NULL,
    "character_id" TEXT NOT NULL,

    CONSTRAINT "charisma_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attack" (
    "id" TEXT NOT NULL,
    "character_id" TEXT NOT NULL,
    "equipment_id" TEXT NOT NULL,

    CONSTRAINT "attack_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "grimoire" (
    "id" TEXT NOT NULL,
    "use" INTEGER NOT NULL,
    "character_id" TEXT NOT NULL,
    "magic_id" TEXT NOT NULL,

    CONSTRAINT "grimoire_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "inventory" (
    "id" TEXT NOT NULL,
    "character_id" TEXT NOT NULL,
    "equipment_id" TEXT NOT NULL,

    CONSTRAINT "inventory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "equipment" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "charge" INTEGER NOT NULL,
    "price" INTEGER NOT NULL,
    "coin" "coin" NOT NULL,
    "type" "equipment_type" NOT NULL,
    "system" "system" NOT NULL,
    "is_magic" BOOLEAN NOT NULL DEFAULT false,
    "size" "size" NOT NULL,
    "equipped" BOOLEAN NOT NULL,
    "weapon_type" "weapon_type",
    "damage_type" "damage_type",
    "damage" TEXT,
    "damage_bonus" INTEGER,
    "armor_bonus" INTEGER,
    "attack_bonus_c" INTEGER,
    "attack_bonus_d" INTEGER,
    "range" INTEGER,
    "increases_load" INTEGER,
    "description" VARCHAR(1000) NOT NULL,

    CONSTRAINT "equipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "magic" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" "magic_type" NOT NULL,
    "circle" INTEGER NOT NULL,
    "range" TEXT NOT NULL,
    "duration" TEXT NOT NULL,
    "system" "system" NOT NULL,
    "protective_play" TEXT,
    "description" VARCHAR(1000) NOT NULL,

    CONSTRAINT "magic_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "strength_character_id_key" ON "strength"("character_id");

-- CreateIndex
CREATE UNIQUE INDEX "dexterity_character_id_key" ON "dexterity"("character_id");

-- CreateIndex
CREATE UNIQUE INDEX "constituition_character_id_key" ON "constituition"("character_id");

-- CreateIndex
CREATE UNIQUE INDEX "intelligence_character_id_key" ON "intelligence"("character_id");

-- CreateIndex
CREATE UNIQUE INDEX "winsdom_character_id_key" ON "winsdom"("character_id");

-- CreateIndex
CREATE UNIQUE INDEX "charisma_character_id_key" ON "charisma"("character_id");

-- CreateIndex
CREATE UNIQUE INDEX "inventory_character_id_key" ON "inventory"("character_id");

-- AddForeignKey
ALTER TABLE "character" ADD CONSTRAINT "character_campaign_id_fkey" FOREIGN KEY ("campaign_id") REFERENCES "campaign"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "strength" ADD CONSTRAINT "strength_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dexterity" ADD CONSTRAINT "dexterity_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "constituition" ADD CONSTRAINT "constituition_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "intelligence" ADD CONSTRAINT "intelligence_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "winsdom" ADD CONSTRAINT "winsdom_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "charisma" ADD CONSTRAINT "charisma_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attack" ADD CONSTRAINT "attack_equipment_id_fkey" FOREIGN KEY ("equipment_id") REFERENCES "equipment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attack" ADD CONSTRAINT "attack_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "grimoire" ADD CONSTRAINT "grimoire_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "grimoire" ADD CONSTRAINT "grimoire_magic_id_fkey" FOREIGN KEY ("magic_id") REFERENCES "magic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_character_id_fkey" FOREIGN KEY ("character_id") REFERENCES "character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_equipment_id_fkey" FOREIGN KEY ("equipment_id") REFERENCES "equipment"("id") ON DELETE CASCADE ON UPDATE CASCADE;
