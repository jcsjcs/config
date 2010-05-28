Home config files
=================

Using this tip from the comment by Casey Dahlin at [this blog](http://doug.warner.fm/d/blog/2008/07/Version-controlling-my-home-dir):

>I placed a git repository in my home folder and then renamed the .git directory to .homegit . Ths means git doesn't detect my home folder as a git repo at first. I then added "*" to the ignore file, so git will not version anything unless I explicitly tell it to. So to version control something in home its just:
    $ hgit add -f file
    $ hgit commit

>where hgit is an alias to:
    git --git-dir=$HOME/.homegit --work-tree=$HOME

I added "*" to .homegit/info/exclude instead of creating a .gitignore file in the home folder.

