-- CreateTable
CREATE TABLE "Route" (
    "id" TEXT NOT NULL,
    "originZipId" TEXT NOT NULL,
    "destinationZipId" TEXT NOT NULL,
    "isAllowed" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Route_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ZipCode" (
    "id" TEXT NOT NULL,
    "cityId" TEXT NOT NULL,

    CONSTRAINT "ZipCode_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Route" ADD CONSTRAINT "Route_originZipId_fkey" FOREIGN KEY ("originZipId") REFERENCES "ZipCode"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Route" ADD CONSTRAINT "Route_destinationZipId_fkey" FOREIGN KEY ("destinationZipId") REFERENCES "ZipCode"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
