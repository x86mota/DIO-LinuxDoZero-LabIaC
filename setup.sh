#!/bin/bash

# Set variables
pass_tmp="123Mudar"
dirs_list=("/adm" "/ven" "/sec" "/publico")
groups_list=("GRP_ADM" "GRP_VEN" "GRP_SEC")
adm_users_list=("carlos" "maria" "joao")
ven_users_list=("debora" "sebastiana" "roberto")
sec_users_list=("josefina" "amanda" "rogerio")

# Function to create directories
function _CreateDir {
    local dirs=("$@")

    for dir in "${dirs[@]}"; do
        mkdir -p "${dir}"
    done
}

# Function to create groups
function _CreateGroup {
    local groups=("$@")

    for group in "${groups[@]}"; do
        groupadd "${group}"
    done
}

# Function to create users with a specified password and group
function _CreateUser {
    local users=($1)
    local pass="$2"
    local group="$3"

    for user in "${users[@]}"; do
        useradd "${user}" -m -s /bin/bash -p "$(openssl passwd -6 "${pass}")" -G "${group}"
        passwd -e "${user}"
    done
}

# Function to set permissions on directories
function _SetPermissions {
    local group="$1"
    local dir="$2"
    local permission="$3"

    chown root:"${group}" "${dir}"
    chmod "${permission}" "${dir}"
}

# Create directories
_CreateDir "${dirs_list[@]}"

# Create groups
_CreateGroup "${groups_list[@]}"

# Create users and add them to respective groups
_CreateUser "${adm_users_list[*]}" "${pass_tmp}" "${groups_list[0]}"
_CreateUser "${ven_users_list[*]}" "${pass_tmp}" "${groups_list[1]}"
_CreateUser "${sec_users_list[*]}" "${pass_tmp}" "${groups_list[2]}"

# Set permissions for directories
_SetPermissions "${groups_list[0]}" "${dirs_list[0]}" 770
_SetPermissions "${groups_list[1]}" "${dirs_list[1]}" 770
_SetPermissions "${groups_list[2]}" "${dirs_list[2]}" 770
_SetPermissions "root" "${dirs_list[3]}" 777
