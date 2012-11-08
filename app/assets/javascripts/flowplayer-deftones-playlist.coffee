songs = [
  url: '01_deftones_-_swerve_city.mp3', duration: 165
  url: '02_deftones_-_romantic_dreams.mp3', duration: 278
  url: '03_deftones_-_leathers.mp3', duration: 249
  url: '04_deftones_-_poltergeist.mp3', duration: 211
  url: '05_deftones_-_entombed.mp3', duration: 299
  url: '06_deftones_-_graphic_nature.mp3', duration: 272
  url: '07_deftones_-_tempest.mp3', duration: 366
  url: '08_deftones_-_gauze.mp3', duration: 281
  url: '09_deftones_-_rosemary.mp3', duration: 413
  url: '10_deftones_-_goon_squad.mp3', duration: 340
  url: '11_deftones_-_what_happened_to_you.mp3', duration: 234
]

baseUrl = 'https://dl.dropbox.com/u/2956535/websites/crossesplayer/Deftones-Koi-No-Yokan'

template = _.template("<a href='<%= url %>'><%- title %></a>")

els = []

playlist = songs.map (song) ->
  if typeof song == "string"
    "#{baseUrl}#{encodeURI(song)}"
  else
    title = song.url
    url = "#{baseUrl}#{encodeURI(song.url)}"

    view = template
      title: title
      url: song.url
    els.push view

    url: url, duration: song.duration

for n in [4..els.length] by 4
  els.splice n, 0, '</div><div class="page">'

els.splice 0, 0, '<div class="page">'
els.splice els.length, 0, '</div>'

$ ->
  # TODO: fix Android not being detected correctly
  if navigator.userAgent.match(/Android/i) or navigator.userAgent.match(/webOS/i) or navigator.userAgent.match(/iPhone/i) or navigator.userAgent.match(/iPad/i) or navigator.userAgent.match(/iPod/i) or navigator.userAgent.match(/BlackBerry/i)
    $('.playlist_wrap').show()

    $('.entries').html els.join ''

    $f("player", "http://releases.flowplayer.org/swf/flowplayer-3.2.12.swf",
      clip: {baseUrl: baseUrl}
    ).ipad().playlist("div.entries")

    $('#pl').scrollable circular: true

  else
    $f "player", "http://releases.flowplayer.org/swf/flowplayer-3.2.12.swf",

      playlist: playlist

      # show playlist buttons in controlbar
      plugins:
        controls:
          playlist: true

          # use tube skin with a different background color
          url: "http://releases.flowplayer.org/swf/flowplayer.controls-tube-3.2.12.swf"
          backgroundColor: "#2c2c2c"