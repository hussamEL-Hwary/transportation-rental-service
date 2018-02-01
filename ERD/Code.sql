/*==============================================================*/
/* DBMS name:      SAP SQL Anywhere 16                          */
/* Created on:     01/02/2018 09:33:05 ã                        */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_BIKE_CONTAINS__STORE') then
    alter table Bike
       delete foreign key FK_BIKE_CONTAINS__STORE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CUSTOMER_HAS_CUSTOMER') then
    alter table Customer
       delete foreign key FK_CUSTOMER_HAS_CUSTOMER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CUSTOMER_HAS2_CUSTOMER') then
    alter table Customer_History
       delete foreign key FK_CUSTOMER_HAS2_CUSTOMER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CUSTOMER_GET_CUSTOMER') then
    alter table Customer_Notifications
       delete foreign key FK_CUSTOMER_GET_CUSTOMER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HEAVEY_C_OWNES_HEA_OWNER') then
    alter table Heavey_Car
       delete foreign key FK_HEAVEY_C_OWNES_HEA_OWNER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_OWNER_OWNES_STORE') then
    alter table Owner
       delete foreign key FK_OWNER_OWNES_STORE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_OWNER_OWNES_HEA_HEAVEY_C') then
    alter table Owner
       delete foreign key FK_OWNER_OWNES_HEA_HEAVEY_C
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_OWNER_OWNES_WIN_WINSH') then
    alter table Owner
       delete foreign key FK_OWNER_OWNES_WIN_WINSH
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_OWNER_NO_GETOWNER_OWNER') then
    alter table Owner_Notifications
       delete foreign key FK_OWNER_NO_GETOWNER_OWNER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PRIVATE__CONTAINS_STORE') then
    alter table Private_Car
       delete foreign key FK_PRIVATE__CONTAINS_STORE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_STORE_OWNES2_OWNER') then
    alter table Store
       delete foreign key FK_STORE_OWNES2_OWNER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_WINSH_OWNES_WIN_OWNER') then
    alter table Winsh
       delete foreign key FK_WINSH_OWNES_WIN_OWNER
end if;

drop index if exists Bike.Contains_Bikes_FK;

drop index if exists Bike.Bike_PK;

drop table if exists Bike;

drop index if exists Customer.Has_FK;

drop index if exists Customer.Customer_PK;

drop table if exists Customer;

drop index if exists Customer_History.Has2_FK;

drop index if exists Customer_History.Customer_History_PK;

drop table if exists Customer_History;

drop index if exists Customer_Notifications.get_FK;

drop index if exists Customer_Notifications.Customer_Notifications_PK;

drop table if exists Customer_Notifications;

drop index if exists Heavey_Car.Ownes_HeaveyCar2_FK;

drop index if exists Heavey_Car.Heavey_Car_PK;

drop table if exists Heavey_Car;

drop index if exists Owner.Ownes_HeaveyCar_FK;

drop index if exists Owner.Ownes_Winsh_FK;

drop index if exists Owner.Ownes_FK;

drop index if exists Owner.Owner_PK;

drop table if exists Owner;

drop index if exists Owner_Notifications.GetOwner_FK;

drop index if exists Owner_Notifications.Owner_Notifications_PK;

drop table if exists Owner_Notifications;

drop index if exists Private_Car.Contains_FK;

drop index if exists Private_Car.Private_Car_PK;

drop table if exists Private_Car;

drop index if exists Store.Ownes2_FK;

drop index if exists Store.Store_PK;

drop table if exists Store;

drop index if exists Winsh.Ownes_Winsh2_FK;

drop index if exists Winsh.Winsh_PK;

drop table if exists Winsh;

/*==============================================================*/
/* Table: Bike                                                  */
/*==============================================================*/
create table Bike 
(
   bike_number          varchar(15)                    not null,
   store_id             integer                        not null,
   color                varchar(15)                    null,
   constraint PK_BIKE primary key clustered (bike_number)
);

/*==============================================================*/
/* Index: Bike_PK                                               */
/*==============================================================*/
create unique clustered index Bike_PK on Bike (
bike_number ASC
);

/*==============================================================*/
/* Index: Contains_Bikes_FK                                     */
/*==============================================================*/
create index Contains_Bikes_FK on Bike (
store_id ASC
);

/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
create table Customer 
(
   customer_userName    varchar(15)                    not null,
   customerHistory_id   integer                        null,
   firstName            varchar(10)                    not null,
   lastName             varchar(10)                    not null,
   email                varchar(10)                    not null,
   password             varchar(15)                    not null,
   image                long binary                    not null,
   quota                integer                        not null,
   constraint PK_CUSTOMER primary key clustered (customer_userName)
);

