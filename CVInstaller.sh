if [[ "which brew" == none]]
then
    cd ~
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
else
    brew update
fi

if [[ "which python" == none ]] || [[ "which python" !=  "/usr/local/bin/python" ]]
then
    echo "Installing Homebrew Python..."
    brew install python3
    echo "Linking Homebrew Python3 as main Python Version..."
    brew link python3
    brew linkapps
    echo "Python3 successfully linked!"
fi

if [[ "which pip3"  == none ]] || [["which pip3" != "/usr/local/bin/pip3" ]]
then
    echo "Installing Python Package Manager: Pip3..."
    brew install pip3
    echo "Pip3 successfully installed!"
fi

echo 'export PATH=/usr/local/bin:$PATH' >> ~/.bashrc
echo 'source ~/.bashrc' >> ~/.bash_profile

source ~/.bash_profile

pip install virtualenv virtualenvwrapper

echo 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bash_profile

source ~/.bash_profile

echo "
    Enter a work environment name.
    This will be the environment you
    will work on from now on. You
    must remember this name in order to
    use this platform.
    "
read -a environ

mkvirtualenv environ

echo "Your environment has been created!"
echo "Switching to environment."
echo "WARNNING. Any packages installed within your Virtual
Environment will not be available outside your environment."

workon environ

if [[ pip3 install numpy != "Requirement already satisfied (use --upgrade to upgrade): numpy in /usr/local/lib/python3.5/site-packages" ]]
then
    pip3 install numpy
    echo $(pip show numpy | grep Version) "installed."
else
    echo $(pip show numpy | grep Version) "installed."
fi

echo "Installing CMake and related software."
brew install cmake pkg-config

brew install jpeg libpng libtiff openexr

brew install eigen tbb

cd ~
git clone https://github.com/Itseez/opencv.git
cd opencv
git checkout 3.1.0

cd ~
git clone https://github.com/Itseez/opencv_contrib
cd opencv_contrib
git checkout 3.1.0

cd ~/opencv
mkdir build
cd build





