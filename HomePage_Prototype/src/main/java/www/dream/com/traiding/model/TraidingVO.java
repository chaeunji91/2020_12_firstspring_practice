package www.dream.com.traiding.model;

import java.util.Date;
import java.util.List;

import www.dream.com.party.model.PartyVO;

public class TraidingVO {
	private long id;
	private long buyerId;
	private Date tradingDateTime;

	/*----------------------------------------------------------------*/
	/** 구매자 정보 */
	private PartyVO buyer = null;
	/** 구매시 각 상품 구매 상세 목록 정보 */
	private List<TraidingDetailVO> listTraidingDetail = null;
	
}
