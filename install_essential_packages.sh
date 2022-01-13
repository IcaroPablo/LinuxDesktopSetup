package_list=(
"git"
"base-devel"
"libX11-devel"
"libXft-devel"
"libXinerama-devel"
"pkgbuild"
"make"
"fzf"
"the_silver_searcher"
"nvim"
"abduco"
"xsetroot"
"playerctl"
"scrot"
"feh"
"wmctrl"
"xbindkeys"
"snownews"
)

if [ "$(lsb_release -a | grep Description | awk '{print $2}')" == "Manjaro" ]; then
	pacman -Syu &&
	for package in ${package_list[@]}; do
		pacman -S $package
	done
fi

if [ "$(lsb_release -a | grep Description | awk '{print $2}')" == "Void" ]; then
	xbps-install -Su &&
	for package in ${package_list[@]}; do
		xbps-install -S $package
	done
fi
