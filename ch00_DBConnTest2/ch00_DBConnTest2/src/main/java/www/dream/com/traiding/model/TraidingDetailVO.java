package www.dream.com.traiding.model;

import www.dream.com.product.model.ProductVO;

public class TraidingDetailVO {
	private long traidingId;
	private long productId;
	private int amount;		//개수

	/*----------------------------------------------------------------*/
	/** 구매한 상품 정보 */
	private ProductVO product = null;
}
