x!/bin/bash

states=('Alaska' 'Hawaii' 'Florida' 'Texas' 'Arizona')

for state in "${states[@]}"

do
        echo $state
if [" $state" == 'Hawaii' ]
then

        echo ("Hawaii is best!")

else

        echo ("I'm not fond of Hawaii")
fi
done
