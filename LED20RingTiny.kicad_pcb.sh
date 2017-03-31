#!/bin/bash
#
# (c) 2017-03-31 Jens Hauke <jens.hauke@4k2.de>
#

cp LED20RingTiny.kicad_pcb LED20RingTiny.kicad_pcb.old

< LED20RingTiny.kicad_pcb.old > LED20RingTiny.kicad_pcb gawk '
BEGIN {
	idx = 0;
	pi = atan2(0, -1);
	pi180 = pi / 180;
}

/LEDs:LED_0805/{
	led = 1
	print;
	next;
}

led && /at/ {
	led = 0;
	r = 9.5;
	x = 170 + sin((idx + 0.5) * (360/20) * pi180) * r;
	y = 100 - cos((idx + 0.5) * (360/20) * pi180) * r;
	print "    " $1 " " x " " y " " $4
	idx++;
	next;
}

{
	print;
}

'


# Local Variables:
#  compile-command: "./LED20RingTiny.kicad_pcb.sh"
# End:
