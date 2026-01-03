@import "ambicontroller-class.ck"
@import "ambiorganizer-class.ck"

AmbisonicController helper;
AmbisonicOrganizer inside;

SndBuf bells("../audio/playbackpiece.wav", 0.5)[2];
bells[0].rate(0.5);
bells[1].rate(0.50111);
bells[0].gain(0.5);
bells[1].gain(0.5);

helper.position(0.0, 0.0, inside);
helper.setDelays(inside);

bells[0] => inside.input;
bells[1] => inside.input;
inside.sum.chan(0) => dac;

while(true)
{
    1::second => now;
}