# Test Plan

We're going to build an object model of the site. Rspec tests will use this model to drive a browser and make assertions.
If this was a real project, the site model would be a separate gem.
 
Pulling your automation apart from tests is important. You can use this site model to build a crawler that can
simulate customer behavior or help automate Localization QA.

Also, you can use this site object from IRB, which is really sweet.

## Team Creation
Use the site object model to automatically create a single team with simple inputs. Cleanup is out of scope for this demo.

## Job Creation
Use the site object model to automatically create a single job with simple inputs. Given that providing a date is required and 
the calendar does not behave as expected, this workflow is difficult to complete and I have given up trying to create a job. 
It may be possible, but I'd need to confer with someone better at front-end stuff that me.
We can talk about the calendar problems if you want to follow up with me further.

# How to run

Tested on Ruby 1.9.3 and 2.2.3

```
bundle install
bundle exec rake build
```

To run tests without Rubocop

```
bundle exec rake spec
```

# From IRB
```
require 'lib/site/jobs'
wonolo = Site::Wonolo.new # you can now navigate the site 
```

  
