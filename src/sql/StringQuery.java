package sql;

public interface StringQuery {
	String SELECT_IDCHECK = "select * from membership where userId=?";
	String INSERT_REGISTER = "insert into membership values(?,?,?,?,?,?,?,?,?,?)";
	String SELECT_LOGINCHECK = "select userpass from membership where userid=? ";
	String SELECT_GETMEMINFO = "select * from membership where userid=?";
	String SELECT_UPDATE = "update membership set userpass=?,phone1=?,phone2=?,phone3=?,emailid=?,emailadd=? where userid=?";
	String SELECT_MEMBER = "select userpass from membership where userid=? ";
	String DELETE_MEMBER = "delete from membership where userid=?";
	String SELECT_LOGIN = "select username,phone1,phone2,phone3,gender,emailid,emailadd, birth from member where id=? and password=?";
}
