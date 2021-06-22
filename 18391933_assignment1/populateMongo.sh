#!/bin/bash

input="temp5.csv"

while read -r -d var
do
    mongo project1 --eval 'db.myRedditCollection.insert({archived: "'"${var[0]}"'", author: "'"${var[1]}"'", author_cakeday: "'"${var[2]}"'", author_flair_text: "'"${var[3]}"'", author_id: "'"${var[4]}"'", brand_safe: "'"${var[5]}"'", contest_mode: "'"${var[6]}"'", created_utc: "'"${var[7]}"'", crosspost_parent: "'"${var[8]}"'", disable_comments: "'"${var[9]}"'", distinguished: "'"${var[10]}"'", domain: "'"${var[11]}"'", edited: "'"${var[12]}"'", gilded: "'"${var[13]}"'", hide_score: "'"${var[14]}"'", id: "'"${var[15]}"'", is_reddit_media_domain: "'"${var[16]}"'", is_self: "'"${var[17]}"'", is_video: "'"${var[18]}"'", locked: "'"${var[19]}"'", num_comments: "'"${var[20]}"'", num_crossposts: "'"${var[21]}"'", parent_whitelist_status: "'"${var[22]}"'", permalink: "'"${var[23]}"'", post_hint: "'"${var[24]}"'", promoted: "'"${var[25]}"'", retrieved_on: "'"${var[26]}"'", score: "'"${var[27]}"'", spoiler: "'"${var[28]}"'", stickied: "'"${var[29]}"'", subreddit: "'"${var[30]}"'", subreddit_id: "'"${var[31]}"'", suggested_sort: "'"${var[32]}"'", third_party_trackers: "'"${var[33]}"'", thumbnail_height: "'"${var[34]}"'", thumbnail_width: "'"${var[35]}"'", title: "'"${var[36]}"'", url: "'"${var[37]}"'", whitelist_status: "'"${var[38]}"'"})'
done
