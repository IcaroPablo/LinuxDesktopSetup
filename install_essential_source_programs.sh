#HOME is taken as the fist positional argument
#execute as sudo

HOME=$1

libraries=(
libXinerama
pkgbuild
...
)

repositories=(
"my-dwm-fork https://github.com/IcaroPablo/my-dwm-fork"
"my-dmenu-fork https://github.com/IcaroPablo/my-dmenu-fork"
"my-suckless-terminal-fork https://github.com/IcaroPablo/my-suckless-terminal-fork"
)

echo "creating directory for source code downloads"

mkdir -p $HOME/Workspace &&
cd $HOME/Workspace

for repository in "${repositories[@]}"; do
	echo $repository

	repo_name="$(echo $repository | awk '{ print $1 }')"
	repo_link="$(echo $repository | awk '{ print $2 }')"

	echo "installing $repo_name" &&
	git clone $repo_link &&
	cd $repo_name &&
	sudo make clean install &&
	echo "installed $repo_name successfully" &&
	cd ..

done
