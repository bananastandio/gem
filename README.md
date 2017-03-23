# Banana Stand API Gem
Provides a Ruby interface to interact with the Banana Stand API.

# Usage and Installation
***Please see https://www.bananastand.io/resources/ruby_gem.html for instructions***

# TODO
* Add automated tests and hook into travis
* Update the `BananaStand::Client` so that it lets `BananaStand::Models::Base` class handle model instantiation 

# License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

# Tips
* Because we're using `method_missing` for attribute data accessors, if the API call fails or doesn't find anything then it will give a "method missing" error instead of `nil`. This can be confusing, so keep it in mind.

# Contributing
### How to contribute
To contribute to the repository:

1. Fork the repository.
2. Clone the forked repository locally.
3. Create a branch descriptive of your work. For example "my_new_feature_xyz". 
4. When you're done work, push up that branch to **your own forked repository** (not the main one).
5. Visit https://github.com/bananastandio/gem and you'll see an option to create a pull request from your forked branch to the master. Create a pull request.
6. Fill out the pull request template with everything it asks for and assign the pull request to someone to review.
7. Set the reviewee as yourself and the requested reviewer as whomever you want to review your PR.
8. Once the PR merges into master then it is ready for production and should be treated as such. It will be deployed to staging within minutes.

### Getting your PR approved
A few key things to note:
* PRs must be approved by all requested reviewers before you can merge.
* After you implement changes requested from a reviewer then post back with a :recycle: to say something like `:recyle: Ready for you to look again at it please.`. **Note:** If you do not do this then you PR may not ever get re-reviewed after comments are taken into acocunt.
* If a PR comment starts with a :beer: then it is just a suggestion and preference of the reviewer and the comment is NON-blocking. That is, your PR may still be approved with these comments.
* If a PR comment starts with a :tipping_hand_man: then it is just informative and requires no action. It's like a "FYI"
* All other PR comments probably need to be addressed unless otherwise agreed by the reviewer.
* After a PR has been approved then you are free to merge.
* PR reviews will happen ASAP but generally within 24 hours. 


### Design and Code Standards
#### General Standards
Configure your IDE or code editor with the following:
* Use 4 spaces - NOT tabs.
* Add new line at the end of every file.

#### Ruby Style
Follow the [Community-driven Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide).

##### Other Considerations
1. Keep methods and classes small and sweet. [Follow SRP](https://en.wikipedia.org/wiki/Single_responsibility_principle).
2. If you're adding a lot of comments in your code you probably should consider whether or not that code should be broken up into multiple methods. This is 95% the case.
3. Use yardoc syntax for method docs. You only need to document public methods (private methods can be doc'd optionally)
