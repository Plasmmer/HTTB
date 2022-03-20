if jq -r ".mew[]" users.json;then echo "Parsed JSON successfully and got something other than false/null";else echo "Failed to parse JSON, or got false/null";fi

#        if [ "$username" = "$(jq -r ".$username[]" users.json)" ] # if the choosen username doesn't already exist, validate signup
#        then
#            
#            render_template "$htmlfolder/signup-success.html"
#            send_html "$template"
#        else
#            render_template "$htmlfolder/signup-error.html"
#            send_html "$template"
#        fi 
