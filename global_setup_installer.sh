echo "creating directory for source code downloads"
cd $HOME
mkdir source_code_dir
cd source_code_dir

echo "installing dvtm"
git clone https://github.com/martanne/dvtm.git
cd dvtm
sudo make clean install
cd ..
echo "installed dvtm successfully"

echo "installing lof"
