package org.seckill.exception;

/**
 * 秒杀关闭异常
 *
 * @author Brook_min
 * @date 2019/4/1 0001 - 14:52
 */
public class SeckillCloseException extends SeckillException {

    public SeckillCloseException(String message) {
        super(message);
    }

    public SeckillCloseException(String message, Throwable cause) {
        super(message, cause);
    }
}
