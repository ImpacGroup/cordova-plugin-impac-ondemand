

// Empty constructor
function ImpacOnDemand() {}

ImpacOnDemand.prototype.loadResource = function(successCallback, errorCallback, tag) {
    cordova.exec(successCallback, errorCallback, 'ImpacOnDemand', 'loadResource', tag);
}

ImpacOnDemand.install = function() {
    if (!window.plugins) {
        window.plugins = {};
    }
    window.plugins.impacOnDemand = new ImpacOnDemand();
    return window.plugins.impacOnDemand;
}
cordova.addConstructor(ImpacOnDemand.install);
