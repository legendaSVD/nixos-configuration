.pragma library
function getLayout(name, mx, my, mw, mh) {
    let base = {
        "battery":   { w: 480, h: 760, rx: mw - 500, ry: 70, comp: "battery/BatteryPopup.qml" },
        "volume":    { w: 480, h: 760, rx: mw - 500, ry: 70, comp: "volume/VolumePopup.qml" },
        "calendar":  { w: 1450, h: 750, rx: Math.floor((mw/2)-(1450/2)), ry: 70, comp: "calendar/CalendarPopup.qml" },
        "music":     { w: 700, h: 620, rx: 12, ry: 70, comp: "music/MusicPopup.qml" },
        "network":   { w: 900, h: 700, rx: mw - 920, ry: 70, comp: "network/NetworkPopup.qml" },
        "stewart":   { w: 800, h: 600, rx: Math.floor((mw/2)-(800/2)), ry: Math.floor((mh/2)-(600/2)), comp: "stewart/stewart.qml" },
        "monitors":  { w: 850, h: 580, rx: Math.floor((mw/2)-(850/2)), ry: Math.floor((mh/2)-(580/2)), comp: "monitors/MonitorPopup.qml" },
        "focustime": { w: 900, h: 720, rx: Math.floor((mw/2)-(900/2)), ry: Math.floor((mh/2)-(720/2)), comp: "focustime/FocusTimePopup.qml" },
        "guide":     { w: 1200, h: 750, rx: Math.floor((mw/2)-(1200/2)), ry: Math.floor((mh/2)-(750/2)), comp: "guide/GuidePopup.qml" },
        "wallpaper": { w: mw, h: 650, rx: 0, ry: Math.floor((mh/2)-(650/2)), comp: "wallpaper/WallpaperPicker.qml" },
        "hidden":    { w: 1, h: 1, rx: -5000 - mx, ry: -5000 - my, comp: "" }
    };
    if (!base[name]) return null;
    let t = base[name];
    t.x = mx + t.rx;
    t.y = my + t.ry;
    return t;
}