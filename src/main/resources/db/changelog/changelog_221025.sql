create table if not exists organization
(
    id uuid primary key,
    name varchar(100) ,
    inn varchar(12) ,
    kpp varchar(9) ,
    ogrn varchar(15)
);

create table if not exists doctor
(
    id uuid primary key,
    name varchar(100),
    organization_id uuid
);

create table if not exists customer
(
    id uuid primary key,
    name varchar(100),
    date_birth date,
    gender varchar(3),
    created_at timestamp,
    deleted_at timestamp
);

create table if not exists doctors_patients
(
    id uuid primary key,
    customer_id uuid,
    doctor_id uuid
);

create table if not exists assignment
(
    id uuid primary key,
    doctor_id uuid,
    customer_id uuid,
    medicine_id uuid,
    quantity real,
    timing varchar(50),
    date_start date,
    date_end date
);

create table if not exists medicine
(
    id uuid primary key,
    medicine_name_short varchar(100),
    medicine_name_full varchar(200),
    quantity real,
    qtty_measurement varchar(30),
    amount integer,
    link varchar(300),
    created_at timestamp,
    deleted_at timestamp
);

create table if not exists condition
(
    id uuid primary key,
    customer_id uuid,
    date_condition date,
    daytime varchar(30),
    weight real,
    note varchar(500)
);

create table if not exists test
(
    id uuid primary key,
    customer_id uuid,
    date_test date,
    name_test varchar(150),
    result real,
    result_measurement varchar(30),
    created_at timestamp
);

create table if not exists appointment
(
    id uuid primary key,
    doctor_id uuid,
    customer_id uuid,
    date_appointment date,
    note varchar(500)
);

comment on table organization is 'Таблица, содержащая данные организаций, подключенных к системе';

comment on column organization.name is 'наименование организации';
comment on column organization.inn is 'ИНН организации';
comment on column organization.kpp is 'КПП организации';
comment on column organization.ogrn is 'ОГРН/ОГРНИП';

comment on table doctor is 'Список врачей, ведущих пациентов в системе';

comment on column doctor.name is 'Имя лечащего врача';
comment on column doctor.organization_id is 'ID компании лечащего врача';

comment on table customer is 'Список поциентов, подключенных к системе';

comment on column customer.name is 'ФИО пациента';
comment on column customer.date_birth is 'Дата рождения пациента';
comment on column customer.gender is 'Пол Муж/Жен';
comment on column customer.created_at is 'дата создания записи';
comment on column customer.deleted_at is 'дата удаления записи';

comment on table assignment is 'Таблица назначений пациентам';

comment on column assignment.doctor_id is 'ID врача, сделавшего назначение';
comment on column assignment.customer_id is 'ID пациента, которому сделано назначение';
comment on column assignment.medicine_id is 'ID лекарства, которое необходимо принимать';
comment on column assignment.quantity is 'Количество препарата, которые необходимо принимать';
comment on column assignment.timing is 'Утро/День/Вечер + До/После/Во время еды';
comment on column assignment.date_start is 'дата начала приема препарата';
comment on column assignment.date_end is 'дата окончания приема препарата';

comment on table medicine is 'таблица доступных к назначению медикаментов и БАДов';

comment on column medicine.medicine_name_short is 'Короткое название лекарства';
comment on column medicine.medicine_name_full is 'полное наименование лекарства';
comment on column medicine.quantity is 'количество препарата в 1 дозе';
comment on column medicine.qtty_measurement is 'единицы измерения доз препарата';
comment on column medicine.amount is 'количество указанных в поле quantity доз в упаковке';
comment on column medicine.link is 'ссылка на препарат';
comment on column medicine.created_at is 'дата внесения препарата в систему';
comment on column medicine.deleted_at is 'дата удаления препарата из системы';

comment on table condition is 'таблица передаваемых пациентов комментариев и веса в разные периоды дня';

comment on column condition.customer_id is 'ID клиента';
comment on column condition.date_condition is 'дата заполнения';
comment on column condition.daytime is 'Утро/День/Вечер';
comment on column condition.weight is 'Вес в кг';
comment on column condition.note is 'комментарий пациента';

comment on table test is 'Таблица с данными по анализам пациентов';

comment on column test.customer_id is 'ID пациента';
comment on column test.date_test is 'дата теста';
comment on column test.name_test is 'Наименование теста';
comment on column test.result is 'Результаты анализа';
comment on column test.result_measurement is 'Единицы измерения анализа';
comment on column test.created_at is 'дата создания записи';

comment on table appointment is 'Таблица проведенных приемов с комментариями';

comment on column appointment.doctor_id is 'ID врача';
comment on column appointment.customer_id is 'ID пациента';
comment on column appointment.date_appointment is 'дата приема';
comment on column appointment.note is 'комментарий врача';