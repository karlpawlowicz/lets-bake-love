<?
// downloading a file use http://somewhere.com/download.php?filename=name of file
$filename = $_GET['image_id'];
header('Pragma: public');   // required   
    header('Expires: 0');       // no cache   
    header('Cache-Control: must-revalidate, post-check=0, pre-check=0');   
    header('Cache-Control: private',false);   
    header('Content-Type: image/jpeg');   
    header('Content-Disposition: attachment; filename="'.basename('download/'.$filename).'"');   
    header('Content-Transfer-Encoding: binary');   
    header('Content-Length: '.filesize("download/".$filename));    // provide file size   
    readfile('download/'.$filename);       // push it out   
    exit();   


?>

<body onload="javascript: self.close ()">

</body>