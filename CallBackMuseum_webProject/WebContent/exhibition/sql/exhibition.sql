--CREATE TABLE MU_EXHIBITION (
--    EXHIB_IDX NUMBER(10) PRIMARY KEY,      -- 전시 번호
--    EXHIB_SUBJECT VARCHAR2(100) NOT NULL,  -- 전시 제목
--    EXHIB_PERIOD_START DATE,               -- 전시 시작일
--    EXHIB_PERIOD_END DATE,                 -- 전시 종료일
--    EXHIB_VENUE VARCHAR(100),              -- 전시 장소(B1, 1F, 2F, GALLERY4 등등)
--    EXHIB_ARTIST VARCHAR2(300),            -- 작가 (협업 작가들 포함)
--    EXHIB_ARTWORKS_CNT VARCHAR2(300),      -- 전시작품수
--    EXHIB_ADMISSION VARCHAR2(100),         -- 관람료
--    EXHIB_ORGANIZATION VARCHAR2(100),      -- 후원(주최)기관
--    EXHIB_CONTENT CLOB,                    -- 전시 내용 설명
--    EXHIB_THUMB_PATH VARCHAR2(30)          -- 전시 이미지 파일 주소
--);

--최종 테이블
CREATE TABLE "MUSEUM"."MU_EXHIBITION" 
   ("EXHIB_IDX" NUMBER(30,0), 
   "EXHIB_SUBJECT" VARCHAR2(300 BYTE) NOT NULL ENABLE, 
   "EXHIB_PERIOD_START" DATE, 
   "EXHIB_PERIOD_END" DATE, 
   "EXHIB_VENUE" VARCHAR2(100 BYTE), 
   "EXHIB_ARTIST" VARCHAR2(3000 BYTE), 
   "EXHIB_ARTWORKS_CNT" VARCHAR2(300 BYTE), 
   "EXHIB_ADMISSION" VARCHAR2(300 BYTE), 
   "EXHIB_ORGANIZATION" VARCHAR2(1000 BYTE), 
   "EXHIB_CONTENT" CLOB, 
   "EXHIB_THUMB_PATH" VARCHAR2(500 BYTE)
   ); 

CREATE SEQUENCE EXHIB_SEQ INCREMENT BY 1 START WITH 1 NOCACHE;

-- 현재 전시 검색
SELECT COUNT(EXHIB_IDX) 
FROM MU_EXHIBITION
WHERE EXHIB_PERIOD_START <= SYSDATE AND exhib_period_end >= SYSDATE
ORDER BY EXHIB_PERIOD_START DESC


-- rownum 불러오기

select ee.*
from (
    select rownum RN, e.*
    from (
        select *
        from mu_exhibition
        WHERE EXHIB_PERIOD_START <= SYSDATE AND exhib_period_end >= SYSDATE
        order by exhib_period_start desc
        ) e        
    ) ee
where RN between 1 and 3

