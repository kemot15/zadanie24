CREATE SCHEMA javastart;
#1
CREATE TABLE pracownik (
id INT PRIMARY KEY AUTO_INCREMENT,
imie VARCHAR(50),
nazwisko VARCHAR(50),
wyplata DECIMAL,
data_urodzenia date,
stanowisko VARCHAR(50));
#2
INSERT INTO pracownik SET
imie = 'Patryk',
nazwisko = 'Kochanowski',
wyplata = 5300,
data_urodzenia = '1975-06-25',
stanowisko = 'kierowca';


INSERT INTO pracownik SET
imie = 'Witold',
nazwisko = 'Wieczorek',
wyplata = 3500,
data_urodzenia = '1985-10-17',
stanowisko = 'kierowca';

INSERT INTO pracownik SET
imie = 'Maciej',
nazwisko = 'Michalak',
wyplata = 10500,
data_urodzenia = '1956-03-19',
stanowisko = 'dyrektor';

INSERT INTO pracownik SET
imie = 'Agnieszka',
nazwisko = 'Maj',
wyplata = 4300,
data_urodzenia = '1979-04-23',
stanowisko = 'ksiegowy';

INSERT INTO pracownik SET
imie = 'Mirosław',
nazwisko = 'Szybki',
wyplata = 6800,
data_urodzenia = '1989-08-19',
stanowisko = 'kierownik';
#3
SELECT * FROM pracownik ORDER BY nazwisko;
#4
SELECT * FROM pracownik WHERE stanowisko = 'kierowca';
#5
SELECT * FROM pracownik WHERE (DATEDIFF(CURDATE(), data_urodzenia))/365 >= 30;
#6
UPDATE pracownik SET wyplata = (wyplata*0.1 + wyplata) WHERE stanowisko = 'kierowca';
#7
#DELETE FROM pracownik WHERE (data_urodzenia) = (select MAX(data_urodzenia)  from pracownik ) ;


DELETE p
    FROM pracownik p JOIN
         (SELECT max(data_urodzenia) AS maxdate FROM pracownik) x
         ON p.data_urodzenia = x.maxdate;


#8
DROP TABLE pracownik;
#9
CREATE TABLE stanowisko (
id INT PRIMARY KEY AUTO_INCREMENT,
pozycja VARCHAR(50),
opis VARCHAR(200),
wyplata DECIMAL(8,2));
#10
CREATE TABLE adres (
id_pracownik INT PRIMARY KEY ,
ulica VARCHAR(50),
kod VARCHAR(50),
miejscowosc VARCHAR(50));
#11
CREATE TABLE pracownik (
id INT PRIMARY KEY AUTO_INCREMENT,
id_stanowisko INT,
imie VARCHAR(50),
nazwisko VARCHAR(50));
#12
INSERT INTO stanowisko
SET
pozycja = 'kierownik',
opis = 'kierownik produkcji',
wyplata = 5600;

INSERT INTO stanowisko
SET
pozycja = 'pracownik produkcyjny',
opis = 'pracownik na produkcji',
wyplata = 3500;

INSERT INTO pracownik
SET
imie = 'Jan',
Nazwisko = 'Kowalski',
id_stanowisko = 1;

INSERT INTO pracownik
SET
imie = 'Jan2',
Nazwisko = 'Kowalski2',
id_stanowisko = 2;

INSERT INTO pracownik
SET
imie = 'Jan3',
Nazwisko = 'Kowalski3',
id_stanowisko = 2;

INSERT INTO adres
SET
id_pracownik = 1, 
ulica = 'Poziomkowa 34',
kod = '45-345',
miejscowosc = 'Olsztyn';

INSERT INTO adres
SET
id_pracownik = 2, 
ulica = 'Morelowa 34',
kod = '45-315',
miejscowosc = 'Olsztyn';

INSERT INTO adres
SET
id_pracownik = 3, 
ulica = 'Pozioma 34',
kod = '45-315',
miejscowosc = 'Wrocław';

#13
SELECT * FROM pracownik p JOIN adres a ON p.id = a.id_pracownik JOIN stanowisko s ON p.id_stanowisko = s.id;
#14
SELECT SUM(s.wyplata) FROM pracownik p JOIN stanowisko s ON p.id_stanowisko = s.id;
#15
SELECT * FROM pracownik p JOIN adres a ON p.id = a.id_pracownik WHERE a.kod = '45-345';









