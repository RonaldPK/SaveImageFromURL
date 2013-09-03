/**
 *  saveImage.js
 *  Cordova Save Image Plugin
 *
 *  Created by Ronald Klip ((github.com/RonaldPK)) on 22-08-2013.
 *  Copyright 2013 Ronald Klip. All rights reserved.
 *  MIT licensed
 */

var SaveImage = function () {

};

SaveImage.prototype = {
    /**
     * Save image from URL.
     */
    saveImageFromURL: function (url, cbRef) {
			   cordova.exec(null, null, 'SaveImage', 'saveImage', [{url: url, cbMethod : cbRef}]);
    }
		   
};

var saveImage = new SaveImage();

module.exports = saveImage;
