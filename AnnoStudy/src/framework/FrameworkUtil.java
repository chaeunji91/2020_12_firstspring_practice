package framework;

import java.lang.reflect.Field;

public class FrameworkUtil {
	public static void printMeata(Object obj) {
		for(Field field : obj.getClass().getDeclaredFields()) {
			MyAnno myAnno = field.getAnnotation(MyAnno.class);
			System.out.println(myAnno.name());
			System.out.println(myAnno.description());
		}
	}
}