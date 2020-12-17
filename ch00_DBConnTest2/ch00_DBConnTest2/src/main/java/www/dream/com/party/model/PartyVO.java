package www.dream.com.party.model;

import java.util.Date;
import java.util.List;

import www.dream.com.product.model.ProductVO;

public class PartyVO {
	private long id;	//레코드에 대한 유일 식별자. 이름. 중복 불허
	private String name;
	private Date birthDate;
	private String loginId;
	private String pwd;
	private long balance;	//잔고

	/*----------------------------------------------------------------*/
	/** Party가 가지는 연락처 목록 정보 */
	private List<ContactPointVO> listContactPoint = null;
	/** Party가 판매하고 있는 상품 목록 정보 */
	private List<ProductVO> listProduct = null;
	
	public String getName() {
		return name;
	}

	public String getLoginId() {
		return loginId;
	}

	public long getBalance() {
		return balance;
	}

	@Override
	public String toString() {
		return "PartyVO [id=" + id + ", name=" + name + ", birthDate=" + birthDate + ", loginId=" + loginId + ", pwd="
				+ pwd + ", balance=" + balance + "]";
	}
}
