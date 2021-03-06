CREATE TABLE TAGS(ID VARCHAR(50) PRIMARY KEY, TAG TEXT UNIQUE, TYPE INTEGER DEFAULT 1)
CREATE TABLE PAGES(ID VARCHAR(50) PRIMARY KEY, PATH TEXT UNIQUE, TITLE TEXT, LOGO TEXT, SUMMARY TEXT, LASTMODIFIED BIGINT, DATECREATED BIGINT, HITCOUNT INTEGER DEFAULT 0, COMMENTCOUNT INTEGER DEFAULT 0, LIKECOUNT INTEGER DEFAULT 0, SUPERRECOMMEND TEXT DEFAULT NULL)
CREATE TABLE COMMENTS(ID VARCHAR(50) PRIMARY KEY, PAGE_ID VARCHAR(50), USER_ID TEXT, COMMENT CLOB, POSTTIME BIGINT)
CREATE TABLE LIKES(ID VARCHAR(50) PRIMARY KEY, PAGE_ID VARCHAR(50), USER_ID TEXT, COMMENT CLOB, POSTTIME BIGINT)
CREATE TABLE PAGE_TAGS(ID VARCHAR(50) PRIMARY KEY, PAGE_ID VARCHAR(50), TAG_ID VARCHAR(50))
CREATE UNIQUE INDEX IDX_TAGS_TAG ON TAGS(TAG)
CREATE UNIQUE INDEX IDX_TAGS_ID_TYPE ON TAGS(ID, TYPE)
CREATE UNIQUE INDEX IDX_PAGES_PATH ON PAGES(PATH)
CREATE INDEX IDX_PAGES_HITCOUNT ON PAGES(HITCOUNT DESC)
CREATE INDEX IDX_PAGES_COMMENTCOUNT ON PAGES(COMMENTCOUNT DESC)
CREATE INDEX IDX_PAGES_LIKECOUNT ON PAGES(LIKECOUNT DESC)
CREATE INDEX IDX_PAGES_TITLE ON PAGES(TITLE ASC)
CREATE INDEX IDX_PAGES_LASTMODIFIED ON PAGES(LASTMODIFIED DESC)
CREATE INDEX IDX_PAGES_DATECREATED ON PAGES(DATECREATED DESC)
CREATE UNIQUE INDEX IDX_PAGES_ID_WITH_COUNT ON PAGES(ID, LASTMODIFIED, HITCOUNT, COMMENTCOUNT, LIKECOUNT)
CREATE INDEX IDX_COMMENTS_PAGEID ON COMMENTS(PAGE_ID, POSTTIME DESC)
CREATE INDEX IDX_LIKES_PAGEID ON LIKES(PAGE_ID, POSTTIME DESC)
CREATE INDEX IDX_LIKES_PAGEID_USERID ON LIKES(PAGE_ID, USER_ID, POSTTIME DESC)
CREATE INDEX IDX_PAGETAGS_PAGEID ON PAGE_TAGS(PAGE_ID)