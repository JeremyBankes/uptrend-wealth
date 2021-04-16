
CREATE OR REPLACE PROCEDURE GetCountries() BEGIN
    SELECT * FROM Country;
END;

START TRANSACTION;

ALTER TABLE Address
    DROP FOREIGN KEY FK_Address_Country;

TRUNCATE Country;
INSERT INTO Country(Name) VALUES ('Afghanistan');
INSERT INTO Country(Name) VALUES ('Albania');
INSERT INTO Country(Name) VALUES ('Algeria');
INSERT INTO Country(Name) VALUES ('Andorra');
INSERT INTO Country(Name) VALUES ('Angola');
INSERT INTO Country(Name) VALUES ('Antigua and Barbuda');
INSERT INTO Country(Name) VALUES ('Argentina');
INSERT INTO Country(Name) VALUES ('Armenia');
INSERT INTO Country(Name) VALUES ('Australia');
INSERT INTO Country(Name) VALUES ('Austria');
INSERT INTO Country(Name) VALUES ('Azerbaijan');
INSERT INTO Country(Name) VALUES ('Bahamas');
INSERT INTO Country(Name) VALUES ('Bahrain');
INSERT INTO Country(Name) VALUES ('Bangladesh');
INSERT INTO Country(Name) VALUES ('Barbados');
INSERT INTO Country(Name) VALUES ('Belarus');
INSERT INTO Country(Name) VALUES ('Belgium');
INSERT INTO Country(Name) VALUES ('Belize');
INSERT INTO Country(Name) VALUES ('Benin');
INSERT INTO Country(Name) VALUES ('Bhutan');
INSERT INTO Country(Name) VALUES ('Bolivia');
INSERT INTO Country(Name) VALUES ('Bosnia and Herzegovina');
INSERT INTO Country(Name) VALUES ('Botswana');
INSERT INTO Country(Name) VALUES ('Brazil');
INSERT INTO Country(Name) VALUES ('Brunei');
INSERT INTO Country(Name) VALUES ('Bulgaria');
INSERT INTO Country(Name) VALUES ('Burkina Faso');
INSERT INTO Country(Name) VALUES ('Burundi');
INSERT INTO Country(Name) VALUES ('Côte d\'Ivoire');
INSERT INTO Country(Name) VALUES ('Cabo Verde');
INSERT INTO Country(Name) VALUES ('Cambodia');
INSERT INTO Country(Name) VALUES ('Cameroon');
INSERT INTO Country(Name) VALUES ('Canada');
INSERT INTO Country(Name) VALUES ('Central African Republic');
INSERT INTO Country(Name) VALUES ('Chad');
INSERT INTO Country(Name) VALUES ('Chile');
INSERT INTO Country(Name) VALUES ('China');
INSERT INTO Country(Name) VALUES ('Colombia');
INSERT INTO Country(Name) VALUES ('Comoros');
INSERT INTO Country(Name) VALUES ('Congo (Congo-Brazzaville)');
INSERT INTO Country(Name) VALUES ('Costa Rica');
INSERT INTO Country(Name) VALUES ('Croatia');
INSERT INTO Country(Name) VALUES ('Cuba');
INSERT INTO Country(Name) VALUES ('Cyprus');
INSERT INTO Country(Name) VALUES ('Czechia (Czech Republic)');
INSERT INTO Country(Name) VALUES ('Democratic Republic of the Congo');
INSERT INTO Country(Name) VALUES ('Denmark');
INSERT INTO Country(Name) VALUES ('Djibouti');
INSERT INTO Country(Name) VALUES ('Dominica');
INSERT INTO Country(Name) VALUES ('Dominican Republic');
INSERT INTO Country(Name) VALUES ('Ecuador');
INSERT INTO Country(Name) VALUES ('Egypt');
INSERT INTO Country(Name) VALUES ('El Salvador');
INSERT INTO Country(Name) VALUES ('Equatorial Guinea');
INSERT INTO Country(Name) VALUES ('Eritrea');
INSERT INTO Country(Name) VALUES ('Estonia');
INSERT INTO Country(Name) VALUES ('Eswatini (fmr. "Swaziland")');
INSERT INTO Country(Name) VALUES ('Ethiopia');
INSERT INTO Country(Name) VALUES ('Fiji');
INSERT INTO Country(Name) VALUES ('Finland');
INSERT INTO Country(Name) VALUES ('France');
INSERT INTO Country(Name) VALUES ('Gabon');
INSERT INTO Country(Name) VALUES ('Gambia');
INSERT INTO Country(Name) VALUES ('Georgia');
INSERT INTO Country(Name) VALUES ('Germany');
INSERT INTO Country(Name) VALUES ('Ghana');
INSERT INTO Country(Name) VALUES ('Greece');
INSERT INTO Country(Name) VALUES ('Grenada');
INSERT INTO Country(Name) VALUES ('Guatemala');
INSERT INTO Country(Name) VALUES ('Guinea');
INSERT INTO Country(Name) VALUES ('Guinea-Bissau');
INSERT INTO Country(Name) VALUES ('Guyana');
INSERT INTO Country(Name) VALUES ('Haiti');
INSERT INTO Country(Name) VALUES ('Holy See');
INSERT INTO Country(Name) VALUES ('Honduras');
INSERT INTO Country(Name) VALUES ('Hungary');
INSERT INTO Country(Name) VALUES ('Iceland');
INSERT INTO Country(Name) VALUES ('India');
INSERT INTO Country(Name) VALUES ('Indonesia');
INSERT INTO Country(Name) VALUES ('Iran');
INSERT INTO Country(Name) VALUES ('Iraq');
INSERT INTO Country(Name) VALUES ('Ireland');
INSERT INTO Country(Name) VALUES ('Israel');
INSERT INTO Country(Name) VALUES ('Italy');
INSERT INTO Country(Name) VALUES ('Jamaica');
INSERT INTO Country(Name) VALUES ('Japan');
INSERT INTO Country(Name) VALUES ('Jordan');
INSERT INTO Country(Name) VALUES ('Kazakhstan');
INSERT INTO Country(Name) VALUES ('Kenya');
INSERT INTO Country(Name) VALUES ('Kiribati');
INSERT INTO Country(Name) VALUES ('Kuwait');
INSERT INTO Country(Name) VALUES ('Kyrgyzstan');
INSERT INTO Country(Name) VALUES ('Laos');
INSERT INTO Country(Name) VALUES ('Latvia');
INSERT INTO Country(Name) VALUES ('Lebanon');
INSERT INTO Country(Name) VALUES ('Lesotho');
INSERT INTO Country(Name) VALUES ('Liberia');
INSERT INTO Country(Name) VALUES ('Libya');
INSERT INTO Country(Name) VALUES ('Liechtenstein');
INSERT INTO Country(Name) VALUES ('Lithuania');
INSERT INTO Country(Name) VALUES ('Luxembourg');
INSERT INTO Country(Name) VALUES ('Madagascar');
INSERT INTO Country(Name) VALUES ('Malawi');
INSERT INTO Country(Name) VALUES ('Malaysia');
INSERT INTO Country(Name) VALUES ('Maldives');
INSERT INTO Country(Name) VALUES ('Mali');
INSERT INTO Country(Name) VALUES ('Malta');
INSERT INTO Country(Name) VALUES ('Marshall Islands');
INSERT INTO Country(Name) VALUES ('Mauritania');
INSERT INTO Country(Name) VALUES ('Mauritius');
INSERT INTO Country(Name) VALUES ('Mexico');
INSERT INTO Country(Name) VALUES ('Micronesia');
INSERT INTO Country(Name) VALUES ('Moldova');
INSERT INTO Country(Name) VALUES ('Monaco');
INSERT INTO Country(Name) VALUES ('Mongolia');
INSERT INTO Country(Name) VALUES ('Montenegro');
INSERT INTO Country(Name) VALUES ('Morocco');
INSERT INTO Country(Name) VALUES ('Mozambique');
INSERT INTO Country(Name) VALUES ('Myanmar (formerly Burma)');
INSERT INTO Country(Name) VALUES ('Namibia');
INSERT INTO Country(Name) VALUES ('Nauru');
INSERT INTO Country(Name) VALUES ('Nepal');
INSERT INTO Country(Name) VALUES ('Netherlands');
INSERT INTO Country(Name) VALUES ('New Zealand');
INSERT INTO Country(Name) VALUES ('Nicaragua');
INSERT INTO Country(Name) VALUES ('Niger');
INSERT INTO Country(Name) VALUES ('Nigeria');
INSERT INTO Country(Name) VALUES ('North Korea');
INSERT INTO Country(Name) VALUES ('North Macedonia');
INSERT INTO Country(Name) VALUES ('Norway');
INSERT INTO Country(Name) VALUES ('Oman');
INSERT INTO Country(Name) VALUES ('Pakistan');
INSERT INTO Country(Name) VALUES ('Palau');
INSERT INTO Country(Name) VALUES ('Palestine State');
INSERT INTO Country(Name) VALUES ('Panama');
INSERT INTO Country(Name) VALUES ('Papua New Guinea');
INSERT INTO Country(Name) VALUES ('Paraguay');
INSERT INTO Country(Name) VALUES ('Peru');
INSERT INTO Country(Name) VALUES ('Philippines');
INSERT INTO Country(Name) VALUES ('Poland');
INSERT INTO Country(Name) VALUES ('Portugal');
INSERT INTO Country(Name) VALUES ('Qatar');
INSERT INTO Country(Name) VALUES ('Romania');
INSERT INTO Country(Name) VALUES ('Russia');
INSERT INTO Country(Name) VALUES ('Rwanda');
INSERT INTO Country(Name) VALUES ('Saint Kitts and Nevis');
INSERT INTO Country(Name) VALUES ('Saint Lucia');
INSERT INTO Country(Name) VALUES ('Saint Vincent and the Grenadines');
INSERT INTO Country(Name) VALUES ('Samoa');
INSERT INTO Country(Name) VALUES ('San Marino');
INSERT INTO Country(Name) VALUES ('Sao Tome and Principe');
INSERT INTO Country(Name) VALUES ('Saudi Arabia');
INSERT INTO Country(Name) VALUES ('Senegal');
INSERT INTO Country(Name) VALUES ('Serbia');
INSERT INTO Country(Name) VALUES ('Seychelles');
INSERT INTO Country(Name) VALUES ('Sierra Leone');
INSERT INTO Country(Name) VALUES ('Singapore');
INSERT INTO Country(Name) VALUES ('Slovakia');
INSERT INTO Country(Name) VALUES ('Slovenia');
INSERT INTO Country(Name) VALUES ('Solomon Islands');
INSERT INTO Country(Name) VALUES ('Somalia');
INSERT INTO Country(Name) VALUES ('South Africa');
INSERT INTO Country(Name) VALUES ('South Korea');
INSERT INTO Country(Name) VALUES ('South Sudan');
INSERT INTO Country(Name) VALUES ('Spain');
INSERT INTO Country(Name) VALUES ('Sri Lanka');
INSERT INTO Country(Name) VALUES ('Sudan');
INSERT INTO Country(Name) VALUES ('Suriname');
INSERT INTO Country(Name) VALUES ('Sweden');
INSERT INTO Country(Name) VALUES ('Switzerland');
INSERT INTO Country(Name) VALUES ('Syria');
INSERT INTO Country(Name) VALUES ('Tajikistan');
INSERT INTO Country(Name) VALUES ('Tanzania');
INSERT INTO Country(Name) VALUES ('Thailand');
INSERT INTO Country(Name) VALUES ('Timor-Leste');
INSERT INTO Country(Name) VALUES ('Togo');
INSERT INTO Country(Name) VALUES ('Tonga');
INSERT INTO Country(Name) VALUES ('Trinidad and Tobago');
INSERT INTO Country(Name) VALUES ('Tunisia');
INSERT INTO Country(Name) VALUES ('Turkey');
INSERT INTO Country(Name) VALUES ('Turkmenistan');
INSERT INTO Country(Name) VALUES ('Tuvalu');
INSERT INTO Country(Name) VALUES ('Uganda');
INSERT INTO Country(Name) VALUES ('Ukraine');
INSERT INTO Country(Name) VALUES ('United Arab Emirates');
INSERT INTO Country(Name) VALUES ('United Kingdom');
INSERT INTO Country(Name) VALUES ('United States of America');
INSERT INTO Country(Name) VALUES ('Uruguay');
INSERT INTO Country(Name) VALUES ('Uzbekistan');
INSERT INTO Country(Name) VALUES ('Vanuatu');
INSERT INTO Country(Name) VALUES ('Venezuela');
INSERT INTO Country(Name) VALUES ('Vietnam');
INSERT INTO Country(Name) VALUES ('Yemen');
INSERT INTO Country(Name) VALUES ('Zambia');
INSERT INTO Country(Name) VALUES ('Zimbabwe');

ALTER TABLE Address
    ADD CONSTRAINT FK_Address_Country FOREIGN KEY (CountryId) REFERENCES Country (Id);

COMMIT;