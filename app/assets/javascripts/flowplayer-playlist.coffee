songs = [
  'resized/EP-††-Back-Cover.jpg'
  '01 - Fron†iers.mp3'
  'resized/EP-††-Back-Cover.jpg'
  '02 - Prurien†.mp3'
  'resized/EP-††-Back-Cover.jpg'
  '03 - †elepa†hy.mp3'
  'resized/EP-††-Back-Cover.jpg'
  '04 - †rophy.mp3'
  'resized/EP-††-Back-Cover.jpg'
  '05 - 1987.mp3'
  'resized/†his-is-A-†rick---Handwritten-Lyrics.jpg'
  '01 - †his Is A †rick.mp3'
  'resized/Op†ion---Handwritten-Lyrics.jpg'
  '02 - Op†ion.mp3'
  'resized/Bermuda-Locke†---Handwritten-Lyrics.jpg'
  '03 - Bermuda Locke†.mp3'
  'resized/†hholyghs†---Handwritten-Lyrics.jpg'
  '04 - †hholyghs†.mp3'
  'resized/EP-†-Artwork-(Front-Cover).jpg'
  '05 - †.mp3'
]

baseUrl = 'https://dl.dropbox.com/u/2956535/websites/crossesplayer/'

$ ->
  $f "player", "http://releases.flowplayer.org/swf/flowplayer-3.2.12.swf",

    playlist: songs.map (song) -> "#{baseUrl}#{encodeURI(song)}"

    # show playlist buttons in controlbar
    plugins:
      controls:
        playlist: true

        # use tube skin with a different background color
        url: "http://releases.flowplayer.org/swf/flowplayer.controls-tube-3.2.12.swf"
        backgroundColor: "#2c2c2c"
