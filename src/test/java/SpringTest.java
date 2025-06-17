import com.sy.dto.ResultDto;
import com.sy.pojo.Goods;
import com.sy.service.CateService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-dao.xml", "classpath:spring-service.xml"})
public class SpringTest {
    @Autowired
    private CateService cateServiceImpl;

    @Test
    public void test01() {
        String string = "00100001,00100002,00100003";
        ResultDto<List<Goods>> resultDto = cateServiceImpl.delAllGoodsType(string);
        System.out.println(resultDto);

    }

}
