package myTools;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MyUploadUtil {

	public static List<String> uploadImg(List<MultipartFile> files) {
		Iterator<MultipartFile> iterator = files.iterator();
		ArrayList<String> arrayList = new ArrayList<String>();
		while (iterator.hasNext()) {
			MultipartFile next = iterator.next();
			String name = next.getOriginalFilename();
			if (!name.equals("") && name != null) {
				long currentTimeMillis = System.currentTimeMillis();
				String imgName = currentTimeMillis + "_" + name;
				//String realPath = "D:/Applications/workSpaces/workspace05/mall_manager_01/src/main/webapp/upload";// request.getSession().getServletContext().getRealPath("upload");
				String realPath2 = "D:/Applications/workSpaces/workspace05/mall_sale_01/src/main/webapp/upload";
				try {
					//next.transferTo(new File(realPath + "/" + imgName));
					next.transferTo(new File(realPath2 + "/" + imgName));
				} catch (Exception e) {
					e.printStackTrace();
				}
				arrayList.add(imgName);
			}

		}
		return arrayList;
	}
}
