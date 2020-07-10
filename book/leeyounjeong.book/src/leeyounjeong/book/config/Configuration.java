package leeyounjeong.book.config;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Configuration {
	private static SqlSession sqlSession;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("leeyounjeong/book/config/sqlMapConfig.xml"); 
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader); 
			sqlSession = sqlSessionFactory.openSession(true); 
			reader.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
		
	public static <T>T getMapper(Class<T> arg){ 
		return sqlSession.getMapper(arg); 
	}
}
