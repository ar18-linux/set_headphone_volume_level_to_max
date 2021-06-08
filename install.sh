#!/bin/bash

set -e

if [[ "$(whoami)" != "root" ]]; then
  read -p "[ERROR] must be root!"
  exit 1
fi

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

. "${script_dir}/vars"

mkdir -p "${install_dir}"

rm -rf "${install_dir}/${module_name}"
cp -rf "${script_dir}/${module_name}" "${install_dir}/${module_name}"
chmod +x "${install_dir}/${module_name}/"* -R

chmod 644 "${install_dir}/${module_name}/${module_name}.service"
rm -rf "/etc/systemd/system/${module_name}.service"
ln -s "${install_dir}/${module_name}/${module_name}.service" "/etc/systemd/system/${module_name}.service"
systemctl enable "${module_name}.service"
systemctl start "${module_name}.service"
