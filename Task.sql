CREATE DATABASE MusicApp

USE MusicApp
--------------Tables----------------
CREATE TABLE Users (
    id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50),
    Surname NVARCHAR(50),
    Username NVARCHAR(50),
    Password NVARCHAR(20) NULL,
    Gender NVARCHAR(10) NULL
);

CREATE TABLE Artists (
    id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50),
    Surname NVARCHAR(50),
    Birthday DATETIME NULL,
    Gender NVARCHAR(10) NULL
);


CREATE TABLE Categories (
    id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50)
);


CREATE TABLE Musics (
    id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50),
    Duration DECIMAL,
    ArtistId INT FOREIGN KEY REFERENCES Artists(id),
    CategoryId INT FOREIGN KEY REFERENCES Categories(id)
);

CREATE TABLE Playlists (
    id INT PRIMARY KEY IDENTITY(1,1),
    UserId INT FOREIGN KEY REFERENCES Users(id),
    MusicId INT FOREIGN KEY REFERENCES Musics(id)
);
--------------Tables----------------

--------------Inserts----------------

INSERT INTO Users (Name, Surname, Username, Password, Gender)
VALUES
    ('Murad', 'Khasaddinov', 'MurEdu2003', 'forgot23', 'Male'),
    ('Subhan', 'Amiraslanov', 'Adolf', 'hail123', 'Female'),
    ('Vagif', 'Qarayev', 'notNasirli', 'qaraqarayev', 'Male');

INSERT INTO Artists (Name, Surname, Birthday, Gender)
VALUES
    ('Rashid', 'Behbudov', '1958-08-29', 'Male'),
    ('Katy', 'Perry', '2000-05-05', 'Female'),
    ('Engelbert', 'Humperdinck', '1947-03-25', 'Male');

INSERT INTO Categories (Name)
VALUES
    ('Pop'),
    ('Rock'),
    ('Classical');



INSERT INTO Musics (Name, Duration, ArtistId, CategoryId)
VALUES
    ('Nazende Sevgilim', 5.42, 1, 3),
    ('Roar', 4.55, 2, 1),
    ('A mMan Without Love', 4.42, 3, 2);



INSERT INTO Playlists (UserId, MusicId)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

--------------Inserts----------------

CREATE VIEW MusicInfo AS
SELECT
    M.Name AS MusicName,
    M.Duration AS MusicLength,
    C.Name AS MusicCategory,
    CONCAT(A.Name, ' ', A.Surname) AS ArtistName
FROM Musics M
INNER JOIN Categories C ON M.CategoryId = C.id
INNER JOIN Artists A ON M.ArtistId = A.id;

SELECT * FROM MusicInfo;

DROP TABLE Categories;
