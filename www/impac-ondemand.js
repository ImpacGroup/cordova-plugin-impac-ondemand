

// Empty constructor
function ImpacOnDemand() {}


ImpacOnDemand.install = function() {
    if (!window.plugins) {
        window.plugins = {};
    }
    window.plugins.impacOnDemand = new ImpacOnDemand();
    return window.plugins.impacOnDemand;
}
cordova.addConstructor(ImpacOnDemand.install);
