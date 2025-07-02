def download [url name] {
    yt-dlp $url -o $name
    notify-send $"Download for ($name) done!"
}
