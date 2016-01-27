#! /bin/sh

function filenotfound_test()
{
  local FAILS=0

  for file in $*; do
    if ! [ -e $file ]; then
      echo "Error: $file does not exists"
      FAILS=$(($fails + 1))
    fi
  done

  if [ $FAILS -ne 0 ]; then
    echo "$FAILS errors found"
    exit 1
  fi
}

function swapRSA
{
  local SSH_DIR=~/.ssh
  local RSA=$SSH_DIR/id_rsa
  local RSA_PUB=$RSA.pub
  local HOST1=$HOST
  local HOST2=rack

  local DIFF_HOST1
  local DIFF_HOST1_PUB
  local DIFF_HOST2
  local DIFF_HOST2_PUB


  filenotfound_test.sh $RSA $RSA_PUB  \
                        $RSA.$HOST1 $RSA_PUB.$HOST1 \
                        $RSA.$HOST2 $RSA_PUB.$HOST2
  if [ $? -ne 0 ]; then
    return 1
  fi


  DIFF_HOST1=`diff $RSA $RSA.$HOST1`
  DIFF_HOST1_PUB=`diff $RSA_PUB $RSA_PUB.$HOST1`
  DIFF_HOST2=`diff $RSA $RSA.$HOST2`
  DIFF_HOST2_PUB=`diff $RSA_PUB $RSA_PUB.$HOST2`


  local IS_HOST1=`echo -n $DIFF_HOST1 | wc -c`
  local IS_HOST1_PUB=`echo -n $DIFF_HOST1_PUB | wc -c`
  local IS_HOST2=`echo -n $DIFF_HOST2 | wc -c`
  local IS_HOST2_PUB=`echo -n $DIFF_HOST2_PUB | wc -c`

  if [ $IS_HOST1 -eq 0 ] && [ $IS_HOST1_PUB -eq 0 ]; then
    cp $RSA.$HOST2 $RSA
    cp $RSA_PUB.$HOST2 $RSA_PUB
    echo "RSA key setup is now:" $HOST2
  elif [ $IS_HOST2 -eq 0 ] && [ $IS_HOST2_PUB -eq 0 ]; then
    cp $RSA.$HOST1 $RSA
    cp $RSA_PUB.$HOST1 $RSA_PUB
    echo "RSA key setup is now:" $HOST1
  else
    echo "Cannot identify current setup"
  fi
}
