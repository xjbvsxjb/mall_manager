package myService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import myEntity.MODEL_T_MALL_ATTR;
import myEntity.MODEL_T_MALL_ATTR_VALUE;
import myEntity.T_MALL_ATTR;
import myEntity.T_MALL_ATTR_VALUE;
import myEntity.T_MALL_PRODUCT;
import myEntity.T_MALL_SKU;
import myMapper.Product_Mapper;
import myTools.MyUploadUtil;

@Repository
public class ProductService {

	@Autowired
	Product_Mapper product_Mapper;

	/***
	 * 获得分类属性
	 * 
	 * @param fenlei2id
	 * @return
	 */
	public ArrayList<T_MALL_ATTR> getAttr(String fenlei2id) {
		ArrayList<T_MALL_ATTR> arrayList = new ArrayList<T_MALL_ATTR>();
		HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
		hashMap.put("fenlei2id", fenlei2id);
		arrayList = product_Mapper.select_fenlei2(hashMap);
		return arrayList;
	}

	/***
	 * 分类属性保存
	 * 
	 * @param t_MALL_ATTRS
	 * @return
	 */
	public int saveAttrs(MODEL_T_MALL_ATTR t_MALL_ATTRS) {
		int j = 0;
		for (int i = 0; i < t_MALL_ATTRS.getT_MALL_ATTRS().size(); i++) {
			// 插入分类属性，useGeneratedKeys，生成id
			T_MALL_ATTR t_MALL_ATTR = t_MALL_ATTRS.getT_MALL_ATTRS().get(i);
			j = product_Mapper.insert_attr(t_MALL_ATTR);
			HashMap<Object, Object> hashMap = new HashMap<Object, Object>();

			// 放入生成的分类属性的id
			for (int k = 0; k < t_MALL_ATTRS.getT_MALL_ATTRS().get(i).getLvalue().size(); k++) {
				t_MALL_ATTRS.getT_MALL_ATTRS().get(i).getLvalue().get(k).setAttr_id(t_MALL_ATTR.getId());
			}

			// 插入分类属性值组
			hashMap.put("list", t_MALL_ATTRS.getT_MALL_ATTRS().get(i).getLvalue());
			int k = product_Mapper.insert_values(hashMap);
			j++;
		}
		return j;
	}

	/***
	 * 发布sku产品库存
	 * 
	 * @param sku
	 * @param product
	 * @param lattr_value
	 * @return
	 */
	public int publishSku(T_MALL_SKU sku, T_MALL_PRODUCT product, List<T_MALL_ATTR_VALUE> lattr_value) {

		// 保存产品库存信息
		sku.setProduct_id(product.getId());
		product_Mapper.insert_sku(sku);

		// 保存产品属性关联信息
		for (int i = 0; i < lattr_value.size(); i++) {
			lattr_value.get(i).setProduct_id(product.getId());
			lattr_value.get(i).setSku_id(sku.getId());
		}
		int i = product_Mapper.insert_attr_value(lattr_value);

		return i;
	}

	/***
	 * 发布产品
	 * 
	 * @param files
	 * @param product
	 * @return
	 */
	public int publishProduct(List<MultipartFile> files, T_MALL_PRODUCT product) {

		
		List<String> urls = MyUploadUtil.uploadImg(files);
		
		// 保存产品信息
		product.setPimage(urls.get(0));
		product_Mapper.insert_product(product);
		
		// 保存产品图片信息
		HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
		hashMap.put("urls", urls);
		hashMap.put("product_id", product.getId());
		product_Mapper.insert_image(hashMap);



		return 0;

	}

	/***
	 * 获得产品信息
	 * 
	 * @param oneid
	 * @param twoid
	 * @param tmid
	 * @return
	 */
	public List<T_MALL_PRODUCT> getProducts(String oneid, String twoid, String tmid) {
		HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
		hashMap.put("oneid", oneid);
		hashMap.put("twoid", twoid);
		hashMap.put("tmid", tmid);
		List<T_MALL_PRODUCT> lp = product_Mapper.select_products(hashMap);
		return lp;
	}

}
