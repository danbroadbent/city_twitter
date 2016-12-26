var $citySearchForm

function initMap() {
  var uluru = {lat: -25.363, lng: 131.044};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 4,
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
    tweets.forEach (renderTweet)
  })
};

function renderTweet(tweet){
  console.log(tweet)
};
