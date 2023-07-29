-- CreateTable
CREATE TABLE "Album" (
    "AlbumId" SERIAL NOT NULL,
    "Title" TEXT NOT NULL,
    "ArtistId" INTEGER NOT NULL,

    CONSTRAINT "Album_pkey" PRIMARY KEY ("AlbumId")
);

-- CreateTable
CREATE TABLE "Artist" (
    "ArtistId" SERIAL NOT NULL,
    "Name" TEXT,

    CONSTRAINT "Artist_pkey" PRIMARY KEY ("ArtistId")
);

-- CreateTable
CREATE TABLE "Customer" (
    "CustomerId" SERIAL NOT NULL,
    "FirstName" TEXT NOT NULL,
    "LastName" TEXT NOT NULL,
    "Company" TEXT,
    "Address" TEXT,
    "City" TEXT,
    "State" TEXT,
    "Country" TEXT,
    "PostalCode" TEXT,
    "Phone" TEXT,
    "Fax" TEXT,
    "Email" TEXT NOT NULL,
    "SupportRepId" INTEGER,

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("CustomerId")
);

-- CreateTable
CREATE TABLE "Employee" (
    "EmployeeId" SERIAL NOT NULL,
    "LastName" TEXT NOT NULL,
    "FirstName" TEXT NOT NULL,
    "Title" TEXT,
    "ReportsTo" INTEGER,
    "BirthDate" TIMESTAMP(3),
    "HireDate" TIMESTAMP(3),
    "Address" TEXT,
    "City" TEXT,
    "State" TEXT,
    "Country" TEXT,
    "PostalCode" TEXT,
    "Phone" TEXT,
    "Fax" TEXT,
    "Email" TEXT,

    CONSTRAINT "Employee_pkey" PRIMARY KEY ("EmployeeId")
);

-- CreateTable
CREATE TABLE "Genre" (
    "GenreId" SERIAL NOT NULL,
    "Name" TEXT,

    CONSTRAINT "Genre_pkey" PRIMARY KEY ("GenreId")
);

-- CreateTable
CREATE TABLE "Invoice" (
    "InvoiceId" SERIAL NOT NULL,
    "CustomerId" INTEGER NOT NULL,
    "InvoiceDate" TIMESTAMP(3) NOT NULL,
    "BillingAddress" TEXT,
    "BillingCity" TEXT,
    "BillingState" TEXT,
    "BillingCountry" TEXT,
    "BillingPostalCode" TEXT,
    "Total" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Invoice_pkey" PRIMARY KEY ("InvoiceId")
);

-- CreateTable
CREATE TABLE "InvoiceLine" (
    "InvoiceLineId" SERIAL NOT NULL,
    "InvoiceId" INTEGER NOT NULL,
    "TrackId" INTEGER NOT NULL,
    "UnitPrice" DOUBLE PRECISION NOT NULL,
    "Quantity" INTEGER NOT NULL,

    CONSTRAINT "InvoiceLine_pkey" PRIMARY KEY ("InvoiceLineId")
);

-- CreateTable
CREATE TABLE "MediaType" (
    "MediaTypeId" SERIAL NOT NULL,
    "Name" TEXT,

    CONSTRAINT "MediaType_pkey" PRIMARY KEY ("MediaTypeId")
);

-- CreateTable
CREATE TABLE "Playlist" (
    "PlaylistId" SERIAL NOT NULL,
    "Name" TEXT,

    CONSTRAINT "Playlist_pkey" PRIMARY KEY ("PlaylistId")
);

-- CreateTable
CREATE TABLE "PlaylistTrack" (
    "PlaylistTrackId" SERIAL NOT NULL,
    "PlaylistId" INTEGER NOT NULL,
    "TrackId" INTEGER NOT NULL,

    CONSTRAINT "PlaylistTrack_pkey" PRIMARY KEY ("PlaylistTrackId")
);

-- CreateTable
CREATE TABLE "Track" (
    "TrackId" SERIAL NOT NULL,
    "Name" TEXT NOT NULL,
    "AlbumId" INTEGER,
    "MediaTypeId" INTEGER NOT NULL,
    "GenreId" INTEGER,
    "Composer" TEXT,
    "Milliseconds" INTEGER NOT NULL,
    "Bytes" INTEGER,
    "UnitPrice" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Track_pkey" PRIMARY KEY ("TrackId")
);

-- AddForeignKey
ALTER TABLE "Album" ADD CONSTRAINT "Album_ArtistId_fkey" FOREIGN KEY ("ArtistId") REFERENCES "Artist"("ArtistId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Customer" ADD CONSTRAINT "Customer_SupportRepId_fkey" FOREIGN KEY ("SupportRepId") REFERENCES "Employee"("EmployeeId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_ReportsTo_fkey" FOREIGN KEY ("ReportsTo") REFERENCES "Employee"("EmployeeId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_CustomerId_fkey" FOREIGN KEY ("CustomerId") REFERENCES "Customer"("CustomerId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InvoiceLine" ADD CONSTRAINT "InvoiceLine_InvoiceId_fkey" FOREIGN KEY ("InvoiceId") REFERENCES "Invoice"("InvoiceId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InvoiceLine" ADD CONSTRAINT "InvoiceLine_TrackId_fkey" FOREIGN KEY ("TrackId") REFERENCES "Track"("TrackId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlaylistTrack" ADD CONSTRAINT "PlaylistTrack_PlaylistId_fkey" FOREIGN KEY ("PlaylistId") REFERENCES "Playlist"("PlaylistId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PlaylistTrack" ADD CONSTRAINT "PlaylistTrack_TrackId_fkey" FOREIGN KEY ("TrackId") REFERENCES "Track"("TrackId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Track" ADD CONSTRAINT "Track_AlbumId_fkey" FOREIGN KEY ("AlbumId") REFERENCES "Album"("AlbumId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Track" ADD CONSTRAINT "Track_GenreId_fkey" FOREIGN KEY ("GenreId") REFERENCES "Genre"("GenreId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Track" ADD CONSTRAINT "Track_MediaTypeId_fkey" FOREIGN KEY ("MediaTypeId") REFERENCES "MediaType"("MediaTypeId") ON DELETE RESTRICT ON UPDATE CASCADE;
