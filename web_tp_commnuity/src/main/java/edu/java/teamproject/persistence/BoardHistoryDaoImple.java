package edu.java.teamproject.persistence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.java.teamproject.model.BoardHistory;

@Repository
public class BoardHistoryDaoImple implements BoardHistoryDao {

	private static final String BOARDHISTORY_MAPPER = "edu.java.mappers.BoardHistoryMapper";

	private final Logger logger = LoggerFactory.getLogger(BoardHistoryDaoImple.class);

	@Autowired
	SqlSession session;

	@Override
	public int insertBoardHistory(BoardHistory boardHistory) {
		logger.info("insertBoardHistory({})", boardHistory.toString());
		return session.insert(BOARDHISTORY_MAPPER + ".insertBoardHistory", boardHistory);
	}

	@Override
	public long selectAccessTime(String ip, int bno) {
		logger.info("selectAccessTime(ip: {}, bno: {}) 호출", ip, bno);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("ip", ip);
		params.put("bno", bno);
		long aaa;
		try {

			aaa = session.selectOne(BOARDHISTORY_MAPPER + ".selectAccessTime", params);
			if (aaa > 0) {
				return aaa;
			}
		} catch (Exception e) {
			aaa = 0;
			return aaa;
		}

		return aaa;

	}

}
