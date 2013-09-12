      function initialize() {
        var polaresco = new google.maps.LatLng(45.690792, 9.633909);
        var parkicon = '/images/parkinglot.png';
        var markericon = '/images/ldmarker.png';
        var canvas = document.getElementById('map_canvas');
        var mapOptions = {
          center: polaresco,
          zoom: 16,
          mapTypeId: google.maps.MapTypeId.HYBRID
        };
        var map = new google.maps.Map(canvas, mapOptions);
        var marker = new google.maps.Marker({
          position: polaresco,
          map: map,
          icon: markericon,
          clickable: true,
          title: 'Linux Day 2013 by BGlug'
        });
        var parcheggio_polaresco = new google.maps.Marker({
          position: new google.maps.LatLng(45.691166, 9.634617),
          map: map,
          icon: parkicon,
          title: 'Parcheggio Polaresco'
        });
        var parcheggio_scuole = new google.maps.Marker({
          position: new google.maps.LatLng(45.691886, 9.634092),
          map: map,
          icon: parkicon,
          title: 'Parcheggio Scuole'
        });
        var parcheggio_c6 = new google.maps.Marker({
          position: new google.maps.LatLng(45.691342, 9.631018),
          map: map,
          icon: parkicon,
          title: 'Parcheggio C6'
        });
        // events
        var infocontent = "<b>Spazio Polaresco</b><br/>Via del Polaresco, 15<br/>Bergamo<br/><a href=\"https://maps.google.it/maps?f=q&source=s_q&hl=it&geocode=&q=Spazio+Polaresco,+Via+del+Polaresco,+15,+Bergamo+BG&aq=0&oq=Spazio+Polaresco&sll=45.657417,9.96278&sspn=1.958154,4.932861&vpsrc=0&t=h&ie=UTF8&hq=Spazio+Polaresco,&hnear=Via+del+Polaresco,+15,+24129+Bergamo,+Provincia+di+Bergamo,+BG&ll=45.691897,9.63501&spn=0.007644,0.019269&z=16&iwloc=A&cid=16915148490896185851\" title=\"Google Maps\">Google Maps</a> | <a href=\"http://www.giovani.bg.it/spazio-polaresco.html\" title=\"Sito Web\">Sito Web</a>";
        var ldinfowin = new google.maps.InfoWindow({
          content: infocontent
        });
        google.maps.event.addListener(marker, 'click', function () {
          ldinfowin.open(map, marker);
        });
      };
      google.maps.event.addDomListener(window, 'load', initialize);
