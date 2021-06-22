#!/bin/bash

input="temp5.csv"
tail -n +2 $input | while IFS= read -r var
do
        _author_id=`echo $var | cut -d, -f5`
        _author=`echo $var | cut -d, -f2`
        _author_cakeday=`echo $var | cut -d, -f3`
        _subreddit=`echo $var | cut -d, -f31`
        _id=`echo $var | cut -d, -f16`
    	_created_month=`echo $var | cut -d, -f8`
    	_title=`echo $var | cut -d, -f37`

        mysql -h localhost -u "root" --password="s" -e "insert into project1.user values('$_author_id', '$_author', '$_author_cakeday')"
        mysql -h localhost -u "root" --password="s" -e "insert into project1.subreddit values('$_subreddit')"
        mysql -h localhost -u "root" --password="s" -e "insert into project1.post values('$_id', '$_author_id', '$_subreddit', '$_created_month', '$_title')"

done
