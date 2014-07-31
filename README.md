GitHub: https://github.com/yulia-kravchuk/TestTrivago

--------------- Technologies ------------

One of the main criteria was using free tools (or with trial versions available) because I was working from my home PC.
As we are testing end-user application it is very natural to use BDD
(especially taking into account it was mentioned in job description).
I worked closely only with Cucumber so I decided to use it.
Selenium is one of the most popular Web testing tools, I know it a bit and it's free.
It would be natural to use Selenium + Java (because Selenium is on Java) but Cucumber is on Ruby.
Finally I decided to use Ruby because for me it seemed easier to integrate Selenium and Ruby than Java and Cucumber.

Browser: Firefox to start with. It works very nice and fast with xpath so I tried to use xpath locators most of the time.

Git is just convenient and powerful tool. And it's free.

------------ How to run tests -----------

Prerequisite: Mozilla Firefox is installed.

1. Install Ruby 193 from http://rubyinstaller.org/downloads/ 
(http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-1.9.3-p545.exe?direct)

2. Go to ..\Ruby193\bin and run 
gem install bundle

3. Extract the project into some folder on your disk (or clone git repository).

3. Go to project folder ..\TestTrivago and run
bundle install
selenium install

4. Run tests
rake features
