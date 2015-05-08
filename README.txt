
Uploading files
My first thought was to have upload_problems.exe put the files in a specific course's 'templates' directory:
export TARGET_DIR="/opt/webwork/courses/$COURSE/templates"

The problem is that all the files in those directories are owned by
the www-data account, and I'm afraid that creating files/directories
owned by wwadmin (the user I'm supposed to use) will cause problems when Apache tries to copy/rename files.

Model 1: 
- have no problems in the root "ProblemLibrary" directory, but in subdirectories like 'Calculus'
- in the /opt/webwork/courses/$COURSE/templates,  make the problem subdirectories owned by wwadmin, so wwadmin can use rsync to update the problems.

When using this model, the problems can be accessed through 
Library Browser
Local Problems
Local Problems: [drop down - select appropriate directory like Calculus] 

---------------------
Model 2:
- create a symlink to another directory (parallel to the 
Library -> /opt/webwork/libraries/NationalProblemLibrary link in each course)
and have _that_ directory owned by wwadmin; Apache only reads the files, and if edits are made they are saved in the local directory.

Created a /home/wwadmin/ProblemLibrary directory
Uploaded the problems into that directory (rsync from local files)

cd /opt/webwork/courses/MATH121_test/templates/

Created a symlink from wwadmin's library directory to the templates in a course 
sudo ln -s /home/wwadmin/ProblemLibrary/ LibraryQueens

To access the upload problems:
Library Browser
Local Problems
Local Problems: [drop down - select appropriate directory like LibraryQueens/Calculus] 

That seems to work quite nicely: I'll stick with that model for now.

---

Rogawksi database

Provided by the publisher via Catriona Kaplan <CKaplan@whfreeman.com>

Uploaded alongside our local problems.  

There was an issue with running them, though, because of the line

loadMacros("freemanMacros.pl");

File can be found:
wwadmin@WebworkAug2011:/opt/webwork$ find -name freemanMacros.pl
opt/webwork/libraries/NationalProblemLibrary/macros/CollegeOfIdaho/freemanMacros.pl

but its in the College of Idaho database.

Finding the other macros:
find -name "PGchoicemacros.pl"
/opt/webwork/pg/macros/PGchoicemacros.pl

Create link between the Idaho directory and the regular macro directory
ln -s /opt/webwork/libraries/NationalProblemLibrary/macros/CollegeOfIdaho/freemanMacros.pl freemanMacros.pl

---

Creating a Queen's Macro file

(i.e. to have functions for creating common function types)

Looked at parserPopUp.pl as a model from

/opt/webwork/pg/macros/parserPopUp.pl 

Created 

QUpolynomialmacros.pl

with functions Queens::CreateRandomPolynomial

There are now problems with the reverse namespace (i.e. I need to include 
main::Compute, instead of just using
Compute
but it works as desired.

---

Creating the file uploading capability for images.

Was pointed to the Perl library Catalyst
http://search.cpan.org/~zigorou/Catalyst-Plugin-Upload-Image-Magick-0.03/lib/Catalyst/Plugin/Upload/Image/Magick.pm

which uses imageMagick to handle things

sudo apt-get install perl-doc
perl -MCPAN -e shell
upgrade CPAN
(exit and re-enter perl MCPAN shell; I know there's a way to reload, but I can't remember it right now)
install Catalyst 

Not surprisingly, this requires a _huge_ number of other packages to
work, with lots of prompts to get even close to installation.

Got it installed now.

---

Testing bed: having the files handled under Apache's 

/var/www 

directory, instead of Webwork, to avoid any override of configuration.

Change ownership to www-data
cd /var/
sudo chown www-data -R www  # owner to = Apache
sudo chgrp wwdata -R www   # group = Apache + wwadmin account
sudo chmod g+w -R www  # let group members edit the files

Created a /var/www/FileUpload directory
Created a modified index file there, and ...
http://r140.n100.queensu.ca:8090/FileUpload/index.html  works!
I think this means I can spin off any PHP/Javascript/Catalyst work into the /var/www directory, and not have webwork mangle it! =]

Next two tests:
- get a button in a Webwork question that opens a window, via a link to a non-Webwork page.
- get that putton to pass on information about the question (student, assignment, problem number) 
- get a file uploading system to work in basic form 
- get a file uploading system to work 


--- Catalyst is looking like overkill;  trying a simpler php option.

Installing php

sudo apt-get install php5

Confirm /etc/apache2/mods-enabled has
php5.load
php5.conf

Don't know what tweaking finally made PHP files work (instead of being
downloaded), but it seems fine now. Trying the file uploading...

---

Uploader PHP code:

http://www.ajaxf1.com/product/ajax-file-upload.html

In ~/wwadmin

chgrp -R wwdata *  # match files to server group
chmod g+w -R * # let the group members write to this directory RISKY!

Install Dropbox

With the directory specified in upload.php being /tmp/, the upload works fine.

Ah! It was a privilege issue and a poor choice of directory.

Now we have the cycle working:
 - upload a file via the web server
 - have it stored in ~wwadmin/Dropbox
 - Dropbox synchronizes it to the desktop.
Yay! 
(Just be careful to review the permissions and group ownership if the upload is unsuccessful.) 

(Also be careful to reset the privileges on .ssh, so that you can tunnel in without a password!)

--- 

Now to connect the question properites and button to the image uploader.

Webwork/ProblemLibrary/macros/QUuploadfilesmacros.pl

I have the button in place, but the default of having the button
'submit' the form is failing because the entire question is wrapped in a <form>. <form>
[boilerplate]

[the actual question, under author control]

</form>

This means that I can't easily overload the form with a submit button.
Options:
- make a non-form button instead, that's just a link.  Sounds easy to do, but it will require passing the student netID, problem and assignment in as part of the URL (and so visible to students, and changeable by students; not so good).
- from within the problem, overload (if I can) the function called by the main problem form, set by: 

<form ...., onsubmit="submitAction()" name="problemMainForm".

i.e. write my own 'submitAction' function within the problem and see
if I can direct my own button's submit process to the image uploader.
That sounds more problematic and harder to test, so I'll try that only
if the other method seems too insecure in the end.

---

Button link: working as desired.  Can include it in a question, and
the uploade button takes you to the upload screen.

To do next: have it include the student ID, problem, and set in the URL

Working!  I pass the student ID and set number now in the URL, and the
index.php file can parse it and interpret it, and create the appropriate filename replacement.

TODO: look at how the .pg files can include javascript: I think I
_can_ overload the action javascript function, because there's a way
to include problem code very early in the final HTML for the problem
page.

CRAP!  I added the same feature to a second problem, and instead of
getting the real student ID, I'm getting the perl string,
$studentLogin verbatim.  Don't know what's going on right now, but
I've got to pick up the car from the shop, so it will have to wait.

Next day...

The problem is repeating itself.  I even put a wrapper of

    my $studentLogin = "NoIDDefined";
    if (defined($envir{studentLogin})) {
	$studentLogin = $envir{studentLogin};
    }
but as still getting the literal '$studentLogin' on my second question.

Ah! I had  single quotes in the QUuploadfilesmacros.pl function, which meant no interpolation.  (Of course, that begs the question of how the heck it was working for the other problem...)

Now I'm getting the undefined IDs for both questions.  Apparently the
'defined' function isn't doing what I want, because I was getting IDs
before at least for one problem.  Even taking out the 'defined', I've lost 

Looked at other macro files, and they have $main::envir instead of
$envir.  I'm trying that.

Worked!!!!

---

Testing the ssh key for GitHub
