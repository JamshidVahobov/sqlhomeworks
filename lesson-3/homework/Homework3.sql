create database forlesson4
use ForLesson4
select * from sys.tables
EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'
go
EXEC sp_MSforeachtable 'DROP TABLE ?'
CREATE TABLE iam_roles (db_id INT PRIMARY KEY,id INT NOT NULL,name NVARCHAR(50) NOT NULL,type NVARCHAR(50),actions NVARCHAR(MAX));
CREATE TABLE iam_policies (db_id INT PRIMARY KEY,id INT NOT NULL,name NVARCHAR(50) NOT NULL,type NVARCHAR(50));
CREATE TABLE iam_members (db_id INT PRIMARY KEY,name NVARCHAR(50) NOT NULL);
CREATE TABLE iam_policy_members (member_id INT NOT NULL,policy_id INT NOT NULL,FOREIGN KEY (member_id) REFERENCES iam_members(db_id),FOREIGN KEY (policy_id) REFERENCES iam_policies(db_id));
CREATE TABLE iam_projects (db_id INT PRIMARY KEY,id INT NOT NULL,name NVARCHAR(50) NOT NULL,type NVARCHAR(50));
CREATE TABLE iam_statements (db_id INT PRIMARY KEY,effect NVARCHAR(50) NOT NULL,actions NVARCHAR(MAX),resources NVARCHAR(MAX),policy_id INT,role_id INT,FOREIGN KEY (policy_id) REFERENCES iam_policies(db_id),FOREIGN KEY (role_id) REFERENCES iam_roles(db_id));
CREATE TABLE iam_role_projects (role_id INT NOT NULL,project_id INT NOT NULL,FOREIGN KEY (role_id) REFERENCES iam_roles(db_id),FOREIGN KEY (project_id) REFERENCES iam_projects(db_id));
CREATE TABLE iam_statement_projects (project_id INT NOT NULL,statement_id INT NOT NULL,FOREIGN KEY (project_id) REFERENCES iam_projects(db_id),FOREIGN KEY (statement_id) REFERENCES iam_statements(db_id));
CREATE TABLE iam_policy_projects (policy_id INT NOT NULL,project_id INT NOT NULL,FOREIGN KEY (policy_id) REFERENCES iam_policies(db_id),FOREIGN KEY (project_id) REFERENCES iam_projects(db_id));
CREATE TABLE iam_project_rules (db_id INT PRIMARY KEY,id INT NOT NULL,name NVARCHAR(50) NOT NULL,type NVARCHAR(50),project_id INT,FOREIGN KEY (project_id) REFERENCES iam_projects(db_id));
CREATE TABLE iam_staged_project_rules (db_id INT PRIMARY KEY,name NVARCHAR(50) NOT NULL,type NVARCHAR(50),deleted BIT NOT NULL,project_id INT,FOREIGN KEY (project_id) REFERENCES iam_projects(db_id));
CREATE TABLE iam_projects_graveyard (db_id INT PRIMARY KEY,id INT NOT NULL);
CREATE TABLE iam_rule_conditions (db_id INT PRIMARY KEY,rule_db_id INT NOT NULL,value NVARCHAR(50),attribute NVARCHAR(50),operator NVARCHAR(50),FOREIGN KEY (rule_db_id) REFERENCES iam_project_rules(db_id));
CREATE TABLE iam_staged_rule_conditions (db_id INT PRIMARY KEY,rule_db_id INT NOT NULL,value NVARCHAR(50),attribute NVARCHAR(50),operator NVARCHAR(50),FOREIGN KEY (rule_db_id) REFERENCES iam_staged_project_rules(db_id));



---------------------------------------------------------------------------------------
CREATE TABLE F (fullname NVARCHAR(MAX),raw_address NVARCHAR(MAX),address AS COALESCE(NULLIF(TRIM(raw_address), ''), 'Tashkent'));
INSERT INTO F (fullname, raw_address) VALUES ('John Bitter', '      ');
INSERT INTO F (fullname, raw_address) VALUES ('Jane Doe', NULL);
INSERT INTO F (fullname, raw_address) VALUES ('Mark Smith', 'Samarkand');
SELECT * FROM F;