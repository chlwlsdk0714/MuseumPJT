-- FAQ (자주 묻는 질문) TB

CREATE TABLE MU_FAQ (
    FAQ_IDX NUMBER(10) PRIMARY KEY,      -- 질문 번호
    FAQ_CATEGORY VARCHAR2(20),           -- 카테고리는 '관람', '교통', '홈페이지', '기타' 총 4가지
    FAQ_QUESTION VARCHAR2(100),          -- 질문
    FAQ_ANSWER CLOB,                     -- 답변
    FAQ_DEL_STATUS VARCHAR2(20)          -- 삭제시 'DEL' 입력
);

CREATE SEQUENCE MU_FAQ_SEQ NOCACHE;      -- 글번호 시퀀스 자동생성


-- MU_FAQ 테이블에 들어갈 데이터 insert문

-- 1)
INSERT INTO MU_FAQ
    (FAQ_IDX, FAQ_CATEGORY, FAQ_QUESTION, FAQ_ANSWER)
VALUES (MU_FAQ_SEQ.NEXTVAL,
    '교통',
    '콜백뮤지엄의 위치 및 교통편을 안내해주세요.',
    '콜백뮤지엄은 서울 경복궁 옆 종로구 삼청동에 위치해 있습니다. 자세한 사항은 오시는 길을 참고하시기 바랍니다.')
;


--------------------------------------------------------------------------------------
-- 2)
INSERT INTO MU_FAQ
    (FAQ_IDX, FAQ_CATEGORY, FAQ_QUESTION, FAQ_ANSWER)
VALUES (MU_FAQ_SEQ.NEXTVAL,
    '교통',
    '주차시설을 안내해주세요.',
    '개별 이용객의 경우 미술관내 주차장을 이용하실 수 있습니다. 그러나 주말 및 공휴일은 미술관 진입도로가 매우 혼잡하며, 주차 공간이 협소하오니 가급적 대중교통을 이용하시거나 대공원 주차장에 주차하신 후 셔틀버스나 코끼리 열차를 이용하시는 것을 추천합니다.')
;


--------------------------------------------------------------------------------------
-- 3)
INSERT INTO MU_FAQ
    (FAQ_IDX, FAQ_CATEGORY, FAQ_QUESTION, FAQ_ANSWER)
VALUES (MU_FAQ_SEQ.NEXTVAL,
    '관람',
    '콜백뮤지엄의 전시 관람료는 얼마인가요?',
    '전시 관람료는 다음과 같습니다.

- 상설전시 : 통합관람권 5,000원
- 기획전시 : 전시별 상이, 각 전시별 안내 페이지 참고
- 할인 및 무료관람 대상은 관람안내 메뉴를 참고하시기 바랍니다.')
;


--------------------------------------------------------------------------------------
-- 4)
INSERT INTO MU_FAQ
    (FAQ_IDX, FAQ_CATEGORY, FAQ_QUESTION, FAQ_ANSWER)
VALUES (MU_FAQ_SEQ.NEXTVAL,
    '관람',
    '관람시간 및 휴관일은 어떻게 됩니까?',
    '관람가능 시간은 다음과 같습니다.

- 화, 목, 금, 일요일 (월요일 휴관) : 10:00 ~ 18:00
- 수, 토요일 : 18:00 ~ 21:00 (야간개장)')
;


--------------------------------------------------------------------------------------
-- 5)
INSERT INTO MU_FAQ
    (FAQ_IDX, FAQ_CATEGORY, FAQ_QUESTION, FAQ_ANSWER)
VALUES (MU_FAQ_SEQ.NEXTVAL,
    '관람',
    '단체관람을 가고 싶습니다. 신청을 어떻게 해야 하나요?',
    '현재 코로나로 단체 예약이 불가능합니다.')
;


--------------------------------------------------------------------------------------
-- 6)
INSERT INTO MU_FAQ
    (FAQ_IDX, FAQ_CATEGORY, FAQ_QUESTION, FAQ_ANSWER)
