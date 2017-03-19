<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" type="text/css" href="main.css">
<title>Lisää asiakas</title>
</head>
<body>
<form action="LisaaAsiakas" method="post" name="LisaaLomake" id="LisaaLomake" >
<table border="1">
<tr>
<th align="right">Etunimi:</th>
<td><input type="text" name="etunimi" id="etunimi"></td>
</tr>
<tr>
<th align="right">Sukunimi:</th>
<td><input type="text" name="sukunimi" id="sukunimi"></td>
</tr>
<tr>
<th align="right">Puhelin:</th>
<td><input type="text" name="puhelin" id="puhelin"></td>
</tr>
<tr>
<th align="right">Sähköposti:</th>
<td><input type="text" name="sposti" id="sposti"></td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value="Lisää">
<input type="button" value="Kaikki asiakkaat" id="kaikki">
</td>
</tr>
</table>
</form>
<%
if(request.getParameter("ilmo")!=null){
	if(request.getParameter("ilmo").equals("1")){
		out.print("Asiakkaan lisääminen onnistui");	
	}else if(request.getParameter("ilmo").equals("0")){
		out.print("Asiakkaan lisääminen ei onnistunut");	
	}
}
%>
<script>
	$(document).ready(function(){
		$("#etunimi").focus();
	    $("#kaikki").click(function(){	    	
	    	window.location.href = 'haeasiakkaat.jsp';
	    });
	  //  var d = new Date();
	    $("#lisaaLomake").validate({						
			rules: {
				etunimi:  {
					required: true,
					minlength: 3,
					maxlength: 10
				},	
				sukunimi:  {
					required: true,
					minlength: 3,
					maxlength: 30
				},
				puhelin:  {
					required: true,
					minlength: 2,
					maxlength: 15
				},	
				sposti:  {
					required: true,
					email: true,
					minlength: 2,
					maxlength: 30
				}				
			},
			messages: {
				etunimi: {
					required: "Pakollinen",
					minlength: "Pituus ei riitä",
					maxlength: "Liian pitkä"
					
				},
				sukunimi: {
					required: "Pakollinen",
					minlength: "Pituus ei riitä",
					maxlength: "Liian pitkä"
				},
				puhelin: {
					required: "Pakollinen",
					minlength: "Pituus ei riitä",
					maxlength: "Liian pitkä"
				},
				sposti: {
					required: "Pakollinen",
					email: "Anna sähköpostiosoite",
					min: "Pituus ei riitä",
					max: "Liian pitkä"
				}
			},			
			submitHandler: function (form) {				
				document.forms["lisaaLomake"].submit();
			}		
		});
	    //Muita ehtoja/rules
	    	//email: true,
	    	//equalTo: #pwd1,
	    	//url: true
	});

</script>
</body>
</html>