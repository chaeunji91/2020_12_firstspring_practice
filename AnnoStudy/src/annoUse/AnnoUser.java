package annoUse;

import framework.FrameworkUtil;
import framework.MyAnno;

public class AnnoUser {
	@MyAnno(name="나이", description="올해년도 빼기 태어난 연도 + 1")
	private int age;
	
	public static void main(String[] args) {
		AnnoUser au = new AnnoUser();
		FrameworkUtil.printMeata(au);
	}
}