INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_paradise','paradise',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_paradise','paradise',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_paradise', 'paradise', 1)
;

INSERT INTO `jobs` (`name`, `label`) VALUES
('paradise', 'paradise');

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('paradise', 0, 'recrue','Stagiaire', 200, 'null', 'null'),
('paradise', 1, 'gerant','Employé', 400, 'null', 'null'),
('paradise', 2, 'boss', 'Patron', 1000, 'null', 'null');

INSERT INTO `items` (name, label, `limit`) VALUES 
	('eau', 'Eau', 5),
	('pain', 'Pain', 5),
	('biere', 'Bière', 5),
	('whisky', 'Whisky', 5),
	('vodka', 'Vodka', 5),
	('rhum', 'Rhum', 5),
;