--예정전시
INSERT INTO MU_EXHIBITION 
(EXHIB_IDX, EXHIB_SUBJECT, EXHIB_PERIOD_START,EXHIB_PERIOD_END, 
EXHIB_VENUE, EXHIB_ARTIST, EXHIB_ARTWORKS_CNT, EXHIB_ADMISSION, 
EXHIB_ORGANIZATION, EXHIB_CONTENT, EXHIB_THUMB_PATH
)
VALUES(EXHIB_SEQ.NEXTVAL, '해외소장품걸작전 《빛: 테이트미술관 소장품전》','2021-12-21', '2022-05-08',
'콜백뮤지엄', '윌리엄 터너, 존 컨스터블, 윌리엄 블레이크, 클로드 모네, 제임스 터렐, 아니쉬 카푸어, 올라퍼 엘리아슨 등', NULL,
NULL, NULL, '서양 근현대미술사를 관통해 온 빛을 주제로 한 영국 테이트미술관 소장품 기획전이다. 2020년과 2021년 미술관 기관의제인 수집과 배움을 연결하여 
시대별 작가들의 빛에 대한 질문과 인식이 어떻게 작품으로 형상화되었는지 오늘날의 시각에서 새롭게 고찰해 보고자 한다. 
서양 근･현대미술사를 대표하는 작가들의 작품을 통해 빛의 광학적, 색채학적, 미학적 변주를 따라가 본다.
에밀리 프링글(Emily Pringle, 테이트미술관 연구부서 책임자)이 강조하듯 ‘연구자-예술가-학습자’의 각 주체는 상호 연결되어 있으며 
‘질문하기, 아이디어 개선, 새롭게 통찰하기’라는 공통점을 취한다. 이러한 특징에 주목하여 관람객이 연구-작품제작-창의적 학습 사이의 경계를 넘나들며 미술관에서 
새로운 통찰과 아이디어를 탐구하고, 고찰하고, 창조할 수 있도록 전시와 프로그램을 설계한다.',NULL
);

INSERT INTO MU_EXHIBITION 
(EXHIB_IDX, EXHIB_SUBJECT, EXHIB_PERIOD_START,EXHIB_PERIOD_END, 
EXHIB_VENUE, EXHIB_ARTIST, EXHIB_ARTWORKS_CNT, EXHIB_ADMISSION, 
EXHIB_ORGANIZATION, EXHIB_CONTENT, EXHIB_THUMB_PATH
)
VALUES(EXHIB_SEQ.NEXTVAL,'송상희 - 자연스러운 인간》', '2021-12-14', '2022-02-27',
'콜백뮤지엄', '송상희', NULL, NULL, NULL,
'현대 사회의 모순에 대해 다양한 미디어를 작품 세계에 수용하여 섬세한 서사 구조로 풀어내는 자신만의 시각어법을 구축해 온 송상희 작가의 개인전이다. 
본 전시에서는 미술관 커미션 작업 6점을 소개하며, 신자유주의라는 무한 경쟁 세상에 처한 인간에 대해 선과 악, 자아와 비자아, 같음과 다름 같은 일견 분명해 보이지만 
복잡하고 미묘한 기준을 드리워 다면적인 세계와 인간 본성을 미적으로 탐색한다. 특히〈사물의 세계〉(2021)는 다양한 촬영기기와 정보 전달 매체기법을 활용한 태블릿 영상과 
전시장 내 오브제가 어우러져 참여자와 상호 영향적인 관계를 형성함으로써 재구성되며, 이는 미디어 간 경계를 초월한 예술적 메시지와 관람객이 능동적으로 소통할 수 있는 기회를 
제공한다. 미디어 유토피아의 이음새 없는 세계에 대한 작가의 메타적 해석이 돋보이는 개인전이다.',NULL
);

