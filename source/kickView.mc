import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Timer;

var mytext;

var spot;
var left;
var right;
var bg;

var standing;
var diveright;
var diveleft;

var reset;
var myTimer;

class kickView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));

        spot = findDrawableById("spot");
        right = findDrawableById("right");
        left = findDrawableById("left");

        bg = findDrawableById("field");

        standing = findDrawableById("standing");
        diveright = findDrawableById("diveright");
        diveleft = findDrawableById("diveleft");
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        mytext = new WatchUi.Text({
        :text=>"GOAL!",
        :color=>Graphics.COLOR_WHITE,
        :font=>Graphics.FONT_LARGE,
        :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
        :locY=>WatchUi.LAYOUT_VALIGN_CENTER
        });
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        dc.clear();
        bg.draw(dc);
        
        drawSpot(dc);

    }

    // New function to encapsulate the drawing logic
    function drawSpot(dc as Dc) as Void {
        if (position == -1) { 
            spot.draw(dc); 
            standing.draw(dc);
        }

        if (position == 0 && done == 0) { 
            right.draw(dc); 
            standing.draw(dc);
        }

        if (position == 1 && done == 0) { 
            left.draw(dc); 
            standing.draw(dc);
        }

        if (done == 1) { 
            if (position == 0 && dive == 0){
                play(dc);
            }
            if (position == 0 && dive != 0){
                diveright.draw(dc);
                done = 0;
                position = -1;
            }
            
            if (position == 1 && dive == 1){
                play(dc);
            }
            if (position == 1 && dive != 1){
                diveleft.draw(dc);
                done = 0;
                position = -1;
            }
        }
    }



    function play(dc as Dc) as Void{
        dc.clear();
        mytext.draw(dc);
        done = 0;
    }
    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }
}
