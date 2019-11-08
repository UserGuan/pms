package com.pms.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class) // 在spring中加入单元测试的运算环境
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"}) // 在spring-mybatis.xml中开启注解扫描，并开启注解驱动
public class UserTest {

    @Test
    public void listTest() {

    }

}