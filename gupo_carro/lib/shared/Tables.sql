CREATE TABLE Manutencao {
    INT id NOT NULL PRIMARY KEY AUTOINCREMENT,
    INT idCarro NOT NULL,
    DATE data NOT NULL,
    INT manType NOT NULL,
    INT odometro,
    INT preco,
    DATE dataProximo,
    INT odometroProximo,
    FOREIGN KEY(manType) REFERENCES ManutencaoType(id)
};

CREATE TABLE ManutencaoType {
    INT id NOT NULL PRIMARY KEY AUTOINCREMENT,
    CHAR(255) name NOT NULL
};

CREATE TABLE Abastecimento {
    INT id NOT NULL PRIMARY KEY AUTOINCREMENT,
    INT idCarro NOT NULL,
    DATE data NOT NULL,
    INT quantidadeLitros NOT NULL,
    INT preco NOT NULL
};

INSERT INTO ManutencaoType (name)
VALUES ("Troca de oleo"), ("Agua do radiador");