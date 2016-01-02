update defaults set fldvalue = '2.8.10' where fldname = 'version';

ALTER TABLE address
	DROP CONSTRAINT address_pkey;

ALTER TABLE employee
	DROP CONSTRAINT employee_pkey;

DROP TABLE acsrole;

DROP TABLE deduct;

DROP TABLE deduction;

DROP TABLE deductionrate;

DROP TABLE employeededuction;

DROP TABLE employeewage;

DROP TABLE generic_import;

DROP TABLE parts_alt;

DROP TABLE pay_trans;

DROP TABLE payrate;

DROP TABLE reference;

DROP TABLE wage;

DROP SEQUENCE generic_import_id_seq;

ALTER TABLE acc_trans
	ADD COLUMN tax text,
	ADD COLUMN taxamount double precision;

ALTER TABLE address
	ALTER COLUMN address1 TYPE character varying(64) /* TYPE change - table: address original: character varying(32) new: character varying(64) */,
	ALTER COLUMN address2 TYPE character varying(64) /* TYPE change - table: address original: character varying(32) new: character varying(64) */,
	ALTER COLUMN city TYPE character varying(64) /* TYPE change - table: address original: character varying(32) new: character varying(64) */,
	ALTER COLUMN zipcode TYPE character varying(32) /* TYPE change - table: address original: character varying(10) new: character varying(32) */;

ALTER TABLE ap
	ADD COLUMN fxamount double precision DEFAULT 0,
	ADD COLUMN fxpaid double precision DEFAULT 0;

ALTER TABLE ar
	ADD COLUMN fxamount double precision DEFAULT 0,
	ADD COLUMN fxpaid double precision DEFAULT 0;

ALTER TABLE bank
	DROP COLUMN clearingnumber;

ALTER TABLE chart
	ADD COLUMN allow_gl boolean DEFAULT true,
	ADD COLUMN symbol_link character varying(128);

ALTER TABLE curr
	DROP COLUMN prec,
	ADD COLUMN "precision" smallint,
	ALTER COLUMN rn TYPE integer /* TYPE change - table: curr original: smallint new: integer */;

ALTER TABLE customer
	ADD COLUMN iban character varying(34),
	ADD COLUMN bic character varying(11);

ALTER TABLE employee
	DROP COLUMN homemobile,
	DROP COLUMN payperiod,
	DROP COLUMN apid,
	DROP COLUMN paymentid,
	DROP COLUMN paymentmethod_id,
	DROP COLUMN acsrole_id,
	DROP COLUMN acs,
	DROP COLUMN department_id,
	DROP COLUMN warehouse_id,
	ADD COLUMN address1 character varying(64),
	ADD COLUMN address2 character varying(64),
	ADD COLUMN city character varying(64),
	ADD COLUMN "state" character varying(32),
	ADD COLUMN zipcode character varying(32),
	ADD COLUMN country character varying(32),
	ADD COLUMN "role" character varying(20),
	ADD COLUMN iban character varying(34),
	ADD COLUMN bic character varying(11),
	ADD COLUMN managerid integer,
	ALTER COLUMN id DROP NOT NULL;

ALTER TABLE exchangerate
	DROP COLUMN exchangerate,
	ADD COLUMN buy double precision,
	ADD COLUMN sell double precision;

ALTER TABLE parts
	DROP COLUMN pos;

ALTER TABLE partsgroup
	DROP COLUMN code,
	DROP COLUMN image;

ALTER TABLE paymentmethod
	DROP COLUMN roundchange;

ALTER TABLE shipto
	ALTER COLUMN shiptoaddress1 TYPE character varying(64) /* TYPE change - table: shipto original: character varying(32) new: character varying(64) */,
	ALTER COLUMN shiptoaddress2 TYPE character varying(64) /* TYPE change - table: shipto original: character varying(32) new: character varying(64) */,
	ALTER COLUMN shiptocity TYPE character varying(64) /* TYPE change - table: shipto original: character varying(32) new: character varying(64) */,
	ALTER COLUMN shiptozipcode TYPE character varying(32) /* TYPE change - table: shipto original: character varying(10) new: character varying(32) */;

ALTER TABLE vendor
	ADD COLUMN iban character varying(34),
	ADD COLUMN bic character varying(11);

CREATE INDEX employee_id_key ON employee USING btree (id);
