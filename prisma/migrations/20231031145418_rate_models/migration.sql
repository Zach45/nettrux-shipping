/*
  Warnings:

  - Added the required column `zip` to the `ZipCode` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ZipCode" ADD COLUMN     "isDeleted" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "zip" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "City" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "stateId" TEXT NOT NULL,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "City_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "State" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "countryId" TEXT NOT NULL,
    "abbreviation" TEXT NOT NULL,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "State_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Country" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "iso2" TEXT NOT NULL,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Country_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RateItem" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "total" DOUBLE PRECISION NOT NULL,
    "rateId" TEXT NOT NULL,

    CONSTRAINT "RateItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RateType" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,

    CONSTRAINT "RateType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rate" (
    "id" TEXT NOT NULL,
    "rateNo" BIGSERIAL NOT NULL,
    "total" DOUBLE PRECISION NOT NULL,
    "daysInTransit" TIMESTAMPTZ(6) NOT NULL,
    "estimatedPickUpDate" TIMESTAMPTZ(6) NOT NULL,
    "remarks" TEXT[],
    "rateTypeId" TEXT NOT NULL,

    CONSTRAINT "Rate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FreightInfo" (
    "id" TEXT NOT NULL,
    "weight" DOUBLE PRECISION NOT NULL,
    "weightType" TEXT NOT NULL,
    "length" DOUBLE PRECISION NOT NULL,
    "width" DOUBLE PRECISION NOT NULL,
    "height" DOUBLE PRECISION NOT NULL,
    "class" INTEGER NOT NULL,
    "dimType" TEXT NOT NULL,
    "rateId" TEXT NOT NULL,

    CONSTRAINT "FreightInfo_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ZipCode" ADD CONSTRAINT "ZipCode_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "City"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "City" ADD CONSTRAINT "City_stateId_fkey" FOREIGN KEY ("stateId") REFERENCES "State"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "State" ADD CONSTRAINT "State_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RateItem" ADD CONSTRAINT "RateItem_rateId_fkey" FOREIGN KEY ("rateId") REFERENCES "Rate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rate" ADD CONSTRAINT "Rate_rateTypeId_fkey" FOREIGN KEY ("rateTypeId") REFERENCES "RateType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FreightInfo" ADD CONSTRAINT "FreightInfo_rateId_fkey" FOREIGN KEY ("rateId") REFERENCES "Rate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
