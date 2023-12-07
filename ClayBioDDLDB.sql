-- Country Table
CREATE TABLE IF NOT EXISTS country (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL UNIQUE,
    CONSTRAINT pk_idCountry PRIMARY KEY(id)
);

-- Department Table
CREATE TABLE IF NOT EXISTS department (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    fkIdCountry INT NOT NULL,
    CONSTRAINT pk_idDepartment PRIMARY KEY(id),
    CONSTRAINT fk_idCountry FOREIGN KEY(fkIdCountry) REFERENCES country(id)
);

-- Town Table
CREATE TABLE IF NOT EXISTS town (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    fkIdDepartment INT NOT NULL,
    CONSTRAINT pk_idTown PRIMARY KEY(id),
    CONSTRAINT fk_idDepartment FOREIGN KEY(fkIdDepartment) REFERENCES department(id)
);

-- Company Table
CREATE TABLE IF NOT EXISTS company (
    id INT AUTO_INCREMENT NOT NULL,
    nit VARCHAR(50) UNIQUE NOT NULL,
    companyName VARCHAR(70) UNIQUE NOT NULL,
    manager VARCHAR(50) NOT NULL,
    creationDate DATE NOT NULL,
    fkIdTown INT NOT NULL,
    CONSTRAINT pk_idCompany PRIMARY KEY(id),
    CONSTRAINT fk_idTown FOREIGN KEY(fkIdTown) REFERENCES town(id)
);

-- employeeType Table
CREATE TABLE IF NOT EXISTS employeeType (
    id INT AUTO_INCREMENT NOT NULL,
    description VARCHAR(50) NOT NULL,
    salary DOUBLE NOT NULL,
    CONSTRAINT pk_idEmployeeType PRIMARY KEY(id)
);