#!/usr/bin/sh

function interactive {
    if [ "$wp" = "" ]; then
        echo -n "Enter the width of the screen in pixels: "
        read wp
    fi

    if [ "$wm" = "" ]; then
        echo -n "Enter the width of the screen in mm: "
        read wm
    fi

    if [ "$hp" = "" ]; then
        echo -n "Enter the height of the screen in pixels: "
        read hp
    fi

    if [ "$hm" = "" ]; then
        echo -n "Enter the height of the screen in mm: "
        read hm
    fi

    if [ "$disp" = "" ]; then
        echo -n "Enter the name of the display: "
        read disp
    fi
}


function run {
    qwp=$(expr $wp / 2)
    qwm=$(expr $wm / 2)
    qhp=$(expr $hp / 2)
    qhm=$(expr $hm / 2)

    echo $qwp
    echo $qwm
    echo $qhp
    echo $qhm

    xrandr --setmonitor "$disp~tl" "$qwp"/"$qwm"x"$qhp"/"$qhm"+0+0 $disp
    xrandr --setmonitor "$disp~tr" "$qwp"/"$qwm"x"$qhp"/"$qhm"+"$qwp"+0 none
    xrandr --setmonitor "$disp~bl" "$qwp"/"$qwm"x"$qhp"/"$qhm"+0+"$qhp" none
    xrandr --setmonitor "$disp~br" "$qwp"/"$qwm"x"$qhp"/"$qhm"+"$qwp"+"$qhp" none
}


function revert {
    xrandr --delmonitor "$disp~tr"
    xrandr --delmonitor "$disp~bl"
    xrandr --delmonitor "$disp~br"
    xrandr --delmonitor "$disp~tl"
}


function usage {
    echo "usage: virtual-4-screen [ -wp pixel-width -wm mm-width -hp pixel-height -hm mm-height -d display ] | [ revert: -d display -r ] | [-h]"
}


while [ "$1" != "" ]; do
    case $1 in
        -wp | --pixel-width )       shift
                                    wp=$1 
                                    ;;
        -wm | --mm-width )          shift
                                    wm=$1
                                    ;;
        -hp | --pixel-height )      shift
                                    hp=$1
                                    ;;
        -hm | --mm-height )         shift
                                    hm=$1
                                    ;;
        -d | --display )            shift
                                    disp=$1
                                    ;;
        -r | --revert )             revert
                                    exit
                                    ;;
        -h | --help )               usage
                                    exit
                                    ;;
        * )                         usage
                                    exit 1
    esac
    shift
done

if [ "$wp" = "" ] || [ "$wm" = "" ] || [ "$hp" = "" ] || [ "$hm" = "" ] || [ "$disp" = "" ]; then
    interactive
else
    usage
fi

run

