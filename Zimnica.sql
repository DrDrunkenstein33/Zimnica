CREATE DATABASE Projekat;
USE Projekat;
CREATE TABLE Zimnica(
	id_zim INT IDENTITY(1,1) PRIMARY KEY,
	cena INT,
	kolicina NVARCHAR(50)
)
CREATE TABLE Korisnik(
	id_kor INT IDENTITY(1,1) PRIMARY KEY,
	email NVARCHAR(50),
	lozinka NVARCHAR(30),
)
INSERT INTO Zimnica(cena,kolicina) VALUES
(400,'500g'),
(500,'650g'),
(750,'1000g');
INSERT INTO Korisnik(email,lozinka) VALUES
('petar.nikolic@gmail.com','123456'),
('xXxBorisTheBladexXx@gmail.com', '0000'),
('princeza.sirena@gmail.com', 'karen');
go
create proc KorisnikInsert
@email varchar(50),
@sifra varchar(20)
as
set lock_timeout 3000;
begin try
if exists (select top 1 email,lozinka from Korisnik where email = @email and lozinka= @sifra)
	return 1
	else
	insert into Korisnik (email,lozinka) 
	Values (@email,@sifra)
		Return 0;
end try
Begin Catch
	return @@error
End Catch
go
create proc KorisnikLogin
@email varchar(50),
@lozinka varchar(20)
as
set lock_timeout 3000;
begin try
if exists (select top 1 email,lozinka from Korisnik where email = @email and lozinka= @lozinka)
	Begin
		Return 1
	End
	Return 0
end try
Begin Catch
	Return @@error
End Catch
go
create proc ZimnicaInsert
@cena INT,
@kolicina varchar(20)
as
set lock_timeout 3000;
begin try
if exists (select top 1 cena,kolicina from Zimnica where cena = @cena and kolicina = @kolicina)
	return 1
	else
	insert into Zimnica(cena,kolicina) 
	Values (@cena,@kolicina)
		Return 0;
end try
Begin Catch
	return @@error
End Catch
