package step4;

public class TVFactory {
	public static TV getTVBean(String tvName) {
		TV ret = null;
		if ("STV".equals(tvName)) {
			ret = new STv();
		} else if ("LTV".equals(tvName)) {
			ret = new LTv();
		}  else if (tvName.equals("HTv")) { //이렇게 쓰지 말것
			ret = new DTv();
		}
		return ret;
	}
}
