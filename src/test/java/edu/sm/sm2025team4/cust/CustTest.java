package edu.sm.sm2025team4.cust;

import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class CustTest {
    @Autowired
    CustService custService;

    @Test
    public void selectTest() {
        try {
            Cust cust = custService.get("id01");
            log.info("cust:{}",cust);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
