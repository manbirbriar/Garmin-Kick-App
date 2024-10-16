import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;
import Toybox.Math;




var position = -1;
var dive = 0;
var done = 0;

class kickDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey (key) {
        //up
        if (key.getKey() == 13){
            dive = Math.rand()% 2;
            if (position < 2) {
                position = 0;
            }
            System.println("position:" + position);
            System.println("dive:" + dive);
            System.println("done:" + done);
            System.println("--------------");
            WatchUi.requestUpdate();
            return true;
        }

        //down
        if (key.getKey() == 8){
            dive = Math.rand()% 2;
            if (position < 2) {
                position = 1;
            }
            System.println("position:" + position);
            System.println("dive:" + dive);
            System.println("done:" + done);
            System.println("--------------");
            WatchUi.requestUpdate();
            return true;
        }

        //enter
        if (key.getKey() == 4){
            done = 1;

            System.println("position:" + position);
            System.println("dive:" + dive);
            System.println("done:" + done);
            System.println("--------------");
            WatchUi.requestUpdate();
            return true;
        }


        return false;
    }

}