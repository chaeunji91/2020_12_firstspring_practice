package www.dream.com.framework;

import java.lang.reflect.Constructor;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class Container {
	private static Container theInstance = new Container();

	private Container() {
	}

	public static Container getInstance() {
		return theInstance;
	}

	private Map<String, Object> map = new HashMap<>(); // 컨테이너에 id, class를 담음

	public void initContext(URL url) { // xml을 줄게, map에 이름 짝지어서 담아라
		try {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder = factory.newDocumentBuilder();
			Document document = documentBuilder.parse(url.toString());
			Element root = document.getDocumentElement();
			root.normalize();
			NodeList listBean = root.getElementsByTagName("bean");

			for (int i = 0; i < listBean.getLength(); i++) {
				String beanId = null;
				Object bean = null;

				Node beanNode = listBean.item(i);
				NamedNodeMap namedNodeMap = beanNode.getAttributes();
				for (int j = 0; j < namedNodeMap.getLength(); j++) {
					Node beanAtt = namedNodeMap.item(j);
					String attName = beanAtt.getNodeName(); // id, class
					String attValue = beanAtt.getNodeValue();

					if ("id".equals(attName)) { // id 가져옴
						beanId = attValue;
					} else if ("class".equals(attName)) { // class 가져옴
						String className = attValue;
						Class<?> classOfBean = Class.forName(className);
						Constructor constructor = classOfBean.getConstructor();
						bean = constructor.newInstance();
					}
				}
				map.put(beanId, bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Object getBean(String string) {
		return map.get(string);
	}
}
