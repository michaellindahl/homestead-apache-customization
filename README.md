# homestead-apache-customization
Files used in homestead's config directory for using Apache instead of nginx with Homestead

# install homestead
In order for homestead to use the custom config.rb located in the config directly you need
to use the fork of homestead that will read this file with the Homestead.yaml file. You may
install this globalling by modifying composer's composer.json file:

```{
    "repositories": [
        {
            "type": "vcs",
            "url": "https://github.com/michaellindahl/homestead"
        }
    ],
    "require": {
        "laravel/homestead": "dev-additional-config"
    }
}```
