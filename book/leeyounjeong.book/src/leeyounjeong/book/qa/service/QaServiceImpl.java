package leeyounjeong.book.qa.service;

import java.util.List;

import leeyounjeong.book.qa.dao.QaDao;
import leeyounjeong.book.qa.dao.QaDaoImpl;
import leeyounjeong.book.qa.domain.Qa;

public class QaServiceImpl implements QaService{
	private QaDao qaDao;
	
	public QaServiceImpl() {
		this.qaDao = new QaDaoImpl();
	}
	
	@Override
	public List<Qa> listQas(){
		return qaDao.getQas();
	}
	
	@Override
	public Qa findQa(int qaNo) {
		return qaDao.getQa(qaNo);
	}
	
	@Override
	public boolean join(Qa qa) {
		return qaDao.addQa(qa)>0;
	}
	
	@Override
	public boolean correctQa(Qa qa) {
		return qaDao.updateQa(qa)>0;
	}
	
	@Override
	public boolean secede(int qaNo) {
		return qaDao.delQa(qaNo)>0;
	}

}
