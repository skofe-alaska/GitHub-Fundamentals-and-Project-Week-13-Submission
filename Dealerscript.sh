#!/bin/bash
grep "-" /home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis/$1_win_loss_player_data > temp
awk -F " " '{print $1, $2, $5, $6}' /home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/$1_Dealer_schedule > temp2
grep -i "$2:00:00 $3" /home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/temp2