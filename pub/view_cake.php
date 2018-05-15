<?php




$absolutepath = dirname(__FILE__);






if ( isset ( $GLOBALS["HTTP_RAW_POST_DATA"] )) 
{
$ecard_name = time()."_".rand().".png";


	$im = $GLOBALS["HTTP_RAW_POST_DATA"];
	
	$filename=$ecard_name;
	$fullFilePath=$absolutepath."/ecards/".$filename;
		
	$handle=fopen($fullFilePath,"w");
	
	fwrite($handle,$im);
	fclose($handle);
}



	
echo "imageurl=../ecard.php?id=".$filename."&sender=".$_GET["sender_name"]."&receiver=".$_GET["rec_name"]."&del=".$_GET["who_sent"];


?>
