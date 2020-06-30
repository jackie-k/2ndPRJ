package poly.persistance.redis;

import poly.dto.MainDTO;

import java.util.HashMap;
import java.util.List;

public interface IRedisMapper {

    public boolean getExists(String key) throws Exception; // 데이터가 존재하는지 체크

    public List<MainDTO> getCoorInfo(String key) throws Exception; // 데이터 가져오기

    public int setCoorInfo(String key, List<MainDTO> rList) throws Exception; // 데이터 저장하기

    public boolean setTimeOutMinute(String key, int minutes) throws Exception; // 정보 저장될 시간(TTL) 설정
}