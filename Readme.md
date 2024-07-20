# Discourse Brand Header for tiaa-forum.org
## Use
This repository contains the files required for the "Brand Header" (header above main 
Discourse header on top of the forum home page), as well as a few files/scripts to support
the development and support of these files
## Repo Design Conventions
This repository comprises 3 branches:
- prod - this is for production (should be pretty stable)
- test - use this branch to get a header for the test instance (used for testing/staging)
- dev - this branch is where development happens, usually on a localhost machine...

When making commits, use a title prefix of "PROD:", "TEST:", or "DEV:" to differentiate
things like configuration changes that are different between the branches. Thus, all merges
should use `git cherry-pick ...` to exclude things that shouldn't be used between branches
(like assets, path names, etc.).

## bin/package.sh
Normally, this repository should be installed on the target site directly from GitHub the 
repository at this [link](https://github.com/tiaa-forum-org/TIAA-BrandThemeComponent) using 
the appropriate branch (prod, test, or dev) for the purpose. However,
when testing and/or evaluating changes, it's useful to load the header as a .zip package.
This allows you to make temporary edits and adjustments to files before commiting them into
the repository.

In the /bin directory of the repository, there is a bash script (package.sh) that creates a
zip file that can be created from a clone of the repository. A minimal familiarity of
shell commands and ```git ...```/GitHub is presumed...

Steps required are:
1. Open a terminal window and cd into a temporary directory you want to use for staging the
repository
2. Open a browser and navigate to the repository at this 
[link](https://github.com/tiaa-forum-org/TIAA-BrandThemeComponent).
3. In the GitHub browser window, select the ```<code>``` button to get the https:... link for the repository.
4. Copy this link into your clipboard.
5. In the terminal window:
   - type ```git clone <paste the link to the repository>```
   - cd into the directory created
   - type ```git branch --show-current``` which should return the branch ```prod``` since that's the default branch
   - if you want to create a package with either the test or dev branches:
     - type ```git checkout <either 'test' or 'dev'>```
     - now ```git branch --show-current```should return the desired branch name
   - cd into the bin directory
   - type ```./package.sh <directory writeble by you>``` - you can use a temporary directory 
     (like /tmp or~/Downloads) since this will only be used for uploading to the Discourse server
   - this will create a zip archive file with a prefix of 'TEST:' or 'DEV:' if not prod and a suffix of the current date/time.
6.You can then go to your Discourse instance and go to admin->customize->theme->components and install the 
.zip archive from your local device.

If modifications have been made and tested, they can then be edited on or committed and pushed 
to GitHub. Once changes are made using source control they should be verified/tested again. 