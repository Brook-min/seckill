package org.seckill.dao;

import org.seckill.entity.Seckill;

import java.util.Date;
import java.util.List;

/**
 * @author Brook_min
 * @date 2019/3/28 0028 - 15:15
 */
public interface SeckillDao {
    /**
     * 减库存
     *
     * @param seckillId
     * @param killTime
     * @return
     */
    int reduceNumber(long seckillId, Date killTime);

    /**
     * 根据id进行查询
     *
     * @param seckillId
     * @return
     */
    Seckill queryById(long seckillId);

    /**
     * 根据偏移量查询秒杀商品列表
     *
     * @param offet
     * @param limit
     * @return
     */
    List<Seckill> queryAll(int offet, int limit);
}
