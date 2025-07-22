package edu.sm.sm2025team4.service;

import edu.sm.sm2025team4.dto.Cust_Info;
import edu.sm.sm2025team4.frame.ForeignKeyService;
import edu.sm.sm2025team4.frame.SmService;
import edu.sm.sm2025team4.repository.Cust_InfoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class Cust_InfoService implements SmService<Cust_Info,Integer>, ForeignKeyService<Cust_Info,String> {
    final Cust_InfoRepository cust_InfoRepository;

    @Override
    public List<Cust_Info> getByForeignKey(String string) throws Exception {
        return cust_InfoRepository.selectByForeignKey(string);
    }

    @Override
    public void removeByForeignKey(String string) throws Exception {
        cust_InfoRepository.deleteByForeignKey(string);
    }

    @Override
    public void register(Cust_Info custInfo) throws Exception {
        cust_InfoRepository.insert(custInfo);
    }

    @Override
    public void remove(Integer integer) throws Exception {
        cust_InfoRepository.delete(integer);
    }

    @Override
    public void modify(Cust_Info custInfo) throws Exception {
        cust_InfoRepository.update(custInfo);
    }

    @Override
    public List<Cust_Info> get() throws Exception {
        return cust_InfoRepository.selectAll();
    }

    @Override
    public Cust_Info get(Integer integer) throws Exception {
        return cust_InfoRepository.select(integer);
    }
}
