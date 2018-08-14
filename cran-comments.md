## Test environments
* local OS X install, R 3.4.4
* ubuntu 14.04 (on travis-ci), R 3.4.4
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 0 note

## Notes
This submission corrects the error in how tests were run.  I used environment variables in development to create the API credential.  While this will not work on CRAN, I had not setup the package to skip the tests.  