{ pkgs }: {
    deps = [
        pkgs.bashInteractive
        pkgs.man
        pkgs.jq
        pkgs.ffmpeg
        pkgs.jre8
        pkgs.jdk11
        pkgs.git
        pkgs.tmux
        pkgs.wget
        pkgs.curl
        pkgs.dialog
    ];
}