gioku
=====

Git based static page deploy system like github pages/heroku. Based on nginx and 
gitolite.

Installation
------------

Right now installation is only officially supported on Ubuntu. If you want to
setup manually, go take a look at scripts/basesetup.sh ans 
scripts/install-prod.sh.

Really most of the repository is these two files as gioku is really nothing
much fancier than a post-receive hook and some simple setup steps.

But yeah.. to install on Ubuntu

First you need to get your public key for pushing to git. Save that on the 
target server somewhere.

Then, in your server:

    $ git clone https://github.com/shuhaowu/gioku.git
    $ sudo gioku/scripts/install-prod.sh

You should get a prompt for the full path of your key, try to get it right the
first time as the bash script is not very good at running the second time.

It will also prompt for a domain name. Give the domain name in the form of 
yourdomain.com. All of the sites you create will be 
served as subdomains of this domain. Right now a custom domain for each site
is not completed and is the next thing on my radar.

Now you should go ahead and point yourdomain.com to this server. You should
also setup a wildcard entry for all the subdomains and point it to the server
as well.

Use
---

You can use [gitolite-admin](http://gitolite.com/gitolite/admin.html) to 
manage websites. Create a new gitolite repository and that will become a 
website accessible under reponame.yourdomain.com

 - index.html is mapped as the index.
 - /404.html will be displayed in event of 404.
 - /403.html for 403.

