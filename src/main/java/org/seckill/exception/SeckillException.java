package org.seckill.exception;

/**
 * 秒杀相关业务异常
 *
 * @author Brook_min
 * @date 2019/4/1 0001 - 14:55
 */
public class SeckillException extends RuntimeException {
    public SeckillException(String message) {
        super(message);
    }

    public SeckillException(String message, Throwable cause) {
        super(message, cause);
    }
}
