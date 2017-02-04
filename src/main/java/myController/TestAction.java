package myController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import myEntity.T_MALL_USER;
import myMapper.Test_Mapper;

@Controller
public class TestAction {

	@Autowired
	Test_Mapper test_Mapper;

	@RequestMapping(value = "/test")
	public String test() {
		System.out.println(1111);
		List<T_MALL_USER> select_user = test_Mapper.select_user(null);
		return "test";
	}

}
