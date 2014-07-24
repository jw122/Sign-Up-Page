<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>

<html>
<SCRIPT language="javascript">
     function deleteRow(tableID) {
         try {
	         var table = document.getElementById(tableID);
	         var rowCount = table.rows.length;
	
	         for(var i=0; i<rowCount; i++) {
	             var row = table.rows[i];
	             var radio = row.cells[0].childNodes[0];
	             if(radio!=null && radio.checked==true) {
	                document.getElementById("delete_id").value = radio.value;
	          
	             }
         	}
         }catch(e) {
             alert(e);
         }
     }
     
     function editRow(tableID) {
    		try {
    		var table = document.getElementById(tableID);
    		var rowCount = table.rows.length;
    		
    		for(var i=1; i<rowCount; i++) {
    		     var row = table.rows[i];
    		     var radio = row.cells[0].childNodes[0];
    		     if(null != radio && true == radio.checked) {
    		         document.getElementById("name").value = table.rows[i].cells["1"].innerHTML;
    		 //        document.getElementById("gender").value = table.rows[i].cells["2"].innerHTML;
    		         document.getElementById("country").value = table.rows[i].cells["3"].innerHTML;
    		         document.getElementById("aboutYou").value = table.rows[i].cells["4"].innerHTML;
    		//         document.getElementById("mailingList").value = table.rows[i].cells["5"].innerHTML;
    		    		
    		     }
    		}
    		}catch(e) {
    		    alert(e);
    		}
    	}
     
     function save(tableID) 
     {
     	    var table = document.getElementById(tableID);
     	    var rowCount = table.rows.length;
     	    for(var i=1; i<rowCount; i++) {
     	         var row = table.rows[i];
     	         var radio = row.cells[0].childNodes[0];
     	         if(null != radio && true == radio.checked) {
     	             table.rows[i].cells["1"].innerHTML =  document.getElementById("name").value ;
     	             table.rows[i].cells["3"].innerHTML = document.getElementById("country").value;
     	             table.rows[i].cells["4"].innerHTML  =  document.getElementById("aboutYou").value ;

     	              document.getElementById("name").value = '';
     	              document.getElementById("country").value    = '';
     	              document.getElementById("aboutYou").value     = '' ;
     	              radio.checked    = false;
        	         }
         	}
     }

</SCRIPT>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
<s:head />

<style type="text/css">
@import url(style.css);
body{
	background-color: #FFFFCC;
}

form{
	font-family: "Trebuchet MS", Helvetica, sans-serif;
	font-size: small;
	margin-left: auto;
    margin-right: auto;
    width: 30%; 
}

</style>

</head>

<body>
<h1 class="title" align="center">Welcome! Please sign up to get started.</h1>
<s:form align="center" action="addUser" id="input" class="form">
	<s:textfield name="name" id="name" label="User Name"/> 
	
	<s:password name="password" id="password" label="Password"/>
	
	<s:radio name="gender" id="gender" label="Gender" list="{'Male','Female'}"/>
	
	<s:select name="country" id="country" list="{'Brazil', 'USA', 'China', 'South Africa', 'Japan', 'India', 'Colombia'}" headerKey="" 
		headerValue="Country" label="Select a country"/>
	
	<s:textarea name="aboutYou" id="aboutYou" label="About You"/>
	
	<s:checkbox name="mailingList" 
		label="Would you like to join our mailing list?"/>
	
	<s:submit value="List all Users" action="listUser"></s:submit>
	<s:submit/>
</s:form>

<s:if test="userList.size() > 0">
	<s:form action="deleteUser" id="delete" >
		<s:hidden name="id"/>
		<input type="submit" value="Delete User" onclick="deleteRow('dataTable')"/>
	</s:form> 
	
	<!-- <s:form action="editUser" id="edit"> -->
	<input type="submit" value="Edit User" id="editButton" onclick="editRow('dataTable')"/>
	<!--</s:form>-->
	
	<input type="submit" value="Save" id="saveButton" onclick="save('dataTable')"/>

	<div class="content" align="center">
	<table id="dataTable" class="userTable" cellpadding="5px">
		<tr class="even">
			<th>Select</th>
			<th>Name</th>
			<th>Gender</th> 
			<th>Country</th> 
			<th>About You</th> 
			<th>Mailing List</th> 
		</tr>
		
		<s:iterator value="userList" status="userStatus">
			<tr 
				class="<s:if test="#userStatus.odd == true">odd</s:if>
					<s:else>even</s:else>">
				<td><input type="radio" name="rd" value="<s:property value="id"/>"></td>
				<td><s:property value="name"/></td> 
				<td><s:property value="gender"/></td>
				<td><s:property value="country"/></td>
				<td><s:property value="aboutYou"/></td>
				<td><s:property value="mailingList"/></td>
			</tr>
		</s:iterator>
	</table>
	</div>
	
</s:if>
</body>	
</html>
