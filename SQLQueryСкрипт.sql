USE [Кинотеатр]
GO
DROP TABLE [dbo].[hall_row]
GO
DROP TABLE [dbo].[tickets]
GO
DROP TABLE [dbo].[screening]
GO
DROP TABLE [dbo].[hall]
GO
DROP TABLE [dbo].[film]
GO
DROP TABLE [dbo].[manager]
GO
DROP TABLE [dbo].[cashier]
GO

GO
CREATE TABLE [dbo].[manager](
  id_manager int NOT NULL,
  login_m varchar(100) NOT NULL,
  password_m varchar(100) NOT NULL,
  CONSTRAINT [PK_manager] PRIMARY KEY (id_manager),
  CONSTRAINT login_m_uk unique(login_m),
  CONSTRAINT password_m_uk unique(password_m)
)
GO
CREATE TABLE [dbo].[film](
  id_film int NOT NULL,
  manager_id int NOT NULL,
  name varchar(255) NOT NULL,
  description varchar(2000) NOT NULL,
  CONSTRAINT [PK_film] PRIMARY KEY (id_film),
  FOREIGN KEY (manager_id)  REFERENCES manager (id_manager),
  CONSTRAINT name_uk unique(name),
  CONSTRAINT description_uk unique(description)
  )
  GO
CREATE TABLE [dbo].[hall](
  id_hall int NOT NULL,
  name varchar(100) NOT NULL,
  description_hall varchar(2000) NOT NULL,
  CONSTRAINT [PK_hall] PRIMARY KEY (id_hall),
  CONSTRAINT name2_uk unique(name), 
  CONSTRAINT description2_uk unique(description_hall)
)
GO

CREATE TABLE [dbo].[hall_row](
  id_hall_row int NOT NULL,
  hall_id_h int NOT NULL,
  number int NOT NULL,
  capacity int NOT NULL,
  category varchar(100) NOT NULL,
  description varchar(2000) NOT NULL,
  FOREIGN KEY (hall_id_h)  REFERENCES hall (id_hall),
  CONSTRAINT [PK_hall_row] PRIMARY KEY (id_hall_row),
  )
GO
CREATE TABLE [dbo].[screening](
  id_screening int NOT NULL,
  hall_id int NOT NULL,
  film_id int NOT NULL,
  time datetime NOT NULL,
  FOREIGN KEY (hall_id)  REFERENCES hall (id_hall),
  FOREIGN KEY (film_id)  REFERENCES film (id_film),
  CONSTRAINT [PK_screening] PRIMARY KEY (id_screening), 
    )
GO
CREATE TABLE [dbo].[cashier](
  id_cashier int NOT NULL,
  login_c varchar(100) NOT NULL,
  password_c varchar(100) NOT NULL,
  CONSTRAINT [PK_cashier] PRIMARY KEY (id_cashier),
  CONSTRAINT login_c_uk unique(login_c),
  CONSTRAINT password_c_uk unique(password_c)
)
GO
CREATE TABLE [dbo].[tickets](
  id_tickets int NOT NULL,
  id_screening_t int NOT NULL,
  cashier_id int NOT NULL,
  row smallint NOT NULL,
  seat smallint NOT NULL,
  cost int NOT NULL,
  CONSTRAINT [PK_tickets] PRIMARY KEY (id_tickets),
  FOREIGN KEY (id_screening_t)  REFERENCES screening (id_screening),
  FOREIGN KEY (cashier_id)  REFERENCES cashier (id_cashier),
  
  )
GO
