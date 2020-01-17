package SchoolAPI;

import java.io.Serializable;
 
public class SchoolVO  {
	
	public SchoolVO(String schoolName,String adres) {
		this.SchoolName = schoolName;
		this.adres = adres;
	}
 
    private String SchoolName;
    private String adres;
    
	public String getAdres() {
		return adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	public String getSchoolName() {
		return SchoolName;
	}

	public void setSchoolName(String schoolName) {
		SchoolName = schoolName;
	}

	@Override
	public String toString() {
		return "SchoolVO [SchoolName=" + SchoolName + ", adres=" + adres + "]";
	}

	
    
    
 
}