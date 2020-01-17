package com.mn.project.login;

public interface LoginService {
	
	public LoginVO login(LoginVO loginVO) throws Exception;
	//화면에는 안뿌려줘도 로그인됐는지는 비교해야하기때문에 반환값을 LoginVO 
	public LoginVO idfind(LoginVO loginVO) throws Exception;
	
	public LoginVO pwfind(LoginVO loginVO) throws Exception;
	
	public int pwchange(LoginVO loginVO) throws Exception;
	//oracle에 컬럼이 수정되어 입력되는 것이 1행이 입력되었다는 것이 숫자로인식하기때문에 int로 반환
	
    public LoginVO mmdeletebe(LoginVO loginVO) throws Exception;
	
	public int mmdelete(LoginVO loginVO) throws Exception;
	
	public LoginVO select(LoginVO loginVO) throws Exception;
	
	public void update(LoginVO loginVO) throws Exception;
	//아이디 중복체크
	public int duplicate(LoginVO loginVO) throws Exception;
}
