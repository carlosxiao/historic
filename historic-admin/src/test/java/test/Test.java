package test;

import com.cc.historic.admin.HistoricAdminApplication;
import com.cc.historic.admin.model.mapper.AdminUserMapper;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest(classes = HistoricAdminApplication.class)
@EnableAutoConfiguration
public class Test {

    @Resource
    private AdminUserMapper adminUserMapper;

    @org.junit.Test
    public void test() {
        System.out.println(adminUserMapper.selectAll());
    }
}
