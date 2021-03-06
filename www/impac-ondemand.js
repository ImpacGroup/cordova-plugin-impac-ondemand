

// Empty constructor
function ImpacOnDemand() {}

ImpacOnDemand.prototype.loadResource = function(tag, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'ImpacOnDemand', 'loadResource', [tag]);
}

ImpacOnDemand.prototype.getPath = function(fileName, fileExtension, successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'ImpacOnDemand', 'getPath', [fileName, fileExtension]);
}

ImpacOnDemand.install = function() {
    if (!window.plugins) {
        window.plugins = {};
    }
    window.plugins.impacOnDemand = new ImpacOnDemand();
    return window.plugins.impacOnDemand;
}
cordova.addConstructor(ImpacOnDemand.install);
