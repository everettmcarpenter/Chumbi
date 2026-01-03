@import "ambiorganizer-class.ck"

public class AmbisonicController 
{
    fun float softClip(float in)
    {
        float out;
        if(in <= -1)
        {
            -(2.0/3.0) => out;
        }
        else if(in >= -1 && in <= 1)
        {
            in - (Math.pow(in, 3.0)/3.0) => out;
        }
        else if(in >= 1)
        {
            2.0/3.0 => out;
        }
        return out;
    }

    fun void position(float azi, float zeni, AmbisonicOrganizer innards)
    {
        innards.dry.pos(azi, zeni);
        for(int i; i < innards.wet.size(); i++)
        {
            Std.scalef(i, 0, innards.wet.size()-1, -1.0, 1.0) => float x;
            innards.wet[i].pos(softClip(x)*45.0 + azi, zeni);
        }
    }

    fun void setDelays(AmbisonicOrganizer innards)
    {
        for(int i; i < innards.delays.size(); i++)
        {
            Std.scalef(i, 0, innards.delays.size()-1, -1.0, 1.0) => float x;
            innards.wet[i].gain(0.9 - Math.fabs(softClip(x)));
            innards.delays[i].delay((Math.fabs(softClip(x)*1.0)+1.0)::ms);
            <<< i , innards.wet[i].gain(), innards.wet[i].azi(), innards.delays[i].delay() >>>;
        }
    }
}