/*==============================================================*/
/* Index: Customer_PK                                           */
/*==============================================================*/
create unique clustered index Customer_PK on Customer (
customer_userName ASC
);

/*==============================================================*/
/* Index: Has_FK                                                */
/*==============================================================*/
create index Has_FK on Customer (
customerHistory_id ASC
);

/*==============================================================*/
/* Table: Customer_History                                      */
/*==============================================================*/
create table Customer_History 
(
   acceptedRequests     integer                        not null,
   canceledRequestes    integer                        not null,
   Rate                 float                          not null,
   customerHistory_id   integer                        not null,
   customer_userName    varchar(15)                    not null,
   constraint PK_CUSTOMER_HISTORY primary key clustered (customerHistory_id)
);

/*==============================================================*/
/* Index: Customer_History_PK                                   */
/*==============================================================*/
create unique clustered index Customer_History_PK on Customer_History (
customerHistory_id ASC
);

/*==============================================================*/
/* Index: Has2_FK                                               */
/*==============================================================*/
create index Has2_FK on Customer_History (
customer_userName ASC
);

/*==============================================================*/
/* Table: Customer_Notifications                                */
/*==============================================================*/
create table Customer_Notifications 
(
   content              varchar(50)                    not null,
   "time"               timestamp                      not null,
   read                 smallint                       null,
   Customer_Notifications integer                        not null,
   customer_userName    varchar(15)                    not null,
   constraint PK_CUSTOMER_NOTIFICATIONS primary key clustered (Customer_Notifications)
);

/*==============================================================*/
/* Index: Customer_Notifications_PK                             */
/*==============================================================*/
create unique clustered index Customer_Notifications_PK on Customer_Notifications (
Customer_Notifications ASC
);

/*==============================================================*/
/* Index: get_FK                                                */
/*==============================================================*/
create index get_FK on Customer_Notifications (
customer_userName ASC
);

/*==============================================================*/
/* Table: Heavey_Car                                            */
/*==============================================================*/
create table Heavey_Car 
(
   heaveyCar_number     varchar(15)                    not null,
   user_Name            varchar(20)                    not null,
   brand                varchar(15)                    not null,
   color                varchar(15)                    not null,
   licence              long binary                    not null,
   winsh_x_location     float                          not null,
   y_location3          float                          not null,
   capacity             float                          not null,
   active               smallint                       not null,
   constraint PK_HEAVEY_CAR primary key clustered (heaveyCar_number)
);

/*==============================================================*/
/* Index: Heavey_Car_PK                                         */
/*==============================================================*/
create unique clustered index Heavey_Car_PK on Heavey_Car (
heaveyCar_number ASC
);

/*==============================================================*/
/* Index: Ownes_HeaveyCar2_FK                                   */
/*==============================================================*/
create index Ownes_HeaveyCar2_FK on Heavey_Car (
user_Name ASC
);

/*==============================================================*/
/* Table: Owner                                                 */
/*==============================================================*/
create table Owner 
(
   user_Name            varchar(20)                    not null,
   store_id             integer                        null,
   winsh_id             integer                        null,
   heaveyCar_number     varchar(15)                    null,
   firstName            varchar(10)                    not null,
   lastName             varchar(10)                    not null,
   email                varchar(10)                    not null,
   password             varchar(15)                    not null,
   Identity             long binary                    not null,
   constraint PK_OWNER primary key clustered (user_Name)
);

/*==============================================================*/
/* Index: Owner_PK                                              */
/*==============================================================*/
create unique clustered index Owner_PK on Owner (
user_Name ASC
);

/*==============================================================*/
/* Index: Ownes_FK                                              */
/*==============================================================*/
create index Ownes_FK on Owner (
store_id ASC
);

/*==============================================================*/
/* Index: Ownes_Winsh_FK                                        */
/*==============================================================*/
create index Ownes_Winsh_FK on Owner (
winsh_id ASC
);

/*==============================================================*/
/* Index: Ownes_HeaveyCar_FK                                    */
/*==============================================================*/
create index Ownes_HeaveyCar_FK on Owner (
heaveyCar_number ASC
);

/*==============================================================*/
/* Table: Owner_Notifications                                   */
/*==============================================================*/
create table Owner_Notifications 
(
   content              varchar(50)                    not null,
   "time"               timestamp                      not null,
   read                 smallint                       not null,
   ownerNotifications_id integer                        not null,
   user_Name            varchar(20)                    not null,
   constraint PK_OWNER_NOTIFICATIONS primary key clustered (ownerNotifications_id)
);

/*==============================================================*/
/* Index: Owner_Notifications_PK                                */
/*==============================================================*/
create unique clustered index Owner_Notifications_PK on Owner_Notifications (
ownerNotifications_id ASC
);

