-- master.dbo.BUONI definition

-- Drop table

-- DROP TABLE master.dbo.BUONI;

CREATE TABLE master.dbo.BUONI (
	NUMBUO bigint NULL,
	DATABUO datetime2(0) NULL,
	DESTINATARIO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	ENTEAMM varchar(100) COLLATE Latin1_General_CI_AS NULL,
	FLGDISTR varchar(100) COLLATE Latin1_General_CI_AS NULL,
	ID_RICHIESTA bigint NULL,
	STATO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	DATA_CONSEGNA timestamp NULL,
	PROG_DISTINTA bigint NULL,
	DATA_RICHIESTA_MODIFICA datetime2(0) NULL,
	DATA_MODIFICA datetime2(0) NULL
);

-- master.dbo.MSreplication_options definition

-- Drop table

-- DROP TABLE master.dbo.MSreplication_options;

CREATE TABLE master.dbo.MSreplication_options (
	optname sysname COLLATE Latin1_General_CI_AS NOT NULL,
	value bit NOT NULL,
	major_version int NOT NULL,
	minor_version int NOT NULL,
	revision int NOT NULL,
	install_failures int NOT NULL
);


-- master.dbo.abilitazioni_ticket_table definition

-- Drop table

-- DROP TABLE master.dbo.abilitazioni_ticket_table;

