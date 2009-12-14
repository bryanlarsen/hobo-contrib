# Hobo Contrib

This is a simple Rails plugin that works with
[Hobo](http://hobocentral.net).

It consists of a variety of tags that can be used unchanged with
Hobo.  Each tag is too small to warrant the overhead of being a
separate plugin.

Any tag in this library may become part of Hobo in the future, if 
[Tom Locke](http://github.com/tablatom) so ordains.

## Installing

Install with

    ruby script/plugin install git://github.com/bryanlarsen/hobo-contrib.git

The plugin has an install script which will copy some assets to your
public directory.  The install scripts concatenate all javascripts
into hobo-contrib.js and stylesheets into hobo-contrib.css.  If you
wish to use the individual files, they are available in
vendor/plugins/hobo-contrib/public.  

If you download a new version of hobo-contrib, please be sure to
update your local hobo-contrib.js and hobo-contrib.css with:

    rake hobo_contrib:update_assets   

This is also useful if you installed hobo-contrib via git rather than
using script/plugin.
    
You then need to include the taglib, e.g. in application.dryml:

    <include src="hobo-contrib-all" plugin="hobo-contrib"/>

Alternatively, you may wish to only include certain tags.  In that
case you may use a form such as:

    <include src="select-one-or-field-list" plugin="hobo-contrib"/>

If you use this form, you will also have to include any possible
javascript or stylesheet assets manually:

    <extend tag="page">
       <old-page merge>
         <append-head:>
           <javascript name="feckless-fieldset" />
         </append-head:>
         <before-app-stylesheet:>   
           <stylesheet name='feckless-fieldset.css' />
         </before-app-stylesheet:>
       </old-page>
    </extend>

## Contributing

If the end user will have to edit your tag before use, please create a
[recipe](http://cookbook.hobocentral.net/recipes) instead.

If your tag is small and self contained, please send
[me](http://github.com/bryanlarsen) a pull request or an email.

If your contribution is large or has external dependencies, please
create your own plugin and send me the link.

## Documentation

[Auto generated documentation on GitHub](http://bryanlarsen.github.com/hobo-contrib/documentation.html).

[Auto generated documentation on HoboCentral](http://cookbook.hobocentral.net/plugins/hobo-contrib)

## Testing

There are some additional tests available for this project in the [contrib-test branch of the agility tutorial on github](http://github.com/tablatom/agility/blob/contrib-test).

