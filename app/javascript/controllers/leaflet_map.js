document.addEventListener('DOMContentLoaded', function() {
    // 地図の中心地を定義
    waypoints = gon.waypoints
    var map = L.map('mapid').setView([waypoints[1].longitude,waypoints[1].latitude], 11);

    // タイルレイヤーを取得
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; <a href="https://openstreetmap.org">OpenStreetMap</a>',
      maxZoom: 18
    }).addTo(map);

    var latlngs = [];
    waypoints.forEach(function (point) {
        L.marker([point.longitude, point.latitude], { title: point.name }).addTo(map);
        latlngs.push(new L.LatLng(point.longitude, point.latitude));
    });
    latlngs.push(new L.LatLng(waypoints[0].longitude, waypoints[0].latitude));
    var line = L.polyline(latlngs, {snakingSpeed: 200});
    line.addTo(map).snakeIn();
    path.snakeIn();
});
