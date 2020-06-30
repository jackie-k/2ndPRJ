package poly.persistance.redis.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Component;
import poly.dto.MainDTO;
import poly.persistance.redis.IRedisMapper;

import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Component("RedisMapper")
public class RedisMapper implements IRedisMapper {

    @Autowired
    public RedisTemplate<String, Object> redisDB;

    private Logger log = Logger.getLogger(this.getClass());

    @Override
    public boolean getExists(String key) throws Exception {

        log.info(this.getClass().getName() + " : getExists 호출");

        return redisDB.hasKey(key);
    }

    @Override
    public List<MainDTO> getCoorInfo(String key) throws Exception {

        log.info(this.getClass().getName() + " : getProjectInfo 호출");

        List<MainDTO> rList = null;

        redisDB.setKeySerializer(new StringRedisSerializer());
        redisDB.setValueSerializer(new Jackson2JsonRedisSerializer<>(MainDTO.class));

        if(redisDB.hasKey(key)){
            rList = (List) redisDB.opsForList().range(key, 0, -1);
        }

        log.info(this.getClass().getName() + " : getProjectInfo 종료");

        return rList;
    }

    @Override
    public int setCoorInfo(String key, List<MainDTO> rList) throws Exception {

        int res = 0;

        log.info(this.getClass().getName() + " : setProjectInfo 호출");

        redisDB.setKeySerializer(new StringRedisSerializer());
        redisDB.setValueSerializer(new Jackson2JsonRedisSerializer<>(MainDTO.class));

        if(this.getExists(key)) {
            redisDB.delete(key);
        }

        Iterator<MainDTO> it = rList.iterator();

        while (it.hasNext()) {
            MainDTO pDTO = (MainDTO) it.next();

            redisDB.opsForList().rightPush(key, pDTO);

            pDTO = null;
        }

        res = 1;

        log.info(this.getClass().getName() + " : setCoordinationInfo 종료");

        return res;
    }

    @Override
    public boolean setTimeOutMinute(String roomKey, int minutes) throws Exception {
        log.info(this.getClass().getName() + " : setTimeOutHour 호출");
        return redisDB.expire(roomKey, minutes, TimeUnit.MINUTES);
    }
}