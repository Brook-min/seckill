package org.seckill.exception;

/**
 * 重复秒杀异常（运行时异常）
 *
 * @author Brook_min
 * @date 2019/4/1 0001 - 14:49
 */
public class RepeatKillException extends SeckillException {

    public RepeatKillException(String message) {
        super(message);
    }

    public RepeatKillException(String message, Throwable cause) {
        super(message, cause);
    }


}
