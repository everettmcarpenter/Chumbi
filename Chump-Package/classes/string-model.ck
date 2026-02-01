// ----------------------------------------------------------------------------------------------
//
//      name: string-model.ck (class)
//      author: everett m. carpenter
//      desc: string model taken from Ken Steiglitz book "A Digital Signal Processing Primer"
//
// ----------------------------------------------------------------------------------------------

@import "allpass.ck"
@import "simple-lp.ck"

public class StringModel extends Chugraph
{
    Delay feedforwardDelay(1::samp);
    Delay feedbackDelay;
    Gain feedbackScale;
    Gain feedforwardScale(0.5);
    Gain inSum;
    LP lp;
    Allpass alp(0.999);

    int blockSize;
    float res;

    outlet => feedbackDelay => lp => feedbackScale => inSum;
    inlet => inSum => feedforwardDelay => feedforwardScale;
    inSum => feedforwardScale;
    feedforwardScale => outlet;

    fun void StringModel(int n, float reso)
    {
        n => blockSize;
        feedbackDelay.delay(n::samp);
        reso => res;
        feedbackScale.gain(res); // default r value is 0.5
    }

    fun void StringModel(int n)
    {
        n => blockSize;
        feedbackDelay.delay(n::samp);
        0.5 => res;
        feedbackScale.gain(res); // default r value is 0.5
    }

    fun void set(int n, float reso)
    {
        n => blockSize;
        feedbackDelay.delay(n::samp);
        reso => res;
        feedbackScale.gain(res); // default r value is 0.5
    }

    fun void reso(float reso)
    {
        reso => res;
        feedbackScale.gain(res); // default r value is 0.5
    }

    fun float reso()
    {
        return res;
    }

    fun void size(int n)
    {
        n => blockSize;
        feedbackDelay.delay(blockSize::samp);
    }

    fun int size()
    {
        return blockSize;
    }

}