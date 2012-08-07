songs = [
  'resized/EP-††-Back-Cover.jpg'
  url: '01 - Fron†iers.mp3', duration: 241
  'resized/EP-††-Back-Cover.jpg'
  url: '02 - Prurien†.mp3', duration: 246
  'resized/EP-††-Back-Cover.jpg'
  url: '03 - †elepa†hy.mp3', duration: 214
  'resized/EP-††-Back-Cover.jpg'
  url: '04 - †rophy.mp3', duration: 232
  'resized/EP-††-Back-Cover.jpg'
  url: '05 - 1987.mp3', duration: 191
  'resized/†his-is-A-†rick---Handwritten-Lyrics.jpg'
  url: '01 - †his Is A †rick.mp3', duration: 186
  'resized/Op†ion---Handwritten-Lyrics.jpg'
  url: '02 - Op†ion.mp3', duration: 265
  'resized/Bermuda-Locke†---Handwritten-Lyrics.jpg'
  url: '03 - Bermuda Locke†.mp3', duration: 222
  'resized/†hholyghs†---Handwritten-Lyrics.jpg'
  url: '04 - †hholyghs†.mp3', duration: 266
  'resized/EP-†-Artwork-(Front-Cover).jpg'
  url: '05 - †.mp3', duration: 173
  'EX†ENDED PLAY.mp4'
]

baseUrl = 'https://dl.dropbox.com/u/2956535/websites/crossesplayer/'

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
