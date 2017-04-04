# WikipediaRadio
Bash Script to automate the  extraction of Wikipedia data dumps, parsing out the articles, have them read by Friend Computer via PIco2Wave/Lame and move those recordings into Internet Archives library. 

While this was made for a particular project I have kept the code as generic as possible so that anyone can use it to automate 
bulk renderings of text into mp3. The function to upload to the Internet Arachive can be easily disabled if that is not needed. 


Required 
Lame
Pico2Wave
WikiExtractor -  https://github.com/attardi/wikiextractor 
InternetArchive Library Tools - https://internetarchive.readthedocs.io/en/latest/installation.html


What is WikipediaRadio?
A growing collection of Wikipedia Articles read by Friend Computer. 


Use for streaming, podcasts, radio, blind/sight impaired reading of wikipedia, mixing, mashing and other unlisted activities. Continued exposure may cause increased knowing. 

()All articles read by Friend Computer are extracted from the  enwiki-20170320-pages-articles data dump. 
()Data was extracted using WikiExtractor https://github.com/attardi/wikiextractor 
()Friend Computer uses Pico2Wave to read the extracted articles.
()mp3 recordings are moved into the greater Internet Archive library using the InternetArchive Library tools https://internetarchive.readthedocs.io/en/latest/installation.html
()All of the above is managed by a bash script created for the purpose of aiding Friend Computer's mission of knowledge distribution  https://github.com/tomhiggins/WikipediaRadio
