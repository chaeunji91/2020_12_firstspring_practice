package a.b.c;

public class Board {
	private static Board theInstance = new Board();
	private int id;
	private String name;
	private Board() {
		id=111;
		name="홍길동";
	}
	public static Board getInstance() {
		return theInstance;
	}
	public String genForm() {
		StringBuilder sb = new StringBuilder();
		sb.append("<form action=\"registerMember\" method=\"post\">")
		.append("id : ")
		.append("<input type = \"text\" name = \"id\">").append(id).append("</input>")
		.append("이름 :")
		.append("<input type = \"text\" name = \"name\">").append(name).append("</input>")
		.append("</form>");
		
		return sb.toString();
	}
}
