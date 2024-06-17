#!/bin/bash

output_system_info() {
  echo -e ${color_name}"HOSTNAME${DEFAULT} =" ${color_value}"$hostname"${DEFAULT}
  echo -e ${color_name}"TIMEZONE${DEFAULT} =" ${color_value}"$timezone"${DEFAULT}
  echo -e ${color_name}"USER${DEFAULT} =" ${color_value}"$user"${DEFAULT}
  echo -e ${color_name}"OS${DEFAULT} =" ${color_value}"$os"${DEFAULT}
  echo -e ${color_name}"DATE${DEFAULT} =" ${color_value}"$date"${DEFAULT}
  echo -e ${color_name}"UPTIME${DEFAULT} =" ${color_value}"$uptime"${DEFAULT}
  echo -e ${color_name}"UPTIME_SEC${DEFAULT} =" ${color_value}"$uptime_sec"${DEFAULT}
  echo -e ${color_name}"IP${DEFAULT} =" ${color_value}"$ip"${DEFAULT}
  echo -e ${color_name}"MASK${DEFAULT} =" ${color_value}"$mask"${DEFAULT}
  echo -e ${color_name}"GATEWAY${DEFAULT} =" ${color_value}"$gateway"${DEFAULT}
  echo -e ${color_name}"RAM_TOTAL${DEFAULT} =" ${color_value}"$ram_total"${DEFAULT}
  echo -e ${color_name}"RAM_USED${DEFAULT} =" ${color_value}"$ram_used"${DEFAULT}
  echo -e ${color_name}"RAM_FREE${DEFAULT} =" ${color_value}"$ram_free"${DEFAULT}
  echo -e ${color_name}"SPACE_ROOT${DEFAULT} =" ${color_value}"$space_root"${DEFAULT}
  echo -e ${color_name}"SPACE_ROOT_USED${DEFAULT} =" ${color_value}"$space_root_used"${DEFAULT}
  echo -e ${color_name}"SPACE_ROOT_FREE${DEFAULT} =" ${color_value}"$space_root_free"${DEFAULT}
}

output_system_info
echo
echo "Column 1 background =" "${colors_output[0]}" "${colors_term[0]}"
echo "Column 1 font color =" "${colors_output[1]}" "${colors_term[1]}"
echo "Column 2 background =" "${colors_output[2]}" "${colors_term[2]}"
echo "Column 2 font color =" "${colors_output[3]}" "${colors_term[3]}"
