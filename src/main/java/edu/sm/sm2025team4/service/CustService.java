package edu.sm.sm2025team4.service;

import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.frame.SmService;
import edu.sm.sm2025team4.repository.CustRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CustService implements SmService <Cust,String> {
    final CustRepository custRepository;
    @Override
    public void register(Cust cust) throws Exception {
        custRepository.insert(cust);
    }

    @Override
    public void remove(String s) throws Exception {
        custRepository.delete(s);
    }

    @Override
    public void modify(Cust cust) throws Exception {
        custRepository.update(cust);
    }

    @Override
    public List<Cust> get() throws Exception {
        return custRepository.selectAll();
    }

    @Override
    public Cust get(String s) throws Exception {
        return custRepository.select(s);
    }
}
