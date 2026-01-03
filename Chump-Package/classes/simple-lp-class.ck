public class LP extends Chugraph
{
    Gain half(0.5);
    Delay shift(1::samp);

    inlet => shift => half;
    inlet => half => outlet;
}