# Support for Matlab

if [[ Darwin = `uname` ]]; then

    export PATH=/Applications/MATLAB_R2016b.app/bin:$PATH
elif [[ Linux = `uname` ]]; then
    jre=/usr/lib/jvm/sun-jre-bin-1.6

    export BXCB_ALLOW_SLOPPY_LOCK=1
    export MATLAB_JAVA=$jre
fi

