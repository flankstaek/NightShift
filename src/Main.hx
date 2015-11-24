import luxe.Visual;
import luxe.Input;
import luxe.Color;

class Main extends luxe.Game {

  var col : Visual;
  var tk : Float;
  var dis : Float;

    override function config(config:luxe.AppConfig) {

        return config;

    } //config

    override function ready() {
      tk = 0;
      dis = 0;
      col = new Visual({
        geometry : Luxe.draw.box({
          x : 0,
          y : 0,
          w : Luxe.screen.w, //subject to change
          h : Luxe.screen.h //subject to change
        }),
        color : new Color(1, 0, 0, 1)
      });
    } //ready

    override function update(dt:Float) {
      if(haxe.Timer.stamp() - tk > 2) { //been more than 10 seconds since last thing
        var old = col.color.toColorHSL();
        col.color = new ColorHSL(old.h, old.s - .001, old.l, old.a);
      }

      trace(col.color);
      } //update

    override function onmousemove(e:luxe.MouseEvent) {
      dis += Math.abs(e.yrel) + Math.abs(e.xrel);

      if(dis >= 50) {
        tk = haxe.Timer.stamp();
        if(col.color.toColorHSL().s < 1) {
          var old = col.color.toColorHSL();
          col.color = new ColorHSL(old.h, old.s + .001, old.l, old.a);
        }

        dis = 0;
      }
    } //mouse movement

} //Main
