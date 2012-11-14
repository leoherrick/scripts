## fresh_html_proj.rb

### About
A nifty ruby script I use to start up a simple html projects. It's hella fresh. Grabs the latest jquery.min file from google (ajax.googleapis.com). 

### How to use

Add the following alias to your .bash_profile

```
alias fresh_proj="ruby < <(curl -s https://raw.github.com/leoherrick/scripts/master/fresh_html_proj.rb)"
```

Once you do this... act like a boss and start a new project in any empty directory by typing the following command in terminal:
```
fresh_proj <name of directory>
```

Oh... and you've gotta have ruby installed on your system. 