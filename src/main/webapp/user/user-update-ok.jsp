<%@ page import ="test.web.common.DBcon" %>
<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String uiNum=request.getParameter("uiNum");
    String uiNum=request.getParameter("uiId");
    String uiNum=request.getParameter("uiPwd");
    String uiNum=request.getParameter("uiName");
    
    Connection con =DBcon.getCon();
    Statement stmt =con.createStatement();
    String sql ="UPDATE user_info\r\n"
    		+"SET UI_NAME ='" +uiName+"',\r\n"
    		+"UI_ID = '" +uiId+"',\r\n"
    		+"UI_PWD='"+uiPwd+"'\r\n"
    		+"WHERE UI_NUM=" +uiNum;
    
    int result =stmt.executeUpdate(sql);
    if(result ==1){
    	%>
    <script>
    	alert('정상적으로 업데이트 되었습니다.');
    	location.href= '/user/user-views.jsp?uiNum=<%=uiNum%>';
    </script>	
    <%
    }else{
   	%>
   	<script>
   		alert('오류가 발생하였습니다.');
   		location.href = '/user/user-views.jsp?uiNum=<%=uiNum%>';
   	</script>
   	<%
    }
    %>