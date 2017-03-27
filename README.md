# README

* Production URL: keep-up-1.herokuapp.com

Keep Up is an application that converts articles into speech that the user can then listen to like they would a podcast. This was a personal project that I built in just over 2 weeks. I used Aylien(text extraction) and AWS(Amazon Polly for text to speech and S3 for storage) to build this application.

* Note: Gmail account is required to use the application as of right now.

* Usage: To use the application create an account by going through Google OAuth process. Once there you can create a list. Once a list has been created you can simply drag the url of any article that you want to convert to audio and click Create Article. Please note that it might take a little while for longer articles due to the fact that Amazon Polly limits Text to Speech to 3000 characters so the article needs to be broken down, converted individually, merged back together, and then stored on S3.