CREATE TABLE master.dbo.abilitazioni_ticket_table (
	id bigint IDENTITY(0,1) NOT NULL,
	username varchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	[role] bigint NOT NULL,
	macro_category bigint NOT NULL,
	name varchar(100) COLLATE Latin1_General_CI_AS NULL,
	category bigint NULL
);
 CREATE NONCLUSTERED INDEX abilitazioni_ticket_table_id_IDX ON dbo.abilitazioni_ticket_table (  id ASC  , username ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- master.dbo.category_table definition

-- Drop table

-- DROP TABLE master.dbo.category_table;

CREATE TABLE master.dbo.category_table (
	id_category bigint NOT NULL,
	name varchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	[level] int NOT NULL,
	id_faq_category bigint NULL,
	CONSTRAINT category_table_PK PRIMARY KEY (id_category,name,[level])
);


-- master.dbo.email_sending_log definition

-- Drop table

-- DROP TABLE master.dbo.email_sending_log;

CREATE TABLE master.dbo.email_sending_log (
	id bigint IDENTITY(1,1) NOT NULL,
	created_at datetime2(6) NULL,
	error varchar(4000) COLLATE Latin1_General_CI_AS NULL,
	news_id bigint NOT NULL,
	receiver varchar(255) COLLATE Latin1_General_CI_AS NULL,
	[result] varchar(255) COLLATE Latin1_General_CI_AS NULL,
	CONSTRAINT PK__email_se__3213E83FA4B13177 PRIMARY KEY (id)
);


-- master.dbo.faq_table definition

-- Drop table

-- DROP TABLE master.dbo.faq_table;

CREATE TABLE master.dbo.faq_table (
	id bigint IDENTITY(1,1) NOT NULL,
	answer varchar(4000) COLLATE Latin1_General_CI_AS NULL,
	category bigint NULL,
	created_at date NULL,
	keywords varchar(1000) COLLATE Latin1_General_CI_AS NULL,
	question varchar(4000) COLLATE Latin1_General_CI_AS NULL,
	macro_category bigint NULL,
	matter bigint NULL,
	stato varchar(100) COLLATE Latin1_General_CI_AS NULL,
	ticket_id bigint NULL,
	CONSTRAINT PK__faq_tabl__3213E83F9556ED1F PRIMARY KEY (id)
);


-- master.dbo.feedback_table definition

-- Drop table

-- DROP TABLE master.dbo.feedback_table;

CREATE TABLE master.dbo.feedback_table (
	id bigint IDENTITY(0,1) NOT NULL,
	username varchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	operatore varchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	comment varchar(255) COLLATE Latin1_General_CI_AS NULL,
	gradimento varchar(100) COLLATE Latin1_General_CI_AS NULL,
	data_feedback datetime2(6) NULL,
	ticket_id bigint NULL,
	verification_code varchar(100) COLLATE Latin1_General_CI_AS NULL,
	macro_category bigint NULL,
	category bigint NULL
);
				 
-- master.dbo.history_sign definition

-- Drop table

-- DROP TABLE master.dbo.history_sign;

CREATE TABLE master.dbo.history_sign (
	uuid varchar(255) COLLATE Latin1_General_CI_AS NOT NULL,
	date_insert datetime2(6) NULL,
	hashm varchar(255) COLLATE Latin1_General_CI_AS NULL,
	hashu varchar(255) COLLATE Latin1_General_CI_AS NULL,
	parameters varchar(255) COLLATE Latin1_General_CI_AS NULL,
	username varchar(255) COLLATE Latin1_General_CI_AS NULL,
	allegati varchar(255) COLLATE Latin1_General_CI_AS NULL,
	CONSTRAINT PK__history___7F4279303FF45252 PRIMARY KEY (uuid)
);
-- master.dbo.identity_table definition

-- Drop table

-- DROP TABLE master.dbo.identity_table;

CREATE TABLE master.dbo.identity_table (
	id bigint IDENTITY(1,1) NOT NULL,
	ad_user bit NOT NULL,
	created_at datetime2(6) NULL,
	email varchar(255) COLLATE Latin1_General_CI_AS NULL,
	enabled bit DEFAULT 0 NULL,
	grado varchar(255) COLLATE Latin1_General_CI_AS NULL,
	modified_at datetime2(6) NULL,
	name varchar(255) COLLATE Latin1_General_CI_AS NULL,
	username varchar(255) COLLATE Latin1_General_CI_AS NULL,
	codice_fiscale varchar(255) COLLATE Latin1_General_CI_AS NULL,
	first_access bit DEFAULT 0 NOT NULL,
	deleted bit NULL,
	CONSTRAINT PK__identity__3213E83F609CB718 PRIMARY KEY (id)
);
 CREATE  UNIQUE NONCLUSTERED INDEX UK_l0c7i5xi55jhnqfurmkgwsbv ON dbo.identity_table (  username ASC  )  
	 WHERE  ([username] IS NOT NULL)
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- master.dbo.log_table definition

-- Drop table

-- DROP TABLE master.dbo.log_table;

CREATE TABLE master.dbo.log_table (
	id bigint IDENTITY(1,1) NOT NULL,
	what_ varchar(MAX) COLLATE Latin1_General_CI_AS NULL,
	when_ datetime2(6) NULL,
	where_ varchar(255) COLLATE Latin1_General_CI_AS NULL,
	who_ varchar(255) COLLATE Latin1_General_CI_AS NULL,
	with_ varchar(MAX) COLLATE Latin1_General_CI_AS NULL,
	CONSTRAINT PK__log_tabl__3213E83F305CF4A1 PRIMARY KEY (id)
);


-- master.dbo.new_table definition

-- Drop table

-- DROP TABLE master.dbo.new_table;

CREATE TABLE master.dbo.new_table (
	COD_AMM nvarchar(10) COLLATE Latin1_General_CI_AS NOT NULL,
	COD_FIS_AMM nvarchar(16) COLLATE Latin1_General_CI_AS NOT NULL,
	SIG_GRA nvarchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	COG_AMM nvarchar(50) COLLATE Latin1_General_CI_AS NOT NULL,
	NOM_AMM nvarchar(32) COLLATE Latin1_General_CI_AS NOT NULL,
	COD_SDS nvarchar(4) COLLATE Latin1_General_CI_AS NOT NULL,
	DES_SDS nvarchar(30) COLLATE Latin1_General_CI_AS NOT NULL,
	AMM_TYPE nvarchar(3) COLLATE Latin1_General_CI_AS NOT NULL,
	CAT_COD_CAT nvarchar(8) COLLATE Latin1_General_CI_AS NULL,
	SCT_COD_SCT nvarchar(8) COLLATE Latin1_General_CI_AS NULL,
	SESSO nvarchar(1) COLLATE Latin1_General_CI_AS NOT NULL,
	DAT_NAS_AMM datetime2 NOT NULL,
	DAT_ARR_AMM datetime2 NOT NULL,
	EMAIL nvarchar(150) COLLATE Latin1_General_CI_AS NULL
);


-- master.dbo.news_table definition

-- Drop table

-- DROP TABLE master.dbo.news_table;

CREATE TABLE master.dbo.news_table (
	id bigint IDENTITY(1,1) NOT NULL,
	created_at datetime2(6) NULL,
	message varchar(MAX) COLLATE Latin1_General_CI_AS NULL,
	title varchar(255) COLLATE Latin1_General_CI_AS NULL,
	individual char(1) COLLATE Latin1_General_CI_AS NULL,
	massive bit NULL,
	CONSTRAINT PK__news_tab__3213E83F4639C33A PRIMARY KEY (id)
);


-- master.dbo.otp_validation definition

-- Drop table

-- DROP TABLE master.dbo.otp_validation;

CREATE TABLE master.dbo.otp_validation (
	uuid varchar(255) COLLATE Latin1_General_CI_AS NOT NULL,
	date_insert datetime2(6) NULL,
	feedback smallint NULL,
	operation varchar(255) COLLATE Latin1_General_CI_AS NULL,
	username varchar(255) COLLATE Latin1_General_CI_AS NULL,
	verified bit NOT NULL,
	CONSTRAINT PK__otp_vali__7F4279306CC5C6F5 PRIMARY KEY (uuid)
);
ALTER TABLE master.dbo.otp_validation WITH NOCHECK ADD CONSTRAINT CK__otp_valid__feedb__5E3FF0B0 CHECK ([feedback]>=(0) AND [feedback]<=(2)												 


-- master.dbo.receiver_table definition

-- Drop table

-- DROP TABLE master.dbo.receiver_table;

CREATE TABLE master.dbo.receiver_table (
	id bigint IDENTITY(1,1) NOT NULL,
	email varchar(255) COLLATE Latin1_General_CI_AS NOT NULL,
	CONSTRAINT PK__receiver__3213E83F8967CB46 PRIMARY KEY (id)
);


-- master.dbo.registration_table definition

-- Drop table

-- DROP TABLE master.dbo.registration_table;

CREATE TABLE master.dbo.registration_table (
	id bigint IDENTITY(1,1) NOT NULL,
	created_at datetime2(6) NULL,
	modified_at datetime2(6) NULL,
	pending bit NOT NULL,
	username varchar(255) COLLATE Latin1_General_CI_AS NULL,
	verification_code varchar(255) COLLATE Latin1_General_CI_AS NULL,
	CONSTRAINT PK__registra__3213E83F1503A649 PRIMARY KEY (id)
);


-- master.dbo.revinfo definition

-- Drop table

-- DROP TABLE master.dbo.revinfo;

CREATE TABLE master.dbo.revinfo (
	rev int IDENTITY(1,1) NOT NULL,
	revtstmp bigint NULL,
	CONSTRAINT PK__revinfo__C2B7CC698C8DDA3F PRIMARY KEY (rev)
);

-- master.dbo.role_table definition

-- Drop table

-- DROP TABLE master.dbo.role_table;

CREATE TABLE master.dbo.role_table (
	id bigint IDENTITY(0,1) NOT NULL,
	name varchar(255) COLLATE Latin1_General_CI_AS NULL,
	created_at datetime2(6) NULL,
	modified_at datetime2(6) NULL
);
-- master.dbo.rt_family definition

-- Drop table

-- DROP TABLE master.dbo.rt_family;

CREATE TABLE master.dbo.rt_family (
	id uniqueidentifier DEFAULT newid() NOT NULL,
	username nvarchar(150) COLLATE Latin1_General_CI_AS NOT NULL,
	authenticated_on datetime2 NOT NULL,
	disabled bit NOT NULL,
	CONSTRAINT PK__rt_famil__3213E83F1C0CA028 PRIMARY KEY (id)
);								  

-- master.dbo.sku definition

-- Drop table

-- DROP TABLE master.dbo.sku;

CREATE TABLE master.dbo.sku (
	uuid varchar(255) COLLATE Latin1_General_CI_AS NOT NULL,
	sku varchar(255) COLLATE Latin1_General_CI_AS NULL,
	username varchar(255) COLLATE Latin1_General_CI_AS NULL,
	version int NULL,
	valid_from datetime2(6) NULL,
	valid_to datetime2(6) NULL,
	qr_code text COLLATE Latin1_General_CI_AS NULL,
	CONSTRAINT PK__sku__7F427930BF2F2B07 PRIMARY KEY (uuid)
);

-- master.dbo.spt_fallback_db definition

-- Drop table

-- DROP TABLE master.dbo.spt_fallback_db;

CREATE TABLE master.dbo.spt_fallback_db (
	xserver_name varchar(30) COLLATE Latin1_General_CI_AS NOT NULL,
	xdttm_ins datetime NOT NULL,
	xdttm_last_ins_upd datetime NOT NULL,
	xfallback_dbid smallint NULL,
	name varchar(30) COLLATE Latin1_General_CI_AS NOT NULL,
	dbid smallint NOT NULL,
	status smallint NOT NULL,
	version smallint NOT NULL
);


-- master.dbo.spt_fallback_dev definition

-- Drop table

-- DROP TABLE master.dbo.spt_fallback_dev;

CREATE TABLE master.dbo.spt_fallback_dev (
	xserver_name varchar(30) COLLATE Latin1_General_CI_AS NOT NULL,
	xdttm_ins datetime NOT NULL,
	xdttm_last_ins_upd datetime NOT NULL,
	xfallback_low int NULL,
	xfallback_drive char(2) COLLATE Latin1_General_CI_AS NULL,
	low int NOT NULL,
	high int NOT NULL,
	status smallint NOT NULL,
	name varchar(30) COLLATE Latin1_General_CI_AS NOT NULL,
	phyname varchar(127) COLLATE Latin1_General_CI_AS NOT NULL
);


-- master.dbo.spt_fallback_usg definition

-- Drop table

-- DROP TABLE master.dbo.spt_fallback_usg;

CREATE TABLE master.dbo.spt_fallback_usg (
	xserver_name varchar(30) COLLATE Latin1_General_CI_AS NOT NULL,
	xdttm_ins datetime NOT NULL,
	xdttm_last_ins_upd datetime NOT NULL,
	xfallback_vstart int NULL,
	dbid smallint NOT NULL,
	segmap int NOT NULL,
	lstart int NOT NULL,
	sizepg int NOT NULL,
	vstart int NOT NULL
);


-- master.dbo.spt_monitor definition

-- Drop table

-- DROP TABLE master.dbo.spt_monitor;

CREATE TABLE master.dbo.spt_monitor (
	lastrun datetime NOT NULL,
	cpu_busy int NOT NULL,
	io_busy int NOT NULL,
	idle int NOT NULL,
	pack_received int NOT NULL,
	pack_sent int NOT NULL,
	connections int NOT NULL,
	pack_errors int NOT NULL,
	total_read int NOT NULL,
	total_write int NOT NULL,
	total_errors int NOT NULL
);


-- master.dbo.stato_ticket_table definition

-- Drop table

-- DROP TABLE master.dbo.stato_ticket_table;

CREATE TABLE master.dbo.stato_ticket_table (
	id bigint IDENTITY(0,1) NOT NULL,
	name varchar(100) COLLATE Latin1_General_CI_AS NULL,
	description varchar(100) COLLATE Latin1_General_CI_AS NULL
);


-- master.dbo.storico_ticket_table definition

-- Drop table

-- DROP TABLE master.dbo.storico_ticket_table;

CREATE TABLE master.dbo.storico_ticket_table (
	id bigint IDENTITY(0,1) NOT NULL,
	ticket_id bigint NULL,
	question varchar(4000) COLLATE Latin1_General_CI_AS NOT NULL,
	answer varchar(4000) COLLATE Latin1_General_CI_AS NULL,
	category_id_category bigint NULL,
	id_stato bigint NOT NULL,
	created_at datetime2(6) NULL,
	approved_at datetime2(6) NULL,
	id_faq_created bigint NULL,
	modified_at datetime2(6) NULL,
	utente_invio varchar(100) COLLATE Latin1_General_CI_AS NULL,
	operatore varchar(100) COLLATE Latin1_General_CI_AS NULL,
	validatore varchar(100) COLLATE Latin1_General_CI_AS NULL,
	inoltrato bit DEFAULT 0 NULL,
	init_operatore varchar(100) COLLATE Latin1_General_CI_AS NULL,
	id_ticket_riferimento bigint NULL,
	nota varchar(4000) COLLATE Latin1_General_CI_AS NULL,
	suggerimento_faq bit DEFAULT 0 NULL,
	macro_category_id_category bigint NULL,
	matter_id_category bigint NULL,
	name varchar(100) COLLATE Latin1_General_CI_AS NULL,
	read_at bit DEFAULT 0 NULL,
	id_feedback bigint NULL,
	verification_code varchar(100) COLLATE Latin1_General_CI_AS NULL,
	inviato_feedback bit DEFAULT 0 NULL
);


-- master.dbo.ticket_table definition

-- Drop table

-- DROP TABLE master.dbo.ticket_table;

CREATE TABLE master.dbo.ticket_table (
	ticket_id bigint IDENTITY(0,1) NOT NULL,
	question varchar(MAX) COLLATE Latin1_General_CI_AS NOT NULL,
	created_at datetime2(6) NULL,
	approved_at datetime2(6) NULL,
	id_faq_created bigint NULL,
	modified_at datetime2(6) NULL,
	utente_invio varchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	operatore varchar(100) COLLATE Latin1_General_CI_AS NULL,
	validatore varchar(100) COLLATE Latin1_General_CI_AS NULL,
	id_stato bigint NOT NULL,
	answer varchar(4000) COLLATE Latin1_General_CI_AS NULL,
	id_ticket_riferimento bigint NULL,
	init_operatore varchar(100) COLLATE Latin1_General_CI_AS NULL,
	nota varchar(4000) COLLATE Latin1_General_CI_AS NULL,
	inoltrato bit DEFAULT 0 NULL,
	suggerimento_faq bit DEFAULT 0 NULL,
	name varchar(100) COLLATE Latin1_General_CI_AS NULL,
	macro_category_id_category bigint NULL,
	matter_id_category bigint NULL,
	category_id_category varchar(100) COLLATE Latin1_General_CI_AS NULL,
	read_at bit DEFAULT 0 NULL,
	id_feedback bigint NULL,
	verification_code varchar(100) COLLATE Latin1_General_CI_AS NULL,
	inviato_feedback bit DEFAULT 0 NULL
);


-- master.dbo.user_table definition

-- Drop table

-- DROP TABLE master.dbo.user_table;

CREATE TABLE master.dbo.user_table (
	created_at datetime2(6) NULL,
	id bigint IDENTITY(1,1) NOT NULL,
	modified_at datetime2(6) NULL,
	password varchar(255) COLLATE Latin1_General_CI_AS NULL,
	username varchar(255) COLLATE Latin1_General_CI_AS NULL,
	deleted bit DEFAULT 0 NULL,
	CONSTRAINT PK__user_tab__3213E83FE428784B PRIMARY KEY (id)
);


-- master.dbo.voce_homepage definition

-- Drop table

-- DROP TABLE master.dbo.voce_homepage;

CREATE TABLE master.dbo.voce_homepage (
	id uniqueidentifier DEFAULT newid() NOT NULL,
	link nvarchar(255) COLLATE Latin1_General_CI_AS NOT NULL,
	color nvarchar(50) COLLATE Latin1_General_CI_AS NOT NULL,
	title nvarchar(255) COLLATE Latin1_General_CI_AS NOT NULL,
	icon nvarchar(255) COLLATE Latin1_General_CI_AS NOT NULL,
	data_modifica datetime DEFAULT getdate() NULL,
	utente nvarchar(100) COLLATE Latin1_General_CI_AS NOT NULL,
	CONSTRAINT PK__voce_hom__3213E83F8BCF420F PRIMARY KEY (id)
);


-- master.dbo.history_sign_aud definition

-- Drop table

-- DROP TABLE master.dbo.history_sign_aud;

CREATE TABLE master.dbo.history_sign_aud (
	uuid varchar(255) COLLATE Latin1_General_CI_AS NOT NULL,
	rev int NOT NULL,
	revtype smallint NULL,
	date_insert datetime2(6) NULL,
	hashm varchar(255) COLLATE Latin1_General_CI_AS NULL,
	hashu varchar(255) COLLATE Latin1_General_CI_AS NULL,
	parameters varchar(255) COLLATE Latin1_General_CI_AS NULL,
	username varchar(255) COLLATE Latin1_General_CI_AS NULL,
	allegati varchar(255) COLLATE Latin1_General_CI_AS NULL,
	CONSTRAINT PK__history___D543EBFA11B4E45B PRIMARY KEY (rev,uuid),
	CONSTRAINT FKe6bwtodyqvrkl2bli266spw3n FOREIGN KEY (rev) REFERENCES master.dbo.revinfo(rev)
);

-- master.dbo.identity_roles_table definition

-- Drop table

-- DROP TABLE master.dbo.identity_roles_table;

CREATE TABLE master.dbo.identity_roles_table (
	id_identity bigint NOT NULL,
	id_role bigint NOT NULL,
	CONSTRAINT FKjyv74lnlrepxn8o6u0n3i4ms7 FOREIGN KEY (id_identity) REFERENCES master.dbo.identity_table(id)
);


-- master.dbo.news_receiver_table definition

-- Drop table

-- DROP TABLE master.dbo.news_receiver_table;

CREATE TABLE master.dbo.news_receiver_table (
	id bigint IDENTITY(1,1) NOT NULL,
	readed bit NOT NULL,
	readed_at datetime2(6) NULL,
	id_news bigint NOT NULL,
	id_receiver bigint NOT NULL,
	CONSTRAINT PK__news_rec__3213E83F89673160 PRIMARY KEY (id),
	CONSTRAINT FKo7pont3ndynisi89rdl201f8j FOREIGN KEY (id_news) REFERENCES master.dbo.news_table(id),
	CONSTRAINT FKt47eh1addjtmkxqxso6fpiu25 FOREIGN KEY (id_receiver) REFERENCES master.dbo.receiver_table(id)
);


-- master.dbo.rt_data definition

-- Drop table

-- DROP TABLE master.dbo.rt_data;

CREATE TABLE master.dbo.rt_data (
	id uniqueidentifier DEFAULT newid() NOT NULL,
	family_id uniqueidentifier NOT NULL,
	created_on datetime2 NOT NULL,
	presented_on datetime2 NULL,
	CONSTRAINT PK__rt_data__3213E83F689B2BF7 PRIMARY KEY (id),
	CONSTRAINT fk_rt_family FOREIGN KEY (family_id) REFERENCES master.dbo.rt_family(id)
);

-- master.dbo.type_table definition

-- Drop table

-- DROP TABLE master.dbo.type_table;

CREATE TABLE master.dbo.type_table (
	id bigint IDENTITY(1,1) NOT NULL,
	code varchar(255) COLLATE Latin1_General_CI_AS NULL,
	created_at datetime2(6) NULL,
	description varchar(255) COLLATE Latin1_General_CI_AS NULL,
	disabled bit DEFAULT 0 NOT NULL,
	disabled_at datetime2(6) NULL,
	name varchar(255) COLLATE Latin1_General_CI_AS NULL,
	id_parent bigint NULL,
	CONSTRAINT PK__type_tab__3213E83FA41C095F PRIMARY KEY (id),
	CONSTRAINT FKmc0cxx6vptkmxwdvgeuwkwhel FOREIGN KEY (id_parent) REFERENCES master.dbo.type_table(id)
);
 CREATE  UNIQUE NONCLUSTERED INDEX UK_d81n9x1l8buiu62aucyfcy3wq ON dbo.type_table (  code ASC  )  
	 WHERE  ([code] IS NOT NULL)
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- master.dbo.value_type_table definition

-- Drop table

-- DROP TABLE master.dbo.value_type_table;

CREATE TABLE master.dbo.value_type_table (
	id bigint IDENTITY(1,1) NOT NULL,
	created_at datetime2(6) NULL,
	description varchar(255) COLLATE Latin1_General_CI_AS NULL,
	disabled bit DEFAULT 0 NOT NULL,
	disabled_at datetime2(6) NULL,
	name varchar(255) COLLATE Latin1_General_CI_AS NULL,
	id_parent bigint NULL,
	id_type bigint NOT NULL,
	CONSTRAINT PK__value_ty__3213E83F80808C23 PRIMARY KEY (id),
	CONSTRAINT FK70j0up5mkpbt55c2a3trmvjbm FOREIGN KEY (id_parent) REFERENCES master.dbo.value_type_table(id),
	CONSTRAINT FKcto2pnh58cm3uakpo4o4r6wnu FOREIGN KEY (id_type) REFERENCES master.dbo.type_table(id)
);


-- master.dbo.communications_table definition

-- Drop table

-- DROP TABLE master.dbo.communications_table;

CREATE TABLE master.dbo.communications_table (
	id bigint IDENTITY(1,1) NOT NULL,
	created_at datetime2(6) NULL,
	description varchar(255) COLLATE Latin1_General_CI_AS NULL,
	disabled bit DEFAULT 0 NOT NULL,
	disabled_at datetime2(6) NULL,
	note varchar(255) COLLATE Latin1_General_CI_AS NULL,
	title varchar(255) COLLATE Latin1_General_CI_AS NULL,
	version bigint NULL,
	[year] int NULL,
	category_id bigint NULL,
	macro_category_id bigint NULL,
	matter_id bigint NULL,
	type_id bigint NULL,
	deleted bit NULL,
	CONSTRAINT PK__communic__3213E83F2960CDC9 PRIMARY KEY (id),
	CONSTRAINT FK2jrib7e56ltf1751ipqtxm98b FOREIGN KEY (category_id) REFERENCES master.dbo.value_type_table(id),
	CONSTRAINT FKgty9sy0t6ygwm3hglnt9rw195 FOREIGN KEY (macro_category_id) REFERENCES master.dbo.value_type_table(id),
	CONSTRAINT FKpwsls8885npglpton6fcmenk4 FOREIGN KEY (type_id) REFERENCES master.dbo.value_type_table(id),
	CONSTRAINT FKtg2wypml6s675hg0r3l1pny1r FOREIGN KEY (matter_id) REFERENCES master.dbo.value_type_table(id)
);


-- master.dbo.attachments_table definition

-- Drop table

-- DROP TABLE master.dbo.attachments_table;

CREATE TABLE master.dbo.attachments_table (
	id bigint IDENTITY(1,1) NOT NULL,
	filename varchar(255) COLLATE Latin1_General_CI_AS NULL,
	id_communication bigint NOT NULL,
	content varbinary(MAX) NULL,
	CONSTRAINT PK__attachme__3213E83FE8B37BFE PRIMARY KEY (id),
	CONSTRAINT FK6y3aanbomykmlyj5nd61a66c2 FOREIGN KEY (id_communication) REFERENCES master.dbo.communications_table(id)
);
