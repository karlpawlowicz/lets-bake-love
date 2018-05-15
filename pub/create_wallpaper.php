<?php
$connect = mysql_connect('localhost', 'ecard_user', 'ecard090') or die(mysql_error());
$database = mysql_select_db("PUSH_ecard",$connect) or die(mysql_error());
$absolutepath = dirname(__FILE__);


$ecard_name = time()."_".rand().".png";
$wallpaper_name = time()."_".rand().".jpg";


if ( isset ( $GLOBALS["HTTP_RAW_POST_DATA"] )) 
{
	

	$im = $GLOBALS["HTTP_RAW_POST_DATA"];
	
	$filename=$ecard_name;
	$fullFilePath=$absolutepath."/download/".$filename;
		
	$handle=fopen($fullFilePath,"w");
	
	fwrite($handle,$im);
	fclose($handle);
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
$dest = imagecreatefromjpeg('download/wallpaper.jpg');
$src = imagecreatefrompng("download/".$ecard_name);

// Copy and merge
//have to get the width and height from flash GET
imagecopy($dest, $src, (1024-$_GET["mc_width"])/2,(470-$_GET["mc_height"])/2, 0, 0, $_GET["mc_width"], $_GET["mc_height"]);

// Output and free free from memory
header('Content-Type: image/jpeg');
imagejpeg($dest, "download/".$wallpaper_name,100);


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

unlink('download/'.$ecard_name);
	echo "imageurl=../download_wallpaper.php?image_id=$wallpaper_name";
	
	//echo '<meta HTTP-EQUIV="REFRESH" content="3; url=http://letsbakelove.pushstage.ca/download_wallpaper.php">';
	
	// Create image instances
	//echo "<meta HTTP-EQUIV='REFRESH' content='0; url=http:download.php?id=$filename'>";
   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Create image instances


	
	//
	//
	

//send variables back to Flash
//echo "done";
	


}
//else echo 'An error occured2.';
?>


