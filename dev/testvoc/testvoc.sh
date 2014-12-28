if [[ $1 = "nld-deu" ]]; then
echo "==Dutch->German===========================";
bash inconsistency.sh nld-deu > /tmp/nld-deu.testvoc; bash inconsistency-summary.sh /tmp/nld-deu.testvoc nld-deu
echo ""

elif [[ $1 = "deu-nld" ]]; then
echo "==German->Dutch===========================";
bash inconsistency.sh deu-nld > /tmp/deu-nld.testvoc; bash inconsistency-summary.sh /tmp/deu-nld.testvoc deu-nld

fi
