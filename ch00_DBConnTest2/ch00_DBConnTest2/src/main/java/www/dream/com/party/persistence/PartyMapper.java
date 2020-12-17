package www.dream.com.party.persistence;

import java.util.List;

import www.dream.com.party.model.PartyVO;

public interface PartyMapper {
	public List<PartyVO> findAllParty();
}
