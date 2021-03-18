-- 관람후기게시판 댓글 TB

CREATE TABLE MU_REV_COMMENT (
    RCOM_IDX NUMBER(10) PRIMARY KEY,    -- 댓글 번호
    RCOM_WRITER VARCHAR2(50),           -- 글쓴이 아이디
    RCOM_CONTENT CLOB,                  -- 내용
    RCOM_WRITE_DATE DATE,               -- 작성일   
    RCOM_IP VARCHAR2(15),				-- 아이피주소 
    REV_IDX NUMBER(10),					-- 댓글 달 원 게시글 번호 
    CONSTRAINT REV_COMMENT_T_TK 
    FOREIGN KEY (REV_IDX) REFERENCES MU_REVIEW(REV_IDX)
);    
    
 
CREATE SEQUENCE MU_RCOM_SEQ NOCACHE;    -- 글번호 시퀀스 자동생성



-- MU_REV_COMMENT 테이블에 들어갈 데이터 insert문

-- 1)
INSERT INTO MU_REV_COMMENT
    (   RCOM_IDX,
		RCOM_WRITER, 
		RCOM_CONTENT, 
		RCOM_WRITE_DATE, 
		REV_IDX
    )
VALUES 
    (   MU_RCOM_SEQ.NEXTVAL,
        'admin',
        '전시가 만족스러우셨다니 기쁩니다. 콜백뮤지엄에서는 누구나 문화예술에 가깝고 친근하게 다가갈 수 있도록 신중하게 도슨트 섭외과정을 거칩니다. 앞으로도 더 좋은 서비스로 찾아뵙겠습니다. 감사합니다.',
        '2018-01-10',
        1
    )
;