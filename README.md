# Rails application templates for CanCan testing

The title says it all. This is just a couple of templates to create
quick projects with CanCan only for testing purposes. I hope to make it
easy for bug reporters to create dummy apps so that it's easier for
project maintainers to investigate some of the tricky issues. 


# Templates

## ActiveRecord
This is for creating a cancan application with activerecord as ORM. It
uses sqlite3 as the default ORM.

## Mongoid
This is for creating a cancan application with mongoid as ORM. Please
note that when creating the application one should use
--skip-active-record explicitly.
 
## Datamapper

Still need to do this. Haven't really seen any datamapper issues. Is
anyone using datamapper now days?


# Usage

## ActiveRecord

Please run the following command:

<pre>
rails new cancan-test --skip-bundle -m https://raw.github.com/andhapp/rails-application-templates-for-cancan-testing/master/activerecord-application-template.rb 
</pre>


## Mongoid

Please run the following command:

<pre>
rails new cancan-test --skip-active-record --skip-bundle -m https://raw.github.com/andhapp/rails-application-templates-for-cancan-testing/master/mongoid-application-template.rb 
</pre>


# Models

It creates two models, namely, User and Company since this is just going
to be a small app for replicating the issues.
