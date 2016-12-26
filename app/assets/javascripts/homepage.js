var $citySearchForm
var $pageHeader

function initMap() {
  var uluru = {lat: -25.363, lng: 131.044};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 15,
    center: uluru
  });
  var marker = new google.maps.Marker({
    position: uluru,
    map: map
  });
};

$(document).ready( function(){
  $citySearchForm = $("#city-search-form")

  $('#submit-search').on("click", newSearch);
})

function newSearch(){
  data = { query: $citySearchForm.val() }
  $.ajax({
    method: 'get',
    url: "/tweets",
    data: data
  })
  .then(function(tweets){
    initMapWithTweets(tweets)
  })
  .then(function(){
    $pageHeader = $("#pageHeader")
    $pageHeader.text("Tweets about " + $citySearchForm.val())
  })
};

function initMapWithTweets(tweets){
  var uluru = {lat: -25.363, lng: 131.044};
  var bounds = new google.maps.LatLngBounds();
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 15,
    center: uluru
  });
  tweets.forEach(function(tweet){
    if (tweet.geo != null) {
      var coordinates = {lat: tweet.geo.coordinates[0], lng: tweet.geo.coordinates[1]};
      var infowindow = new google.maps.InfoWindow({
        content: tweet.text
      });
      var marker = new google.maps.Marker({
        position: coordinates,
        map: map,
      });
      marker.addListener('mouseover', function() {
        infowindow.open(map, marker);
      }) ;
      marker.addListener('mouseout', function() {
        infowindow.close();
      }) ;
      marker.addListener('click', function() {
        window.location.href = this.url;
      }) ;
      bounds.extend(marker.getPosition());
    }
  })
  map.setCenter(bounds.getCenter());
  map.fitBounds(bounds);
};
