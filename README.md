Cordova Save Image From URL -Plugin
====================

A very simple plugin for Cordova 3.x.x to save an image from a URL.

by Ronald Klip ([github.com/RonaldPK](https://github.com/RonaldPK))

## Supported Platforms ##
- **iOS**

## Adding the Plugin to your project ##
Through the [Command-line Interface](http://cordova.apache.org/docs/en/3.0.0/guide_cli_index.md.html#The%20Command-line%20Interface):
```
cordova plugin add https://github.com/RonaldPK/SaveImageFromURL.git
```

## Release Notes ##
#### Version 1.0.0 (22-08-2013) ####
- Initial release.

## Using the plugin ##
The plugin creates the object ```window.plugins.saveImage``` with one method:

### saveImageFromURL() ###
Takes two parameters: url and a string with the name of the callback method
```javascript
window.plugins.saveImage.saveImageFromURL(url, cbRef);
```

The plugin returns 1 on success and 0 on failure. Failure is most likely due to the app not having access to the user's Photos.

####  Example ####
```javascript
var myCallbackMethod = function(returnVal) {console.log(returnVal);}
window.plugins.saveImage.saveImageFromURL('http://www.example.com/path/to/image.png', 'myCallbackMethod');
```
