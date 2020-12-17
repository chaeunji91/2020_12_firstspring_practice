package step5;

import www.dream.com.framework.Container;
import www.dream.com.framework.DreamServer;

public class ComponentUserS5 {

	public static void main(String[] args) {
		DreamServer.getInstance(); // 서버 안에서 돌아가도록 함. run on server
		Container container = Container.getInstance();
		TV tv = (TV) container.getBean("stv");
		tv.turnOn();
	}
}