/*==============================================================*/
/* Index: GetOwner_FK                                           */
/*==============================================================*/
create index GetOwner_FK on Owner_Notifications (
user_Name ASC
);

/*==============================================================*/
/* Table: Private_Car                                           */
/*==============================================================*/
create table Private_Car 
(
   privateCar_number    varchar(15)                    not null,
   store_id             integer                        not null,
   brand                varchar(15)                    not null,
   color                varchar(15)                    not null,
   licence              long binary                    not null,
   constraint PK_PRIVATE_CAR primary key clustered (privateCar_number)
);

/*==============================================================*/
/* Index: Private_Car_PK                                        */
/*==============================================================*/
create unique clustered index Private_Car_PK on Private_Car (
privateCar_number ASC
);

/*==============================================================*/
/* Index: Contains_FK                                           */
/*==============================================================*/
create index Contains_FK on Private_Car (
store_id ASC
);

/*==============================================================*/
/* Table: Store                                                 */
/*==============================================================*/
create table Store 
(
   name                 varchar(30)                    not null,
   winsh_x_location     float                          not null,
   y_location           float                          not null,
   active               smallint                       not null,
   store_id             integer                        not null,
   user_Name            varchar(20)                    not null,
   constraint PK_STORE primary key clustered (store_id)
);

/*==============================================================*/
/* Index: Store_PK                                              */
/*==============================================================*/
create unique clustered index Store_PK on Store (
store_id ASC
);

/*==============================================================*/
/* Index: Ownes2_FK                                             */
/*==============================================================*/
create index Ownes2_FK on Store (
user_Name ASC
);

/*==============================================================*/
/* Table: Winsh                                                 */
/*==============================================================*/
create table Winsh 
(
   winsh_x_location     float                          not null,
   y_location2          float                          not null,
   maxWiegtht           integer                        not null,
   width                float                          not null,
   licences             long binary                    not null,
   active               smallint                       not null,
   winsh_id             integer                        not null,
   user_Name            varchar(20)                    not null,
   constraint PK_WINSH primary key clustered (winsh_id)
);

/*==============================================================*/
/* Index: Winsh_PK                                              */
/*==============================================================*/
create unique clustered index Winsh_PK on Winsh (
winsh_id ASC
);

/*==============================================================*/
/* Index: Ownes_Winsh2_FK                                       */
/*==============================================================*/
create index Ownes_Winsh2_FK on Winsh (
user_Name ASC
);

alter table Bike
   add constraint FK_BIKE_CONTAINS__STORE foreign key (store_id)
      references Store (store_id)
      on update restrict
      on delete restrict;

alter table Customer
   add constraint FK_CUSTOMER_HAS_CUSTOMER foreign key (customerHistory_id)
      references Customer_History (customerHistory_id)
      on update restrict
      on delete restrict;

alter table Customer_History
   add constraint FK_CUSTOMER_HAS2_CUSTOMER foreign key (customer_userName)
      references Customer (customer_userName)
      on update restrict
      on delete restrict;

alter table Customer_Notifications
   add constraint FK_CUSTOMER_GET_CUSTOMER foreign key (customer_userName)
      references Customer (customer_userName)
      on update restrict
      on delete restrict;

alter table Heavey_Car
   add constraint FK_HEAVEY_C_OWNES_HEA_OWNER foreign key (user_Name)
      references Owner (user_Name)
      on update restrict
      on delete restrict;

alter table Owner
   add constraint FK_OWNER_OWNES_STORE foreign key (store_id)
      references Store (store_id)
      on update restrict
      on delete restrict;

alter table Owner
   add constraint FK_OWNER_OWNES_HEA_HEAVEY_C foreign key (heaveyCar_number)
      references Heavey_Car (heaveyCar_number)
      on update restrict
      on delete restrict;

alter table Owner
   add constraint FK_OWNER_OWNES_WIN_WINSH foreign key (winsh_id)
      references Winsh (winsh_id)
      on update restrict
      on delete restrict;

alter table Owner_Notifications
   add constraint FK_OWNER_NO_GETOWNER_OWNER foreign key (user_Name)
      references Owner (user_Name)
      on update restrict
      on delete restrict;

alter table Private_Car
   add constraint FK_PRIVATE__CONTAINS_STORE foreign key (store_id)
      references Store (store_id)
      on update restrict
      on delete restrict;

alter table Store
   add constraint FK_STORE_OWNES2_OWNER foreign key (user_Name)
      references Owner (user_Name)
      on update restrict
      on delete restrict;

alter table Winsh
   add constraint FK_WINSH_OWNES_WIN_OWNER foreign key (user_Name)
      references Owner (user_Name)
      on update restrict
      on delete restrict;