VALUES (MU_FAQ_SEQ.NEXTVAL,
    '관람',
    '전시실의 작품 촬영이 가능하나요?',
    '작품이 전시되어 있는 전시장 내부에서는 삼각대 및 플래시를 사용한 사진촬영이 불가능합니다. 다만, 언론사의 보도 및 공공기관의 공익사업, 교육기관의 학술적인 연구를 목적으로 한 촬영은 가능합니다. 
사진 촬영을 원하실 경우 촬영 5일 전까지 촬영목적, 일시, 촬영장소, 촬영내용, 촬영인원 등을 기재한 촬영신청서와 촬영각서를 FAX(02-2188-6123)로 보낸 후 구체적 촬영계획을 협의(행정지원과 02-2188-6025)하시기 바랍니다.')
;


--------------------------------------------------------------------------------------
-- 7)
INSERT INTO MU_FAQ
    (FAQ_IDX, FAQ_CATEGORY, FAQ_QUESTION, FAQ_ANSWER)
VALUES (MU_FAQ_SEQ.NEXTVAL,
    '관람',
    '전시 관람을 하려면 사전 예약을 해야 하나요?',
    '코로나바이러스감염증-19 확산 예방을 위하여 콜백뮤지엄은 온라인 사전 예약으로만 관람이 가능합니다. 예약하신 시간 이외 시간에는 전시장 입장이 어려우며, 예약없이 방문하신 분들이나 예약자 이외 추가 인원의 현장 발권은불가 합니다. 사전예약에 대한 자세한 내용은 각 관별 페이지를 참고 부탁드립니다.')
;


--------------------------------------------------------------------------------------
-- 8)
INSERT INTO MU_FAQ
    (FAQ_IDX, FAQ_CATEGORY, FAQ_QUESTION, FAQ_ANSWER)
VALUES (MU_FAQ_SEQ.NEXTVAL,
    '관람',
    '지정한 날짜 이외에 다른 날짜에 발권이 가능한가요?',
    '예매 시 지정한 날짜 및 시간에만 티켓 수령 및 관람 가능합니다. 지정한 날짜 및 시간에 방문 바랍니다.')
;


--------------------------------------------------------------------------------------
-- 9)
INSERT INTO MU_FAQ
    (FAQ_IDX, FAQ_CATEGORY, FAQ_QUESTION, FAQ_ANSWER)
VALUES (MU_FAQ_SEQ.NEXTVAL,
    '관람',
    '예약한 시간에만 입장이 가능한가요?',
    '콜백뮤지엄은 전시장 내 외부에서 최대 2m거리 유지를 위하여 시간별 사전 예약제를 진행합니다. 이에 따라, 지정하신 시간 이외 시간에는 입장이 불가합니다.

티켓 발권은 예약시간 10분전부터 가능하오니 방문에 참고 부탁드리겠습니다.')
;


--------------------------------------------------------------------------------------
-- 10)
INSERT INTO MU_FAQ
    (FAQ_IDX, FAQ_CATEGORY, FAQ_QUESTION, FAQ_ANSWER)
VALUES (MU_FAQ_SEQ.NEXTVAL,
    '카테',
    '',
    '')
;


--------------------------------------------------------------------------------------
-- 11)
INSERT INTO MU_FAQ
    (FAQ_IDX, FAQ_CATEGORY, FAQ_QUESTION, FAQ_ANSWER)
VALUES (MU_FAQ_SEQ.NEXTVAL,
    '카테',
    '',
    '')
;


--------------------------------------------------------------------------------------
-- 12)
INSERT INTO MU_FAQ
    (FAQ_IDX, FAQ_CATEGORY, FAQ_QUESTION, FAQ_ANSWER)
VALUES (MU_FAQ_SEQ.NEXTVAL,
    '카테',
    '',
    '')
;


--------------------------------------------------------------------------------------
-- 13)
INSERT INTO MU_FAQ
    (FAQ_IDX, FAQ_CATEGORY, FAQ_QUESTION, FAQ_ANSWER)
VALUES (MU_FAQ_SEQ.NEXTVAL,
    '카테',
    '',
    '')
;

