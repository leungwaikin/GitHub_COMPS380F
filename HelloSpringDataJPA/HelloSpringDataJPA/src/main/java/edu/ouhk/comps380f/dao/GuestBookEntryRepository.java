package edu.ouhk.comps380f.dao;

import edu.ouhk.comps380f.model.GuestBookEntry;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GuestBookEntryRepository extends JpaRepository<GuestBookEntry, Integer> {
}
