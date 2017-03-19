 // tähän onko kirjauduttu
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" type="text/css" href="main.css">
<title>Muuta asiakkaan tietoja</title>
</head>
<%
String etunimi="";
if(request.getParameter("muuta_etunimi")!=null){
	etunimi=request.getParameter("muuta_etunimi");
}
String sukunimi="";
if(request.getParameter("sukunimi")!=null){
	sukunimi=request.getParameter("sukunimi");
}
String puhelin="";
if(request.getParameter("puhelin")!=null){
	puhelin=request.getParameter("puhelin");
}
String sposti="";
if(request.getParameter("sposti")!=null){
	sposti=request.getParameter("sposti");
}
%>
<body>
<%
out.print("Kirjautuneena: " + session.getAttribute("kayttaja") + "<br>");
%>
<form action="MuutaAsiakas" method="post" name="muutaLomake" id="muutaLomake">
<table>
<tr>
<th align="right" style="width:33%" class="pysty">Etunimi:</th>
<td><input type="text" name="etunimiUusi" id="etunimi" value="<%=etunimi%>"></td>
</tr>
<tr>
<th align="right" class="pysty">Sukunimi:</th>
<td><input type="text" name="sukunimi" id="sukunimi" value="<%=sukunimi%>"></td>
</tr>
<tr>
<th align="right" class="pysty">Puhelin:</th>
<td><input type="text" name="puhelin" id="puhelin" value="<%=puhelin%>"></td>
</tr>
<tr>
<th align="right" class="pysty">Sähköposti:</th>
<td><input type="text" name="sposti" id="sposti" value="<%=sposti%>"></td>
</tr>
<tr>
<td colspan="2" class="nappiSarake"><input type="submit" value="Vahvista muutos">
<input type="button" value="Kaikki asiakkaat" id="kaikki"></td>
</tr>
</table>
<input type="hidden" name="etunimi" value="<%=etunimi%>">
</form>

<script>
	$(document).ready(function(){
		$("#etunimi").focus();
	    $("#kaikki").click(function(){	    	
	    	window.location.href = 'haeasiakkaat.jsp';
	    });
	    var d = new Date();
	    $("#muutaLomake").validate({						
			rules: {
				etunimiUusi:  {
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
					maxlength: 30
				},
				
				sposti:  {
					required: true,
					email: true,
					minlength: 2,
					maxlength: 30
				}	
				
			},
			messages: {
				etunimiUusi: {
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
					minlength: "Pituus ei riitä",
					maxlength: "Liian pitkä"
				}
				
			},			
			submitHandler: function (form) {
				document.forms["muutaLomake"].submit();
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