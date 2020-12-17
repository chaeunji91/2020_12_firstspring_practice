package www.dream.com.party.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import www.dream.com.party.model.PartyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class PartyVOTest {
	@Autowired
	private PartyMapper partyMapper;
	
	@Test
	public void test() {
		List<PartyVO> listParty = partyMapper.findAllParty();
		
		for (PartyVO party : listParty) {
			System.out.println(party);
		}
	}

}
