CREATE TABLE IF NOT EXISTS Manutencao (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    idCarro INTEGER NOT NULL,
    data DATE NOT NULL,
    manType INTEGER NOT NULL,
    odometro INTEGER,
    preco INTEGER,
    dataProximo DATE,
    odometroProximo INTEGER,
    FOREIGN KEY(manType) REFERENCES ManutencaoType(id)
);

CREATE TABLE IF NOT EXISTS ManutencaoType (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Abastecimento (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    idCarro INTEGER NOT NULL,
    data DATE NOT NULL,
    combustivelType INTEGER NOT NULL,
    quantidadeLitros INTEGER NOT NULL,
    preco INTEGER NOT NULL
    FOREIGN KEY(combustivelType) REFERENCES CombustivelType(id)
);

CREATE TABLE IF NOT EXISTS CombustivelType (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);
INSERT INTO ManutencaoType (name)
VALUES ("Troca de oleo"), ("Agua do radiador");
