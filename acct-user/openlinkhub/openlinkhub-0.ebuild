# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="A user for OpenLinkHub"

ACCT_USER_ID=565
ACCT_USER_GROUPS=( openlinkhub )

acct-user_add_deps

