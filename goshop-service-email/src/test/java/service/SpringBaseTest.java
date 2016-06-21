package service;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:/spring/spring-context.xml" })
public class SpringBaseTest extends AbstractJUnit4SpringContextTests  /*AbstractTransactionalJUnit4SpringContextTests*/{
    //@Before
    @Test
    public void setup() {

    }
}