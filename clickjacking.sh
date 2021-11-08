#! /bin/bash
dom=$1
url=$dom
maketmp()
{
	mkdir tmp_clickjacking
}

html()
{ echo " <html>
        <head>
		<title>Clickjacking page !!!!</title>
		</head>
	    <body>
		<h1 class="content">Hey Guys</h1>
		<h1>let's check that Website is vulnerable to clickjacking!!!!</h1>
		<iframe src="$url" width="500" height="500"></iframe>
		<h2><i><strong>If you can see the webpage inside the box then it is vulnerable to clickjacking.</i></strong></h2>
		</body>
		</html>
	
" > tmp_clickjacking/clickjacking.html
#echo "$PWD"
cd tmp_clickjacking
}
#
echo " check the *tmp_clickjacking* directory for html PoC ----"
echo " example =  cd tmp_clickjacking && firefox clickjacking.html"
firefox clickjacking.html
if [[ $# == 0 ]]; then
	echo -e "${red}${bold}Invalid Syntax${reset} \n"
	echo -e "$0 target URL \n"
	echo " Eg : $0 http://www.google.com"
else
	maketmp
	html
fi
