/*global cordova, module*/

module.exports = {
    appInvite: function (appLinkUrl, previewImageUrl, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "InviteAppLinks", "appInvite", [appLinkUrl, previewImageUrl]);
    },
    canShow: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "InviteAppLinks", "canShow", []);
    }

};

cordova.exec(function(){}, function(){}, "InviteAppLinks", "canShow", []);
