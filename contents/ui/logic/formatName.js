function displayName(currentId, desktopIds, desktopNames) {
    desktopIds = desktopIds || [];
    desktopNames = desktopNames || [];
    var idx = desktopIds.indexOf(currentId);
    var name = (idx >= 0 && idx < desktopNames.length) ? desktopNames[idx] : "";
    if (name && name.trim().length > 0) return name;
    return "Desktop " + (idx >= 0 ? idx + 1 : 1);
}

if (typeof module !== "undefined") module.exports = { displayName: displayName };
