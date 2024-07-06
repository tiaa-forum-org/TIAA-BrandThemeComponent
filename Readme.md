# Discourse Brand Header for tiaa-forum.org
## Use
This repository contains the files required for the "Brand Header" (header above main 
Discourse header on top of the forum home page), as well as a few files/scripts to support
the development and support of these files
## Repo Design Conventions
This repository is comprised of 3 branches:
- prod - this is for production (should be pretty stable)
- test - use this branch to get a header for the test instance (used for testing/staging)
- dev - this branch is where development happens, usually on a localhost machine...
When making commits, use a title prefix of "PROD:", "TEST:", or "DEV:" to differentiate
things like configuration changes that are different between the branches. Thus, all merges
should use `git cherry-pick ...` to exclude things that shouldn't be used between branches
(like assets, pathnames, etc.).

