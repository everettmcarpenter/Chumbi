@import "string-model.ck"

public class PluckedString extends StringModel
{
    Impulse imp;

    imp => inSum;

    fun void strike()
    {
        imp.next(1.0);
    }

}