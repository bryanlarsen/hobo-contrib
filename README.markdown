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
into hobo-contrib.javascript and stylesheets into hobo-controb.css.
If you wish to use the individual files, they are available in
vendor/plugins/hobo-contrib/public.
    
You then need to include the taglib, e.g. in application.dryml:

    <include src="hobo-contrib-all" plugin="hobo-contrib"/>

In the future, some tags may have additional install requirements.

Alternatively, you may wish to only include certain tags.  In that
case you may use a form such as:

    <include src="select-one-or-field-list" plugin="hobo-contrib"/>

If you use this form, you will also have to include any possible
javascript or stylesheet assets manually:

    <extend tag="page">
       <old-page merge>
         <append-head:>
           <javascript name="select-one-or-field-list" />
         </append-head:>
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

[Auto generated documentation](http://bryanlarsen.github.com/hobo-contrib/documentation.html).

## Other Hobo Plugins

* [Hobo YUI](http://github.com/tablatom/hoboyui/tree/master)
* [Paperclip with Hobo](http://github.com/tablatom/paperclip_with_hobo/tree/master)

## Possibly out of date plugins

* [Hobo has_many_polymporphs](http://github.com/al2o3cr/hobo_has_many_polymorphs/tree/master)
* [open_id_authentication_for_hobo](http://github.com/hallettj/openid_authentication_for_hobo/tree/master)

