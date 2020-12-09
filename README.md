# Ruby on Rails Tutorial 6th Edition Gemfiles

These are the latest Gemfiles for the [*Ruby on Rails Tutorial*](https://www.railstutorial.org/) (6th Ed.) by [Michael Hartl](https://www.michaelhartl.com/). To the extent that there’s any difference, readers of the *Ruby on Rails Tutorial* should always use these Gemfiles in preference to the ones listed in the book.

The Gemfiles in the [online version](https://www.railstutorial.org/book) should always match those shown below. Ebooks purchased from [railstutorial.org](https://www.railstutorial.org/) or [Learn Enough](https://www.learnenough.com) should also match automatically as long as you’ve downloaded the latest version, which you can find on your [Purchases page](https://www.learnenough.com/account/edit#settings-purchases). (You may have to [clear your browser cache](https://www.digitaltrends.com/computing/how-to-clear-your-browser-cache/) first.)

## The Gemfiles

* `hello_app` from Chapter 1 of the [`Ruby on Rails Tutorial`](https://learning.oreilly.com/library/view/ruby-on-rails/9780136702726/)
  - Initial [`Gemfile`](https://github.com/mhartl/rails_tutorial_6th_edition_gemfiles/blob/master/hello_app/Gemfile) 
  - Final [`Gemfile`](https://github.com/mhartl/rails_tutorial_6th_edition_gemfiles/blob/master/hello_app/Gemfile_final)
* `toy_app` from Chapter 2 of the [`Ruby on Rails Tutorial`](https://learning.oreilly.com/library/view/ruby-on-rails/9780136702726/)
  - [`Gemfile`](https://github.com/mhartl/rails_tutorial_6th_edition_gemfiles/blob/master/toy_app/Gemfile)
* `sample_app` from Chapters 3–14 of the [`Ruby on Rails Tutorial`](https://learning.oreilly.com/library/view/ruby-on-rails/9780136702726/)
  - Initial [`Gemfile`](https://github.com/mhartl/rails_tutorial_6th_edition_gemfiles/blob/master/sample_app/Gemfile_initial)
  - Final [`Gemfile`](https://github.com/mhartl/rails_tutorial_6th_edition_gemfiles/blob/master/sample_app/Gemfile)

*Note*: The easiest way to copy a Gemfile is to click on the relevant link and then select “Raw”. Selecting all (Ctrl/Cmd-A, depending on system) and copying (Ctrl/Cmd-C) then lets you paste (Ctrl/Cmd-V) into your application’s Gemfile.

# More applications as part of this training

* `foodlog` This Ruby on Rails application is part of a crash course published on [Traversy Media](https://www.traversymedia.com/) authored by Andy Leverenz of [@webcrunchblog](https://twitter.com/webcrunchblog) creator of [web-crunch.com](https://web-crunch.com) and the course [Hello Rails](https://hellorails.io). A beginner food log project to start learning the Ruby on Rails framework, this will give you the scope of what Ruby on Rails is like in 2020.

* `grapeapi_app` This is a Ruby on Rails API REST-based application that is part of the RubyonRails Mentoring Program 2020Q4 [MX] [Cerner]. The goal of this application is to create a Rails API application using the [Grape](https://github.com/ruby-grape/grape) gem. As part of this application I'm using the [httparty](https://github.com/jnunemaker/httparty) to make HTTP GET requests to the [Google Books](https://developers.google.com/books/docs/v1/using#WorkingVolumes) API.

* `reactOnRailsWithWebpacker` This is a React on Rails application that is the frontend side that will be using our API application (grapeapi_app). This is part of the RubyonRails Mentoring Program 2020Q4 [MX] [Cerner]. The goal of this application is to have the GUI/UI side that is the frontend portion and is being used by our API application (grapeapi_app). This will be using [React](https://reactjs.org/) and [Webpack](https://webpack.js.org/)..
