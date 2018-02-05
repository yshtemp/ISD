for i in 0 {01..300}; do curl -s http://www.islamspirit.com/islamspirit_ency_$i.php | grep "chm" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | sort | uniq >> links.txt ; done
mkdir files
wget -qq -i links.txt
for file in *.zip; do unzip $file && rm $file ; done
mv *.chm files/
