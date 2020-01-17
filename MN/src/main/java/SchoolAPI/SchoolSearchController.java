package SchoolAPI;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SchoolSearchController {
	@RequestMapping(value="/testschoolsearch")
	public String test() {
		
		return "/search";
	}

}
