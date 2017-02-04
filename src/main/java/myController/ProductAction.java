package myController;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import myEntity.MODEL_MultipartFile;
import myEntity.MODEL_T_MALL_ATTR;
import myEntity.T_MALL_ATTR;
import myEntity.T_MALL_ATTR_VALUE;
import myEntity.T_MALL_PRODUCT;
import myEntity.T_MALL_SKU;
import myService.ProductService;

@Controller
public class ProductAction {

	@Autowired
	ProductService productService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "full";
	}

	@RequestMapping(value = "/to_fenlei_attr", method = RequestMethod.GET)
	public String to_fenlei_attr() {
		return "fenlei_attr";
	}

	@RequestMapping(value = "/to_product_sku", method = RequestMethod.GET)
	public String to_product() {
		return "sku_publish";
	}

	@RequestMapping(value = "/to_attr", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<T_MALL_ATTR> to_attr(String fenlei2id, String twoname, ModelMap model) {
		ArrayList<T_MALL_ATTR> attrList = productService.getAttr(fenlei2id);
		// model.addAttribute("attrList", attrList);
		// model.addAttribute("twoname", twoname);
		// model.addAttribute("fenlei2_id", fenlei2id);
		return attrList;
	}

	@RequestMapping(value = "/to_product_publish", method = RequestMethod.GET)
	public String to_product_publish() {
		return "product_publish";
	}

	@RequestMapping(value = "/add_attr/{fenlei2_id}/{twoname}", method = RequestMethod.GET)
	public String add_attr(@PathVariable String fenlei2_id, @PathVariable String twoname, ModelMap model) {
		model.addAttribute("fenlei2id", fenlei2_id);
		model.addAttribute("twoname", twoname);
		return "add_attr";
	}

	@RequestMapping(value = "/add_attr_value", method = RequestMethod.POST)
	public String add_attr_value(MODEL_T_MALL_ATTR T_MALL_ATTRS) {
		int i = productService.saveAttrs(T_MALL_ATTRS);
		return "redirect:/index.action";
	}

	@RequestMapping(value = "/use_attr", method = RequestMethod.POST)
	public String use_attr(String fenlei2id, String twoname, ModelMap model) {
		ArrayList<T_MALL_ATTR> attrList = productService.getAttr(fenlei2id);
		model.addAttribute("attrList", attrList);
		model.addAttribute("twoname", twoname);
		model.addAttribute("fenlei2_id", fenlei2id);
		return "use_attr";
	}

	@RequestMapping(value = "/add_product_sku", method = RequestMethod.POST)
	public String add_product(T_MALL_SKU sku, MODEL_T_MALL_ATTR T_MALL_ATTRS, int product_id) {

		// 取出产品属性
		T_MALL_PRODUCT product = new T_MALL_PRODUCT();
		product.setId(product_id);

		// 取出提交的分类属性和属性值对应关系
		List<T_MALL_ATTR_VALUE> lattr_value = new ArrayList<T_MALL_ATTR_VALUE>();
		for (int i = 0; i < T_MALL_ATTRS.getT_MALL_ATTRS().size(); i++) {
			T_MALL_ATTR t_MALL_ATTR = T_MALL_ATTRS.getT_MALL_ATTRS().get(i);
			if (t_MALL_ATTR.getId() != 0) {
				for (int j = 0; j < t_MALL_ATTR.getLvalue().size(); j++) {
					if (t_MALL_ATTR.getLvalue().get(j).getId() != 0) {
						T_MALL_ATTR_VALUE t_MALL_ATTR_VALUE = new T_MALL_ATTR_VALUE();
						t_MALL_ATTR_VALUE.setAttr_id(t_MALL_ATTR.getId());
						t_MALL_ATTR_VALUE.setValue_id(t_MALL_ATTR.getLvalue().get(j).getId());
						lattr_value.add(t_MALL_ATTR_VALUE);
					}
				}
			}
		}

		// 将输入交给产品发布模型
		productService.publishSku(sku, product, lattr_value);
		return "redirect:/index.action";
	}

	@RequestMapping(value = "/add_product_publish", method = RequestMethod.POST)
	public String to_product_publish(T_MALL_PRODUCT product, MODEL_MultipartFile files) {
		productService.publishProduct(files.getFiles(), product);
		return "redirect:/index.action";
	}

	@ResponseBody
	@RequestMapping(value = "/chose_product", method = RequestMethod.POST)
	public List<T_MALL_PRODUCT> chose_product(String oneid, String twoid, String tmid) {

		List<T_MALL_PRODUCT> lp = productService.getProducts(oneid, twoid, tmid);

		return lp;
	}

}
