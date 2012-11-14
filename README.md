## fresh_html_proj.rb

### About
A nifty ruby script I use to start up a simple html projects. It's hella fresh. Grabs the latest jquery.min file from google (ajax.googleapis.com). 

### How to use

Add the following alias to your .bash_profile

```
alias fresh_proj="ruby < <(curl -s https://raw.github.com/leoherrick/scripts/master/fresh_html_proj.rb)"
```

Once you do this... act like a boss and start a new project by typing the following command in terminal:

```
fresh_proj <name of directory>
```

The <name of the directory> can be a path to the new directory location, or an existing *empty* directory.