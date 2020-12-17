package www.dream.com.framework;

import java.io.File;
import java.net.URL;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class DreamServer {
	private static DreamServer theInstance = new DreamServer();
	private DreamServer () {
		startService();
	}
	public static DreamServer getInstance() {
		return theInstance;
	}
	private void startService() { // server.xml을 읽어서 deployed project를 찾아내야 함
		File configFile = new File("C:\\IDE\\STS\\DreamServer\\resources\\server.xml"); //서버 디프로이를 바탕으로
		try {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder docBuilder = factory.newDocumentBuilder();
			Document doc = docBuilder.parse(configFile);
			doc.getDocumentElement().normalize();
			Element beanConfig = doc.getDocumentElement();
			String deployedProject = beanConfig.getAttribute("deployedProject");
			Class<?> deployedProjectClass = Class.forName(deployedProject);
			URL url = deployedProjectClass.getClassLoader().getResource("step5/root-context.xml"); //root 연동해서
			
			Container.getInstance().initContext(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
