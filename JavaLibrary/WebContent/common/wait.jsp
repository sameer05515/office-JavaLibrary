<html> 
<head> 
<style type="text/css"> 
    #waitpage { position: absolute; } 
    #mainpage { position: absolute; visibility: hidden; } 
</style> 

<script language=\"JavaScript\"> 
function init () 
{ 
    if (document.layers) 
    { 
      document.waitpage.visibility = 'hide'; 
      document.mainpage.visibility = 'show'; 
    } 
    else 
    { 
      if (document.all) 
      { 
        document.all.waitpage.style.visibility = 'hidden'; 
        document.all.mainpage.style.visibility = 'visible'; 
      } 
    } 
} 
</script> 
</head> 

<body onLoad="init();"> 

  <DIV ID="waitpage"> 

  <!-- waiting message is here: --> 
  <center><i> Wait please ... </i></center> 

  </DIV> 

  <!-- very very long calculation is here --> 
  <DIV ID="mainpage"> 
    <script language="JavaScript"> 
         location.href='http://localhost:8080/JavaLibrary/index.html'; 
    </script> 
  </DIV> 

</body> 
</html> 

