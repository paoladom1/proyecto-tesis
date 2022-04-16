CREATE TABLE capitulo(
    id int primary key auto_increment,
    nombre_capitulo varchar(200),
    orden_capitulo int,
    updated_at datetime,
    created_at datetime
) ENGINE=InnoDb;

CREATE TABLE contenido_capitulo(
    id int primary key auto_increment,
    titulo_subtitulo varchar(200),
    tipo int,
    contenido text,
    orden_contenido int,
    id_capitulo int references capitulo(id),
    updated_at datetime,
    created_at datetime,
    FOREIGN KEY (id_capitulo) REFERENCES capitulo(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDb;

CREATE TABLE contenido_capitulo2(
    id int primary key auto_increment,
    titulo_subtitulo varchar(200),
    contenido text,
    orden_contenido int,
    id_contenido_capitulo int references contenido_capitulo(id),
    updated_at datetime,
    created_at datetime,
    FOREIGN KEY (id_contenido_capitulo) REFERENCES contenido_capitulo(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDb;