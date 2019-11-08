DROP DATABASE IF EXISTS blog;
CREATE DATABASE IF NOT EXISTS blog DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_bin;
USE blog;

CREATE TABLE `blog`.`USERS` ( 
    `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT, 
    `NAME` VARCHAR(64) NOT NULL, 
    PRIMARY KEY (`ID`),
    INDEX  NAME_IND(`NAME`)) ENGINE = INNODB;
        
CREATE TABLE `blog`.`POSTS` ( 
    `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `NAME` VARCHAR(200) NOT NULL,
    `CONTENT` MEDIUMTEXT NOT NULL,
    `USER_ID` INT UNSIGNED NOT NULL,
    FOREIGN KEY (`USER_ID`) REFERENCES `blog`.`USERS`(ID) ON DELETE RESTRICT ON UPDATE RESTRICT,  
    PRIMARY KEY (`ID`),
    UNIQUE (`NAME`),
    INDEX  NAME_IND(`NAME`)) ENGINE = INNODB;
    
CREATE TABLE `blog`.`COMMENTS` (
    `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `CONTENT` TEXT NOT NULL,
    `USER_ID` INT UNSIGNED NOT NUll,
    `POST_ID` INT UNSIGNED NOT NULL,
    FOREIGN KEY (`POST_ID`) REFERENCES `blog`.`POSTS`(`ID`) ON DELETE CASCADE ON UPDATE RESTRICT,
    FOREIGN KEY (`USER_ID`) REFERENCES `blog`.`USERS`(`ID`),
    PRIMARY KEY (`ID`)) ENGINE = INNODB;
   
CREATE TABLE `blog`.`LOGIN_LOG` (
    `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `DATE` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `USER_ID` INT UNSIGNED NOT NUll,
    FOREIGN KEY (`USER_ID`) REFERENCES `blog`.`USERS`(`ID`),
    PRIMARY KEY (`ID`)) ENGINE = INNODB;

-- FILL THE TABLES
-- insert 10 users into USERS
INSERT INTO `USERS` (`ID`, `NAME`) VALUES 
(1, 'user1'), 
(2, 'user2'), 
(3, 'user3'), 
(4, 'user4'), 
(5, 'user5'),
(6, 'user6'),
(7, 'user7'),
(8, 'user8'),
(9, 'user9'),
(10, 'user10');

-- insert posts into POSTS (must change id!!!!)
INSERT INTO `POSTS`(`ID`, `NAME`, `CONTENT`, `USER_ID`) VALUES
(1, 'post1', 'aaaaaaaaaaaaaaaaaaaaaa', 1),
(2, 'post2', 'bbbbbbbbbbbbbbbbbbbbbb', 1),
(3, 'post3', 'cccccccccccccccccccccc', 1),
(4, 'post4', 'dddddddddddddddddddddd', 2),
(5, 'post5', 'eeeeeeeeeeeeeeeeeeeeee', 2),
(6, 'post6', 'ffffffffffffffffffffff', 2),
(7, 'post7', 'gggggggggggggggggggggg', 3),
(8, 'post8', 'hhhhhhhhhhhhhhhhhhhhhh', 3),
(9, 'post9', 'iiiiiiiiiiiiiiiiiiiiii', 4),
(10, 'post10', 'jjjjjjjjjjjjjjjjjjjj', 4),
(11, 'post11', 'kkkkkkkkkkkkkkkkkkkk', 5),
(12, 'post12', 'llllllllllllllllllll', 5),
(13, 'post13', 'mmmmmmmmmmmmmmmmmmmm', 6),
(14, 'post14', 'nnnnnnnnnnnnnnnnnnnn', 7),
(15, 'post15', 'oooooooooooooooooooo', 8);

-- insert comments into COMMENTS 
INSERT INTO `COMMENTS` (`ID`, `CONTENT`, `USER_ID`, `POST_ID`) VALUES 
(NULL, 'blah1blah1', '1', '1'), 
(NULL, 'blah2blah2', '2', '1'), 
(NULL, 'blah3blah3', '3', '1'), 
(NULL, 'blah4blah4', '4', '1'), 
(NULL, 'blah5blah5', '1', '2'), 
(NULL, 'blah6blah6', '2', '2'), 
(NULL, 'blah7blah7', '1', '3'), 
(NULL, 'blah8blah8', '2', '3'), 
(NULL, 'blah9blah9', '3', '3'), 
(NULL, 'blah10blah10', '4', '4'), 
(NULL, 'blah11blah11', '5', '5'), 
(NULL, 'blah12blah12', '6', '5'), 
(NULL, 'blah13blah13', '7', '8'), 
(NULL, 'blah14blah14', '8', '9'), 
(NULL, 'blah15blah15', '10', '9'), 
(NULL, 'blah16blah16', '10', '9'); 

-- insert login timestamp 
INSERT INTO `LOGIN_LOG` (`ID`, `DATE`, `USER_ID`) VALUES 
(NULL, '2019-10-01 14:25:23', '1'), 
(NULL, '2019-10-01 14:25:23', '2'), 
(NULL, '2019-10-01 14:25:23', '3'), 
(NULL, '2019-10-02 14:25:23', '4'), 
(NULL, '2019-10-02 14:25:23', '5'), 
(NULL, '2019-10-02 14:25:23', '1'), 
(NULL, '2019-10-02 14:25:23', '2'), 
(NULL, '2019-10-03 14:25:23', '3'), 
(NULL, '2019-10-04 14:25:23', '4'), 
(NULL, '2019-10-04 14:25:23', '5'), 
(NULL, '2019-10-27 14:25:23', '6'), 
(NULL, '2019-10-28 14:25:23', '7'), 
(NULL, '2019-10-30 14:25:23', '1'), 
(NULL, '2019-10-30 14:25:23', '10'), 
(NULL, '2019-10-30 14:25:23', '3'), 
(NULL, '2019-11-02 14:25:23', '4'), 
(NULL, '2019-11-04 14:25:23', '5'), 
(NULL, '2019-11-06 14:25:23', '6'), 
(NULL, '2019-11-06 14:25:23', '10'),
(NULL, '2019-11-07 14:25:23', '2'), 
(NULL, '2019-11-07 14:25:23', '1'), 
(NULL, '2019-11-08 14:25:23', '9'); 


