package www.dream.com.product.model;

import www.dream.com.party.model.PartyVO;

public class ProductVO {
	private long id;
	private long sellerId;		//판매자 identifier
	private String name;		//상품명
	private long value;			//가격

	/*----------------------------------------------------------------*/
	/** 판매자 정보 */
	private PartyVO seller = null;
}
