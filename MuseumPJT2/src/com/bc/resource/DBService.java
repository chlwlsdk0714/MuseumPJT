package com.bc.resource;

import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//MyBatis 사용해서 작업할 SqlSession을 만들어주는
//SqlSessionFactory 객체를 생성하기 위한 클래스
public class DBService {
	private static SqlSessionFactory factory;
	
	//static변수에 대한 초기화 구문 //로딩되면 바로 변수에 데이터 넣기 위한 코드 작성
	static {
		
		try {
			/*//풀어서
			String config = "com/mystudy/mybatis/config.xml";
			Reader reader = Resources.getResourceAsReader(config);
			SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
			SqlSessionFactory factory = sqlSessionFactoryBuilder.build(reader);
			*/
			factory = new SqlSessionFactoryBuilder()   //최종적으로 리턴되는건 리더타입
					.build(Resources.getResourceAsReader("com/bc/resource/config.xml"));
		
		} catch (IOException e1) {
			e1.printStackTrace();
		}		
		
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
