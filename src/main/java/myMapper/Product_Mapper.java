package myMapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import myEntity.T_MALL_ATTR;
import myEntity.T_MALL_ATTR_VALUE;
import myEntity.T_MALL_PRODUCT;
import myEntity.T_MALL_SKU;

public interface Product_Mapper {

	ArrayList<T_MALL_ATTR> select_fenlei2(HashMap<Object, Object> hashMap);

	int insert_attr(T_MALL_ATTR t_MALL_ATTR);

	int insert_values(Map<Object, Object> map);

	int insert_product(T_MALL_PRODUCT product);

	void insert_image(Map<Object, Object> map);

	int insert_attr_value(List<T_MALL_ATTR_VALUE> list);

	void insert_sku(T_MALL_SKU sku);

	List<T_MALL_PRODUCT> select_products(HashMap<Object, Object> hashMap);

}
