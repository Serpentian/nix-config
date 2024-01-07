{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    spotify-player
  ];

  # enable_notify option doesn't work.
  home.file.".config/spotify-player/app.toml".text = ''
    theme = "dracula"
    client_id = "65b708073fc0480ea92a077233ca87bd"
    client_port = 8080
    playback_format = """
    {track} • {artists}
    {album}
    {metadata}"""
    tracks_playback_limit = 50
    app_refresh_duration_in_ms = 32
    playback_refresh_duration_in_ms = 0
    cover_image_refresh_duration_in_ms = 2000
    page_size_in_rows = 20
    play_icon = "▶"
    pause_icon = "▌▌"
    liked_icon = "♥"
    border_type = "Plain"
    progress_bar_type = "Rectangle"
    playback_window_position = "Top"
    cover_img_length = 9
    cover_img_width = 5
    cover_img_scale = 1.0
    playback_window_width = 6
    enable_media_control = true
    enable_streaming = "Always"
    enable_cover_image_cache = true
    default_device = "spotify-player"
    enable_notify = false
    
    [copy_command]
    command = "xclip"
    args = [
        "-sel",
        "c",
    ]
    
    [device]
    name = "spotify-player"
    device_type = "speaker"
    volume = 70
    bitrate = 320
    audio_cache = true
    normalization = true
  '';
}
