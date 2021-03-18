-----회원정보-----

CREATE TABLE MU_MEMBER (
    MEM_ID VARCHAR2(50) PRIMARY KEY,        --고객ID*
    MEM_PWD VARCHAR2(50) NOT NULL,       --비밀번호*
    MEM_NAME VARCHAR2(50) NOT NULL,         --이름*
    MEM_SEX VARCHAR2(50) NOT NULL,          --성별*
    MEM_PHONE VARCHAR2(50),                 --연락처
    MEM_CELLPHONE VARCHAR2(50) NOT NULL,    --휴대전화*
    MEM_EMAIL VARCHAR2(50),                 --이메일
    MEM_ADDR VARCHAR2(100),                  --주소
	MEM_JOIN_STATUS VARCHAR2(20)             --가입/탈퇴 상태 코드로
);