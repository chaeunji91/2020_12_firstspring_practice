package a.b.c;

public class MemberVO {
	private int id;
	private String name;
	private boolean sex;
	public MemberVO() {
		super();
	} //pojo
	public MemberVO(int id, String name, boolean sex) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
	}
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public boolean isSex() {
		return sex;
	}
}
