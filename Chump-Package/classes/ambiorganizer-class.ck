public class AmbisonicOrganizer
{
    Gain input;
    Encode2 dry;
    Encode2 wet[8];
    LPF falloff[8];
    Gain scaleFilt(0.523)[8];
    DelayA delays[8];
    Gain feedback(0.25)[8];
    OrderGain2 sum(1.0/8.0);

    fun void AmbisonicOrganizer()
    {
        input => dry => sum;
        for(int i; i < wet.size(); i++)
        {
            falloff[i].set(850.0, 1.0);
            input => delays[i] => wet[i] => sum; // shelving filter not implemented yet
            delays[i] => feedback[i] => delays[i];
            delays[i] => falloff[i] => scaleFilt[i] => delays[i];
        }
    }
}