package leeyounjeong.book.qa.dao;

import java.util.List;

import leeyounjeong.book.config.Configuration;
import leeyounjeong.book.qa.dao.map.QaMap;
import leeyounjeong.book.qa.domain.Qa;

public class QaDaoImpl implements QaDao{
	private QaMap qaMapper;
	
	public QaDaoImpl() {
		this.qaMapper = Configuration.getMapper(QaMap.class);
	}
	
	@Override
	public List<Qa> getQas(){
		return qaMapper.getQas();
	}
	
	@Override
	public Qa getQa(int qaNo) {
		return qaMapper.getQa(qaNo);
	}
	
	@Override
	public int addQa(Qa qa) {
		return qaMapper.addQa(qa);
	}
	
	@Override
	public int updateQa(Qa qa) {
		return qaMapper.updateQa(qa);
	}
	
	@Override
	public int delQa(int qaNo) {
		return qaMapper.delQa(qaNo);
	}
}
