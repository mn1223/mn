package SchoolAPI;

import java.io.Serializable;
 
public class SchoolVO  {
	
	public SchoolVO(String schoolName) {
		SchoolName = schoolName;
	}
 
    private String SchoolName;

	public String getSchoolName() {
		return SchoolName;
	}

	public void setSchoolName(String schoolName) {
		SchoolName = schoolName;
	}

	@Override
	public String toString() {
		return "SchoolVO [SchoolName=" + SchoolName + "]";
	}
    
    
    
 
}