--2021 현재전시
INSERT INTO MU_EXHIBITION 
(EXHIB_IDX, EXHIB_SUBJECT, EXHIB_PERIOD_START,EXHIB_PERIOD_END, 
EXHIB_VENUE, EXHIB_ARTIST, EXHIB_ARTWORKS_CNT, EXHIB_ADMISSION, 
EXHIB_ORGANIZATION, EXHIB_CONTENT, EXHIB_THUMB_PATH
)
VALUES(EXHIB_SEQ.NEXTVAL,'《나는, 선언한다》', '2021-12-14', '2022-03-06', '콜백뮤지엄', '오세아니아 지역을 기반에 두고 활동하는 15명 내외 작가',
NULL, NULL, NULL, '2014년부터 지속된 콜백뮤지엄 ‘비서구권 전시 프로젝트’는 서구 중심의 동시대 미술 지형을 재편하여 다양한 지역 미술을 연달아 소개해 왔다. 
아프리카, 라틴아메리카, 중동에 이어 아시아 퍼시픽 지역의 주요한 축인 오세아니아 지역의 현대미술을 조망한다. ‘선언’이 갖는 이중적인 의미를 통해 오세아니아 
식민의 역사와 호주 현대 사회를 구성하고 있는 다양한 문화와 정체성의 이슈를 검토할 예정이다. 코로나19 확산 이후 국제전인 만큼 물리적 이동의 제약을 기획 조건으로 삼아 
다양한 방식의 온라인 소통과 프로덕션 방식을 함께 고민하여, 전시 속에서 다채로운 온·오프라인의 결과물로 펼쳐질 예정이다.', NULL);

INSERT INTO MU_EXHIBITION 
(EXHIB_IDX, EXHIB_SUBJECT, EXHIB_PERIOD_START,EXHIB_PERIOD_END, 
EXHIB_VENUE, EXHIB_ARTIST, EXHIB_ARTWORKS_CNT, EXHIB_ADMISSION, 
EXHIB_ORGANIZATION, EXHIB_CONTENT, EXHIB_THUMB_PATH
)
VALUES(EXHIB_SEQ.NEXTVAL, '《매일 매일 드로잉》', '2021-10-05', '2022-04-30', '콜백뮤지엄', '이수경',
NULL, NULL, NULL, '콜백뮤지엄의 어린이 갤러리는 동시대 미술 작가의 작업을 통해 어린이 관람객의 상상력을 확대하고 시각예술 언어를 이해할 수 있는 매개 프로그램을 개발해 왔다. 
올해의 초대 작가 이수경은 국립현대미술관 2012 올해의 작가상 후보, 2017년 베니스비엔날레 본 전시 참가 등 회화, 조각, 설치, 영상, 드로잉, 퍼포먼스 분야에서 활발한 작품 활동을 이어가고 있다. 
이번 전시에서는 꿈, 무의식, 다른 차원의 풍경 등을 다룬 작가의 회화・조각 작품을 토대로 영상, 공연예술, VR 등으로 다변화하는 작가의 작업 형태에 주목한다. 2005년부터 지속해 온 
매일 드로잉은 이수경의 작업 근간을 이해하는 데 핵심적인 연작으로, 
이 전시에서는 드로잉을 중심으로 작가가 구축한 창작 세계를 이해하고 어린이들이 스스로 드로잉을 통해 자신을 표현할 수 있도록 확장형 참여 프로그램을 마련할 예정이다.', NULL);

INSERT INTO MU_EXHIBITION 
(EXHIB_IDX, EXHIB_SUBJECT, EXHIB_PERIOD_START,EXHIB_PERIOD_END, 
EXHIB_VENUE, EXHIB_ARTIST, EXHIB_ARTWORKS_CNT, EXHIB_ADMISSION, 
EXHIB_ORGANIZATION, EXHIB_CONTENT, EXHIB_THUMB_PATH
)
VALUES(EXHIB_SEQ.NEXTVAL, '배헤윰 개인전 <Fyka Foretold...>(예지하는 파이카)', '2021-02-02', '2021-03-07','콜백뮤지엄',
'배헤윰', NULL, NULL, NULL, '콜백뮤지엄 B공간에서 개최되는 배헤윰 작가의《Fyka Foretold...》(예지하는 파이카)는 과거 영화산업에서 
사건의 배경을 사실적으로 재현하여 현실감을 높이려는 목적으로 제작되던 ‘가짜 배경 그림(매트 페인팅)’의 양식을 빌려 재현 회화의 관습적인 역할의 전복을 시도한다.
본 전시에서는 허구의 인물 파이카(Fyka)가 현재의 대기질을 본인만의 방식으로 예언한 내용이 회화와 설치로서 펼쳐진다. 작가는 대도시의 미세먼지를 견뎌 내는 일상의 경험과 대비되는 
맑은 하늘을 허구적 이미지로서 제시한다. 작가는 회화가 서사를 전하는 도구로서 쓰일 때와, 이에서 벗어나 고유의 매체성을 드러낼 때 표출되는 양가성에 주목한다. 
특히 재현 회화에서 허구적 서사를 그려내는 ‘화가’의 전통적인 역할을 재고하고, 회화 속 도상과 현실의 대상간의 관습적인 고리를 끊고자 시도한다. 그는 이로부터 
새로운 서사 형식을 탐구하며 회화적 실천의 방식 다각화를 모색하고 있다.', NULL);

--과거전시
--2020
INSERT INTO MU_EXHIBITION 
(EXHIB_IDX, EXHIB_SUBJECT, EXHIB_PERIOD_START, EXHIB_PERIOD_END, 
EXHIB_VENUE, EXHIB_ARTIST, EXHIB_ARTWORKS_CNT, EXHIB_ADMISSION, 
EXHIB_ORGANIZATION, EXHIB_CONTENT, EXHIB_THUMB_PATH
)
VALUES(EXHIB_SEQ.NEXTVAL, '2020 서울사진축제 《카메라당 전성시대》', '2020-07-14', '2020-08-16', '콜백뮤지엄',
'김테레사, 김한용, 문선호, 박상윤, 배상하, 손재석, 이경모, 이병삼, 이순흥, 이은주, 임응식,조현두, 최민식, 한영수, 홍순태, 황규태',
NULL, NULL, NULL, '《서울사진축제》에서는 2019년부터 연속 기획 전시로 한국사진사를 정리하고 새롭게 조명하는 작업을 진행하고 있다. 
지난 해 1950년대 한국사진의 지형을 살펴본 《명동싸롱과 1950년대 카메라당》에 이어, 올해는 《카메라당 전성시대: 작가의 탄생과 공모전 연대기》라는 
제목으로 1910년대부터 《대한민국미술전람회》(국전)가 폐지된 1981년 사이에 개최된 사진 공모전을 주제로 한국사진사를 정리한다.공모전은 사진가가 데뷔하고 
활동하는 무대로서 한국 사진제도의 중요한 한 축을 담당해왔다. 따라서 이번 전시에서는 일제강점기부터 시작된 공모전의 역사를 조망하면서, 
1960년대 대표적인 관전과 
민전인 《대한민국미술전람회》(사진부문, 1964년 신설)와 《동아사진콘테스트》(1963년 개설)의 경쟁관계와, 
1950년대부터 1970년대까지 붐을 이뤘던 국제사진공모전 등을 살펴보고자 한다. 또한 이 과정에서 등단한 사진가들이 이후에 어떻게 작가로 
성장해갔는지를 아카이브 자료를 통해 만나볼 수 있을 것이다. 전시는 1910년대부터 《국전》이 폐지된 1981년 사이에 개최된 공모전을 한국 
근현대사 및 한국사진사 일반 연표와 함께 구성한 인트로 공모전 연대기와, 이 연대기 가운데 26개의 공모전을 선별해 5개의 전시 섹션으로 꾸며진다.', NULL
);

--2019
INSERT INTO MU_EXHIBITION 
(EXHIB_IDX, EXHIB_SUBJECT, EXHIB_PERIOD_START,EXHIB_PERIOD_END, 
EXHIB_VENUE, EXHIB_ARTIST, EXHIB_ARTWORKS_CNT, EXHIB_ADMISSION, 
EXHIB_ORGANIZATION, EXHIB_CONTENT, EXHIB_THUMB_PATH
)
VALUES(EXHIB_SEQ.NEXTVAL,'한국근현대명화전 <근대의 꿈: 꽃나무는 심어 놓고>', '2019-07-02', '2019-09-15', '콜백뮤지엄',
'권영우, 권옥연, 권진규, 김기창, 김형구, 김환기, 나혜석, 남관, 
도상봉, 문학진, 박광진, 박노수, 박득순, 박래현, 박영선, 오지호, 유영국, 윤재우, 
이경희, 이유태, 임직순, 장우성, 장욱진, 정점식, 천경자, 한묵', NULL, NULL, NULL,
'《근대의 꿈 꽃나무는 심어 놓고》는 대한민국임시정부 수립 100주년을 맞이하여 근현대 시기 제작된 주요 작품을 통하여 근대화가 초래한 우리 삶과 인식의 변화
그리고 근대적 시각성의 확장을 살펴보기 위해 기획되었습니다.이태준의 소설 『꽃나무는 심어 놓고』에서 차용한 전시명에서 드러나듯 꽃나무는 근대성을 지칭할 수도
근대화를 위해 우리가 두고 온 어떤 것을 상징할 수도 있습니다. 그렇기에 그것이 드러내는 현실은 엄혹하고 냉혹할 수도 있으며, 풍성하고 화려할 수도 있고,
때로는 그리움으로 또 때로는 좌절을 보듬어 안고 돌이켜 생각해야 하는 것일 수도 있습니다. 이렇듯 100여 년이 지난 현재까지도 우리의 근대가 안고 있는 
내재적인 모순과 그럼에도 불구하고 그 안에서 일구어낸 변화들은 지금 여기의 우리를 구성하고 있습니다. 이번 전시에 출품된 근대기 작가들의 꿈과 도전을 통하여 그것이
갖는 현재의 실천적 의미를 되새겨 보시기 바랍니다.1.근대인의 탄생. 근대기 신문물이 도입된 이후 우리의 삶은 빠르게 변화되어 갔습니다.
다양한 문명의 이기와 신식교육의 도입은 외적인 양상의 변화뿐 아니라 자아에 대한 인식의 변화,
개인과 사회의 관계,주체와 객체 관계의 변화를 초래하였습니다.새 시대의 
인간은 가문 위주의 신분 구조에서 벗어나 목표를 정하고 개인의 능력을 경주하기에 이릅니다.새로운 직업인으로써의 화가는 독자적 지위를 
부여 받았으며,여성 역시 근대 교육의 주체로 신여성으로 인식되기에 이릅니다.가족간의 관계 역시 
변화됩니다.근대 가족은 남녀간의 사랑을 바탕으로 애정이 담긴 아이들의 모습을 화폭의 대상으로 승화시켰습니다.
2.시각성의 확장. 신식 교육을 수료한 근대인의 정신은 관념적이고 이상적인 과거의 사변적 태도에서 
벗어나 일상에 근거하여 내 주변의 실재를 탐색하고 관찰하게 됩니다.이지적 사고의 발달은 실물을 그대로 재현하고자 하는 욕구와 결합하여 
관학파의 고전주의 방식뿐 아니라,과학적 보기 방식을 적용한 사물의 분할 및 빛의 조건에 따른 화면의 구성 등 다양한 조형적 실험으로
이어집니다.사물과 자연을 대상화한 정물화와 풍경화의 등장은 객체를 바라보는 것에 대한 우리의 시각성이 변화했음을 보여줍니다
.정물은 길상적 상징 기능에서 벗어나 주체의 감정을 투영하는 대상으로,관념화된 
산수의 모습은 나의 주변을 둘러싼 일상의 풍경으로 변화하고 있습니다.
보편성을 향하여 일제 강점으로 인하여 착종된 우리의 근대화는 처음부터 내재적 모순을 안고 출발하였지만 격변하는 시대 속에서 새롭게 변화한 우리의 삶을 담아내고자 
하는 작가들의 노력은 계속되었습니다.당시 세계의 공통 조형 언어인 추상미술에 대한 시도는 우리의 근대 주체들이 꿈꾸었던 보편성을 
향한 염원을 드러내는 것으로,마지막 장에서는 이 추상 시도가 어떻게 자주적으로 발현되었는지 살펴봅니다.
단순한 양식적 유사성이 아닌,우리의 자연과 전통을 결합하고 그것을 조형적 요소로 환원함으로써 우리의 추상은 국제 
무대에서 동시대적 보편성을 획득해 나갑니다.', NULL);

--2018
INSERT INTO MU_EXHIBITION 
(EXHIB_IDX, EXHIB_SUBJECT, EXHIB_PERIOD_START,EXHIB_PERIOD_END, 
EXHIB_VENUE, EXHIB_ARTIST, EXHIB_ARTWORKS_CNT, EXHIB_ADMISSION, 
EXHIB_ORGANIZATION, EXHIB_CONTENT, EXHIB_THUMB_PATH
)
VALUES(EXHIB_SEQ.NEXTVAL,'IN_D_EX : 인덱스', '2018-04-17', '2018-06-10', 
'콜백뮤지엄', '기슬기, 김민경, 김주현, 김혜나, 방명주, 애나한, 엄유정, 윤향로, 이미정, 임소담, 황아람', '49점', 
'무료', '콜백뮤지엄','콜백뮤지엄은 2018년 4월 17일부터 6월 10일까지 <IN_D_EX : 인덱스전>을 개최한다. 
그동안 다양한 주제의 실험적인 전시들을 선보여온 프로젝트 갤러리의 2018년 첫 기획전으로 마련된 본 전시에서는 최근 변화하기 
시작한 관객의 전시관람 방식에 주목하고 그에 상응하는 전시관람 환경을 선보인다.전시제목<IN_D_EX : 인덱스>는 포괄적 의미의 
전시환경을 의미하는 ‘INstallation’, 전시환경 내에서 이루어지는 시각적 제시를 의미하는 ‘Demonstration’, 전시환경을 통한 
관객의 경험을 의미하는 ‘EXperience’이라는 세 단어의 조합으로 구성되었다. 우리말로는 ‘색인(索引)’, ‘일정한 순서에 따라 
별도로 배열해 놓은 목록’을 의미하며, 이는 본 전시를 통해 시도하고자 하는 “새로운 관객의 관람태도에 부합하는 전시환경” 실험에 
대한 중요한 개념을 담고 있다.<IN_D_EX : 인덱스>는 새롭게 등장한 ‘관객’의 태도 변화에 주목하였다. 예전의 관객이 ‘보여 지는 것’을 
보았다면 지금의 관객은 ‘보고 싶은 것’을 선택하는 방향으로 진화하고 있다. 관객은 전시관람 과정을 선택적으로 분류하고, 
스스로 계획하여 실행하며, 그것을 가상공간(SNS)에 연결함과 동시에 재상영하고 공유한다. 이는 관객이 그동안 관객에게 
요구되어온 ‘동원된 참여’의 태도를 넘어서서 ‘셀프-큐레이팅’하는 주체적 행위자가 되었음을 보여준다. 주체적 행위자로 
등장한 새로운 관객은 스스로 선택하고 재구성할 수 있는 관람 환경을 필요로 하고 있다. 이러한 현상을 반영하여,
<IN_D_EX : 인덱스>는 작품, 구조물, 벽면, 가구, 디자인, 분위기 등 전시의 모든 요소에 모두 동일한 무게를 갖게 하여 
목록화 함으로써, ‘전시’를 하나의 ‘조합 가능태’로 제안하며 관객의 능동적인 변화의 가능성을 타진해보고자 한다.
“관객이 변화했다면 전시는 이제 무엇이며, 전시가 일어나는 공간은 어떤 역할을 해야 하는가? 전시가 관객에게 무엇을 말하는지 보다, 
이제는 관객이 전시로부터 무엇을 보고, 무엇을 경험으로 선택하여 어떻게 남길지가 더 중요해진 것이 아닌가?”
이러한 질문들을 안고 <IN_D_EX : 인덱스>는 향후 관객이 선택할 그 ‘무엇’에 대하여 이야기해보고자 한다.', NULL);

SELECT * FROM MU_EXHIBITION
WHERE exhib_period_start like '20%';
