USE [master]
GO
DROP DATABASE TrabajoGI1718
GO
CREATE DATABASE TrabajoGI1718
GO
USE [TrabajoGI1718]
GO
/****** Object:  Table [dbo].[tLibro]    Script Date: 13/11/2017 20:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tLibro](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TITULO] [varchar](255) NOT NULL,
	[AUTOR] [varchar](255) NOT NULL,
	[ID_Materia] [varchar](4) NOT NULL,
 CONSTRAINT [PK_Cancion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tMateria]    Script Date: 13/11/2017 20:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tMateria](
	[ID_Materia] [varchar](4) NOT NULL,
	[NOMBRE] [varchar](80) NOT NULL,
 CONSTRAINT [PK_tMateria] PRIMARY KEY CLUSTERED 
(
	[ID_Materia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tPantalla]    Script Date: 13/11/2017 20:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tPantalla](
	[pantalla] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tPantalla] PRIMARY KEY CLUSTERED 
(
	[pantalla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tPermiso]    Script Date: 13/11/2017 20:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tPermiso](
	[rolName] [varchar](50) NOT NULL,
	[pantalla] [varchar](50) NOT NULL,
	[acceso] [bit] NOT NULL,
	[modificacion] [bit] NOT NULL,
 CONSTRAINT [PK_tPermiso] PRIMARY KEY CLUSTERED 
(
	[rolName] ASC,
	[pantalla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tRol]    Script Date: 13/11/2017 20:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tRol](
	[rolName] [varchar](50) NOT NULL,
	[rolDes] [varchar](255) NULL,
	[admin] [bit] NOT NULL,
 CONSTRAINT [PK_tRol] PRIMARY KEY CLUSTERED 
(
	[rolName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tUsuario]    Script Date: 13/11/2017 20:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tUsuario](
	[nombre] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[rolName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tUsuario] PRIMARY KEY CLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tLibro]  WITH CHECK ADD  CONSTRAINT [FK_tLibro_tMateria] FOREIGN KEY([ID_Materia])
REFERENCES [dbo].[tMateria] ([ID_Materia])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tLibro] CHECK CONSTRAINT [FK_tLibro_tMateria]
GO
ALTER TABLE [dbo].[tPermiso]  WITH CHECK ADD  CONSTRAINT [FK_tPermiso_tPantalla] FOREIGN KEY([pantalla])
REFERENCES [dbo].[tPantalla] ([pantalla])
GO
ALTER TABLE [dbo].[tPermiso] CHECK CONSTRAINT [FK_tPermiso_tPantalla]
GO
ALTER TABLE [dbo].[tPermiso]  WITH CHECK ADD  CONSTRAINT [FK_tPermiso_tRol] FOREIGN KEY([rolName])
REFERENCES [dbo].[tRol] ([rolName])
GO
ALTER TABLE [dbo].[tPermiso] CHECK CONSTRAINT [FK_tPermiso_tRol]
GO
ALTER TABLE [dbo].[tUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tUsuario_tRol] FOREIGN KEY([rolName])
REFERENCES [dbo].[tRol] ([rolName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tUsuario] CHECK CONSTRAINT [FK_tUsuario_tRol]
GO

DELETE tPantalla;
GO
INSERT INTO tPantalla VALUES('LOGIN');
INSERT INTO tPantalla VALUES('MATERIAS');
INSERT INTO tPantalla VALUES('LIBROS');
GO

DELETE tRol;
INSERT INTO tRol VALUES('administrador', 'administrador',1);
INSERT INTO tRol VALUES('usuario', 'usuario',0);
INSERT INTO tRol VALUES('invitado', 'invitado',0);
GO

DELETE tUsuario;
GO
INSERT INTO tUsuario VALUES('admin', 'admin','administrador');
INSERT INTO tUsuario VALUES('user', 'user','usuario');
INSERT INTO tUsuario VALUES('inv', 'inv','invitado');
GO

DELETE tPermiso;
GO
INSERT INTO tPermiso VALUES('administrador','LOGIN',1,1);
INSERT INTO tPermiso VALUES('administrador','MATERIAS',1,1);
INSERT INTO tPermiso VALUES('administrador','LIBROS',1,1);

INSERT INTO tPermiso VALUES('usuario','LOGIN',1,1);
INSERT INTO tPermiso VALUES('usuario','MATERIAS',1,0);
INSERT INTO tPermiso VALUES('usuario','LIBROS',1,0);

INSERT INTO tPermiso VALUES('invitado','LOGIN',1,1);
INSERT INTO tPermiso VALUES('invitado','MATERIAS',0,0);
INSERT INTO tPermiso VALUES('invitado','LIBROS',0,0);

GO

Delete FROM tMateria;
GO

INSERT INTO tMateria VALUES('A',' Artes');
INSERT INTO tMateria VALUES('B',' Biograf�a e historias reales');
INSERT INTO tMateria VALUES('C',' Lengua');
INSERT INTO tMateria VALUES('D',' Literatura y estudios literarios');
INSERT INTO tMateria VALUES('E',' Ense�anza de la lengua inglesa');
INSERT INTO tMateria VALUES('F',' Ficci�n y temas afines');
INSERT INTO tMateria VALUES('G',' Consulta, informaci�n y temas interdisciplinarios');
INSERT INTO tMateria VALUES('H',' Humanidades (historia, arqueolog�a, filosof�a, religi�n)');
INSERT INTO tMateria VALUES('J',' Sociedad y ciencias sociales');
INSERT INTO tMateria VALUES('K',' Econom�a, finanzas, empresa y gesti�n');
INSERT INTO tMateria VALUES('L',' Derecho');
INSERT INTO tMateria VALUES('M',' Medicina');
INSERT INTO tMateria VALUES('P',' Matem�ticas y ciencia');
INSERT INTO tMateria VALUES('R',' Ciencias de la tierra, geograf�a, medioambiente, planificaci�n');
INSERT INTO tMateria VALUES('T',' Tecnolog�a, ingenier�a, agricultura');
INSERT INTO tMateria VALUES('U',' Computaci�n e inform�tica');
INSERT INTO tMateria VALUES('V',' Salud y desarrollo personal');
INSERT INTO tMateria VALUES('W',' Estilo de vida, deporte y ocio');
INSERT INTO tMateria VALUES('Y',' Infantiles, juveniles y did�cticos');

GO

INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('C�digo limpio: manual de estilo para el desarrollo ?gil de software', 'Robert C. Martin','U');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('No me hagas pensar: una aproximaci�n a la usabilidad en la web', 'Steve Krug','U');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('El Libro Negro del Programador: c�mo conseguir una carrera de �xito desarrollando software y c�mo evitar los errores habituales', 'Rafael G�mez Blanes','U');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('Code Complete', 'Steve McConnell','U');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('Coders at Work', 'Peter Seibel','U');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('La entrevista perfecta: las claves para superar con �xito el proceso de selecci�n de las mejores empresas de IT', 'Gayle Laakmann Mcdowell','U');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('Ingenier�a de Software: un enfoque pr�ctico', 'Roger S. Pressman','U');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('The Mythical Man-Month: Essays on Software Engineering', 'por Fred Brooks','U');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('The Pragmatic Programmer', 'Andrew Hunt y David Thomas','U');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('Soft Skills: the software developers life manual', 'John Sonmez','U');

INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('El monstruo de colores', 'Anna Llenas', 'Y');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('Adivina cu�nto te quiero','Sam McBratney y Anita Jeram', 'Y');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('La peque�a oruga glotona', 'Eric Cale', 'Y');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('�A qu� sabe la luna?', 'Michael Grejniec', 'Y');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('Elmer', 'David McKee', 'Y');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('El topo que quer�a saber qui�n se hab�a hecho aquello en su cabeza', 'Werner Holzwarth y Wolf Erlbruch', 'Y');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('Un libro', 'Herv� Tullet', 'Y');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('Por cuatro esquinitas de nada', 'J�r�me Ruillier', 'Y');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('La ovejita que vino a cenar', 'Steve Smallman y Joelle Dreidemy', 'Y');
INSERT INTO tLibro(TITULO, AUTOR, ID_Materia) VALUES('La cebra Camila', 'Marisa Nu�ez y �scar Vill�n', 'Y');

GO