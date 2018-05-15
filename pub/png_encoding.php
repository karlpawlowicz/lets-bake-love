<?php
$connect = mysql_connect('localhost', 'ecard_user', 'ecard090') or die(mysql_error());
$database = mysql_select_db("PUSH_ecard",$connect) or die(mysql_error());
$absolutepath = dirname(__FILE__);


$query = "SELECT * from ecard";
$result = mysql_query($query,$connect) or die(mysql_error());

$total_rows = mysql_num_rows($result)+1;

$ecard_name = $total_rows."_".time().".png";


$query = "INSERT INTO ecard
(image,who_sent,sender_name,sender_email,rec_name,rec_email,rec2_name,rec2_email,rec3_name,rec3_email)
VALUES
('".$ecard_name."',
'".$_GET["who_sent"]."',
'".$_GET["sender_name"]."',
'".$_GET["sender_email"]."',
'".$_GET["rec_name"]."',
'".$_GET["rec_email"]."',
'".$_GET["rec2_name"]."',
'".$_GET["rec2_email"]."',
'".$_GET["rec3_name"]."',
'".$_GET["rec3_email"]."')";
//}
$result = mysql_query($query,$connect) or die(mysql_error());
	

if ( isset ( $GLOBALS["HTTP_RAW_POST_DATA"] )) 
{
	

	$im = $GLOBALS["HTTP_RAW_POST_DATA"];
	
	$filename=$ecard_name;
	$fullFilePath=$absolutepath."/ecards/".$filename;
		
	$handle=fopen($fullFilePath,"w");
	
	fwrite($handle,$im);
	fclose($handle);
}


$email = $_GET["rec_email"];
$email2 = $_GET["rec2_email"];
$email3 = $_GET["rec3_email"];
$email4 = $_GET["sender_email"];

$email_from=$_GET["sender_email"];

$subject = "I baked this with love.";


$headers = "MIME-Version: 1.0" . "\r\n";
$headers .= "Content-type:text/html;charset=iso-8859-1" . "\r\n";
$headers .= 'From: '.$_GET["sender_email"];

//$headers .= 'To:'.$_GET["rec_email"];


$message = "Hey ".$_GET["rec_name"].",<br><br>I whipped up something sweet for you. I even hired someone sexy to deliver it. So get ready to dig in at <a href='http://www.letsbakelove.com/ecard.php?id=".$filename."&sender=".$_GET["sender_name"]."&receiver=".$_GET["rec_name"]."&del=".$_GET["who_sent"]."'>www.letsbakelove.com</a>.<br><br>Made with love,<br><br>".$_GET["sender_name"]."";

$message2 = "Hey ".$_GET["rec2_name"].",<br><br>I whipped up something sweet for you. I even hired someone sexy to deliver it. So get ready to dig in at <a href='http://www.letsbakelove.com/ecard.php?id=".$filename."&sender=".$_GET["sender_name"]."&receiver=".$_GET["rec2_name"]."&del=".$_GET["who_sent"]."'>www.letsbakelove.com</a>.<br><br>Made with love,<br><br>".$_GET["sender_name"]."";

$message3 = "Hey ".$_GET["rec3_name"].",<br><br>I whipped up something sweet for you. I even hired someone sexy to deliver it. So get ready to dig in at <a href='http://www.letsbakelove.com/ecard.php?id=".$filename."&sender=".$_GET["sender_name"]."&receiver=".$_GET["rec3_name"]."&del=".$_GET["who_sent"]."'>www.letsbakelove.com</a>.<br><br>Made with love,<br><br>".$_GET["sender_name"]."";

$subject_s = "Here’s the cake you baked with love.";

$headers_s = "MIME-Version: 1.0" . "\r\n";
$headers_s .= "Content-type:text/html;charset=iso-8859-1" . "\r\n";
$headers_s .= 'From: noreply@letsbakelove.com';

$message_s = "Your eCake was successfully delivered. <a href='http://www.letsbakelove.com/ecard.php?id=".$filename."&sender=".$_GET["sender_name"]."&receiver=".$_GET["rec_name"]."&del=".$_GET["who_sent"]."'>Check it out</a> for yourself and see exactly what your friend is receiving. And don't forget, if you have something to say, send it with love.<br><br><a href='http://www.virginmobile.ca' target='_blank'>Get a taste of our sweet offers.</a>";


mail($email, $subject, $message, $headers);
mail($email2, $subject, $message2, $headers);
mail($email3, $subject, $message3, $headers);
mail($email4, $subject_s, $message_s, $headers_s);



	
echo "&write=yes&";


?>
