FULL_VERSION_71="7.1.4"
FULL_VERSION_70="7.0.18"
FULL_VERSION_56="5.6.30"

dockerBuildInfo() {
    local version="$1"
    local tags=("${!2}")
    local subfolder="$3"

    echo "===================================="
    echo "Version: $version"
    echo "Subfolder: $subfolder"
    echo "Tags:"

    for tag in ${tags[*]}; do
        echo " - $tag" ""
    done

    echo "===================================="
    echo ""
}

dockerBuild() {
    local version="$1"
    local tags=("${!2}")
    local subfolder="$3"
    local pwd=$(pwd)

    dockerBuildInfo $version tags[@] $subfolder

    local build_dir="${version}"

    if [[ ! -z "$subfolder" ]]; then
        build_dir="${build_dir}/${subfolder}"
    fi

    local cmd="docker build --pull"

    for tag in ${tags[*]}; do
        cmd="${cmd} -t ${tag}"
    done

    cmd="${cmd} ${build_dir}"

    echo "===> ${cmd}"
}


#
# 7.1
#
TAGS=("${FULL_VERSION_71}-cli" "7.1-cli" "7-cli" "cli" "${FULL_VERSION_71}" "7.1" "7" "latest")
dockerBuild 7.1 TAGS[@]

TAGS=("${FULL_VERSION_71}-alpine" "7.1-alpine" "7-alpine" "alpine")
dockerBuild 7.1 TAGS[@] "alpine"

TAGS=("${FULL_VERSION_71}-apache" "7.1-apache" "7-apache" "apache")
dockerBuild 7.1 TAGS[@] "apache"

TAGS=("${FULL_VERSION_71}-fpm" "7.1-fpm" "7-fpm" "fpm")
dockerBuild 7.1 TAGS[@] "fpm"

TAGS=("${FULL_VERSION_71}-fpm-alpine" "7.1-fpm-alpine" "7-fpm-alpine" "fpm-alpine")
dockerBuild 7.1 TAGS[@] "fpm/alpine"

TAGS=("${FULL_VERSION_71}-zts" "7.1-zts" "7-zts" "zts")
dockerBuild 7.1 TAGS[@] "zts"

TAGS=("${FULL_VERSION_71}-zts-alpine" "7.1-zts-alpine" "7-zts-alpine" "zts-alpine")
dockerBuild 7.1 TAGS[@] "zts/alpine"

#
# 7.0
#
TAGS=("${FULL_VERSION_70}-cli" "7.0-cli" "${FULL_VERSION_70}" "7.0")
dockerBuild 7.0 TAGS[@]

TAGS=("${FULL_VERSION_70}-alpine" "7.0-alpine")
dockerBuild 7.0 TAGS[@] "alpine"

TAGS=("${FULL_VERSION_70}-apache" "7.0-apache")
dockerBuild 7.0 TAGS[@] "apache"

TAGS=("${FULL_VERSION_70}-fpm" "7.0-fpm")
dockerBuild 7.0 TAGS[@] "fpm"

TAGS=("${FULL_VERSION_70}-fpm-alpine" "7.0-fpm-alpine")
dockerBuild 7.0 TAGS[@] "fpm/alpine"

TAGS=("${FULL_VERSION_70}-zts" "7.0-zts")
dockerBuild 7.0 TAGS[@] "zts"

TAGS=("${FULL_VERSION_70}-zts-alpine" "7.0-zts-alpine")
dockerBuild 7.0 TAGS[@] "zts/alpine"

#
# 5.6
#
TAGS=("${FULL_VERSION_56}-cli" "5.6-cli" "5-cli" "${FULL_VERSION_56}" "5.6" "5")
dockerBuild 5.6 TAGS[@]

TAGS=("${FULL_VERSION_56}-alpine" "5.6-alpine" "5-alpine")
dockerBuild 5.6 TAGS[@] "alpine"

TAGS=("${FULL_VERSION_56}-apache" "5.6-apache" "5-apache")
dockerBuild 5.6 TAGS[@] "apache"

TAGS=("${FULL_VERSION_56}-fpm" "5.6-fpm" "5-fpm")
dockerBuild 5.6 TAGS[@] "fpm"

TAGS=("${FULL_VERSION_56}-fpm-alpine" "5.6-fpm-alpine" "5-fpm-alpine")
dockerBuild 5.6 TAGS[@] "fpm/alpine"

TAGS=("${FULL_VERSION_56}-zts" "5.6-zts" "5-zts")
dockerBuild 5.6 TAGS[@] "zts"

TAGS=("${FULL_VERSION_56}-zts-alpine" "5.6-zts-alpine" "5-zts-alpine")
dockerBuild 5.6 TAGS[@] "zts/alpine"
