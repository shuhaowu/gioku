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
served as subdomains of this domain. You can also use custom domains for each
website. More on that later.

Now you should go ahead and point yourdomain.com to this server. You should
also setup a wildcard entry for all the subdomains and point it to the server
as well.

Use
---

You can use [gitolite-admin](http://gitolite.com/gitolite/admin.html) to
manage websites. Create a new gitolite repository and that will become a
website accessible under reponame.yourdomain.com

For example, you can add a site called "mrrowl" with the following appended to
gitolite.conf:

    repo mrrowl
      RW+ = @all

Commit that and push the gitolite admin repo (again, see gitolite's docs for more
details).

Now clone the mrrowl repository

    $ git clone git@yourdomain.com:mrrowl.git

Make some changes

    $ cd mrrowl
    $ echo "<h1>It's a mrrowl!</h1>" > index.html

Commit and push:

    $ git add .
    $ git commit
    $ git push
    Counting objects: 5, done.
    Writing objects: 100% (3/3), 252 bytes, done.
    Total 3 (delta 0), reused 0 (delta 0)
    remote: Pushing changes to production...
    remote: Pushed 81465048f05aa87666521ea82cfa18a1be0d8e4e to production!
    To git@yourdomain:mrrowl.git
       6b74cc3..8146504  master -> master

Now browse to http://mrrowl.yourdomain.com to see your new site!

Let's say now you want to specify a custom domain for your website, you can
do so by specifying a file called CNAME with one line. Just like Github pages.

    $ echo -n "mrrowl.io" > CNAME
    $ git add .
    $ git commit
    $ git push origin master

Now you can go to http://mrrowl.io and get the same as if you were coming from mrrowl.github.io.

Some more logistics
-------------------

In your repositories:

 - index.html is mapped as the index.
 - /404.html will be displayed in event of 404.
 - /403.html for 403.
 - /CNAME

