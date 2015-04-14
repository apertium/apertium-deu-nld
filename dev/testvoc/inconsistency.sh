TMPDIR=/tmp/
DIR=$1
SRCNLD=../../`cat ../../config.status | grep AP_SRC2 | cut -f2 -d'=' | tr -d '"'`
SRCDEU=../../`cat ../../config.status | grep AP_SRC1 | cut -f2 -d'=' | tr -d '"'`

if [[ $DIR == "deu-nld" ]]; then
lt-expand $SRCDEU/apertium-deu.deu.dix | grep -v '<prn><enc>' | grep -v '<cmp>'| grep -v 'NON_ANALYSIS'| grep -v 'REGEX' | grep -e ':<:' -e '\w:\w' | sed 's/:<:/%/g' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |\
        apertium-pretransfer|\
	lt-proc -b ../../deu-nld.autobil.bin | tee $TMPDIR/tmp_testvoc2.txt |\
	lrx-proc -m ../../deu-nld.autolex.bin |\
        apertium-transfer -b ../../apertium-deu-nld.deu-nld.t1x  ../../deu-nld.t1x.bin | tee $TMPDIR/tmp_testvoc3.txt |\
        apertium-interchunk ../../apertium-deu-nld.deu-nld.t2x  ../../deu-nld.t2x.bin | tee $TMPDIR/tmp_testvoc4.txt |\
        apertium-postchunk ../../apertium-deu-nld.deu-nld.t3x  ../../deu-nld.t3x.bin | tee $TMPDIR/tmp_testvoc5.txt |\
        lt-proc -d ../../deu-nld.autogen.bin  | sed 's/ \.//g' > $TMPDIR/tmp_testvoc6.txt
	lt-proc -d ../../nld-deu.autogen.bin $TMPDIR/tmp_testvoc1.txt | sed 's/ \.//g'  > $TMPDIR/tmp_testvoc0.txt
paste -d _ $TMPDIR/tmp_testvoc0.txt $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc5.txt $TMPDIR/tmp_testvoc6.txt | sed 's/\^.<sent>\$//g' | sed 's/_/ ------>  /g' > /tmp/deu-nld.testvoc

elif [[ $DIR == "nld-deu" ]]; then
lt-expand $SRCNLD/apertium-nld.nld.dix | grep -v '<prn><enc>' | grep -v '<cmp>'| grep -v 'NON_ANALYSIS'| grep -v 'REGEX' | grep -e ':<:' -e '\w:\w' | sed 's/:<:/%/g' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |\
        apertium-pretransfer|\
	lt-proc -b ../../nld-deu.autobil.bin | tee $TMPDIR/tmp_testvoc2.txt |\
	lrx-proc -m ../../nld-deu.autolex.bin |\
        apertium-transfer -b ../../apertium-deu-nld.nld-deu.t1x  ../../nld-deu.t1x.bin | tee $TMPDIR/tmp_testvoc3.txt |\
        apertium-interchunk ../../apertium-deu-nld.nld-deu.t2x  ../../nld-deu.t2x.bin | tee $TMPDIR/tmp_testvoc4.txt |\
        apertium-postchunk ../../apertium-deu-nld.nld-deu.t3x  ../../nld-deu.t3x.bin | tee $TMPDIR/tmp_testvoc5.txt |\
        lt-proc -d ../../nld-deu.autogen.bin  | sed 's/ \.//g' > $TMPDIR/tmp_testvoc6.txt
	lt-proc -d ../../deu-nld.autogen.bin $TMPDIR/tmp_testvoc1.txt | sed 's/ \.//g'  > $TMPDIR/tmp_testvoc0.txt
paste -d _ $TMPDIR/tmp_testvoc0.txt $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc5.txt $TMPDIR/tmp_testvoc6.txt | sed 's/\^.<sent>\$//g' | sed 's/_/ ------>  /g' 
else
	echo "Unsupported mode.";
fi
