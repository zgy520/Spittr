package spittr.data;

import spittr.Spitter;

public interface SpitterRepository {
	void save(Spitter spitter);
	Spitter findByUserName(String userName);
}
