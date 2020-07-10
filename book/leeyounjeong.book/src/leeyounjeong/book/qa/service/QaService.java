package leeyounjeong.book.qa.service;

import java.util.List;

import leeyounjeong.book.qa.domain.Qa;

public interface QaService {
	List<Qa> listQas();
	Qa findQa(int qaNo);
	boolean join(Qa qa);
	boolean correctQa(Qa qa);
	boolean secede(int qaNo);
}
