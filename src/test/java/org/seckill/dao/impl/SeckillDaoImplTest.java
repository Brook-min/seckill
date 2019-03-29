package org.seckill.dao.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.dao.SeckillDao;
import org.seckill.entity.Seckill;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

/**
 * @author Brook_min
 * @date 2019/3/28 0028 - 17:58
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class SeckillDaoImplTest {

    //注入dao实现类依赖
    @Autowired
    private SeckillDao seckillDao;

    @Test
    public void reduceNumber() throws Exception {

    }

    @Test
    public void queryById() throws Exception {
        long id = 1000;
        Seckill seckill = seckillDao.queryById(id);
        System.out.println("seckill = " + seckill);
    }

    @Test
    public void queryAll() {
    }
}