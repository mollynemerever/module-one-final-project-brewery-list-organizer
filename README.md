# Brewery List Organizer

Welcome to the Brewery List Organizer! The intent of this application is to help users discover new breweries and add them to their personalized "wishlist". This application runs through your CLI and is connected to a database containing thousands of breweries across the United States.  Users have the ability to search for a brewery based on name, city, or state.  Users can also add a brewery to their wishlist, remove breweries from their wishlist, and view their current wishlist. Happy browsing!


## Getting Started
1. Fork the repository and clone to your computer
2. Run the following commands through your terminal:
   -  `bundle install`
   -  `rake db:migrate`
   -  `rake db:seed` (will populate the brewery database from the API)
   -  `ruby bin/run.rb` (starts program!)

note: if you wish to run the program another time, no need to run the first three commands. simply typing `ruby bin/run.rb` will start the program. 

## API
This application accesses the free API from Open Brewery DB. Thank you for allowing us to utilize your resources!
https://www.openbrewerydb.org/

## Video Demonstration
Click the link below for a brief video demonstration of this application.
https://youtu.be/mwY10a3bq2A

![Brewery List Organizer CLI Application](https://github.com/mollynemerever/module-one-final-project-brewery-list-organizer/blob/master/image/Image%203-7-19%20at%204.21%20PM.jpg)


## Authors
Anders Hornor - Flatiron School Seattle
https://github.com/anders1216

Molly Nemerever - Flatiron School Seattle
https://github.com/mollynemerever


## Contributing
We welcome contributions! Please feel free to open a pull request or branch from this project.


## Project Notes
This application was the first project during the Flatiron School Software Engineering Immersive program. The project is the capstone of the first model within the curriculum. Primary focuses were: Object Oriented programming through Ruby, SQL, ORMs, and using ActiveRecord. We hope that this project displays our knowledge and proficency in these topics.  
https://flatironschool.com/

## License
MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
