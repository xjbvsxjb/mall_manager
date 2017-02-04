package myMapper;

import java.util.HashMap;
import java.util.List;

import myEntity.T_MALL_FENLEI1;
import myEntity.T_MALL_FENLEI2;
import myEntity.T_MALL_USER;

public interface Test_Mapper {

	public List<T_MALL_USER> select_user(HashMap<String, Object> hashMap);

	public List<T_MALL_FENLEI1> select_fenlei1();

	public List<T_MALL_FENLEI2> select_fenlei2();
}
