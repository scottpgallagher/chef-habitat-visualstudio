

# This file is the heart of your application's habitat.
# See full docs at https://www.habitat.sh/docs/reference/plan-syntax/

# Required.
# Sets the name of the package. This will be used along with `$pkg_origin`,
# and `$pkg_version` to define the fully-qualified package name, which determines
# where the package is installed to on disk, how it is referred to in package
# metadata, and so on.
$pkg_name="visualstudio"

# Required unless overridden by the `HAB_ORIGIN` environment variable.
# The origin is used to denote a particular upstream of a package.
$pkg_origin="sgallagher-public"

# Required.
# Sets the version of the package
$pkg_version="0.1.0"

# Optional.
# The name and email address of the package maintainer.
$pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"

# Optional.
# An array of valid software licenses that relate to this package.
# Please choose a license from http://spdx.org/licenses/
$pkg_license=@("Apache-2.0")

# Optional.
# The scaffolding base for this plan.
# $pkg_scaffolding="some/scaffolding"

# Optional.
# A URL that specifies where to download the source from. Any valid wget url
# will work. Typically, the relative path for the URL is partially constructed
# from the pkg_name and pkg_version values; however, this convention is not
# required.
$pkg_source="https://download.visualstudio.microsoft.com/download/pr/f6473c9f-a5f6-4249-af28-c2fd14b6a0fb/93a0679fc9ec388d5e0cc81958654ab4602ede8217fb852e8bcad58419512b02/vs_Professional.exe"

# Optional.
# The resulting filename for the download, typically constructed from the
# pkg_name and pkg_version values.
# $pkg_filename="$pkg_name-$pkg_version.zip"

# Required if a valid URL is provided for pkg_source or unless Invoke-Verify is overridden.
# The value for pkg_shasum is a sha-256 sum of the downloaded pkg_source. If you
# do not have the checksum, you can easily generate it by downloading the source
# and using Get-FileHash. Also, if you do not have
# Invoke-Verify overridden, and you do not have the correct sha-256 sum, then the
# expected value will be shown in the build output of your package.
$pkg_shasum="93a0679fc9ec388d5e0cc81958654ab4602ede8217fb852e8bcad58419512b02"

# The default implementation extracts your zipped source file into
# $HAB_CACHE_SRC_PATH.
function Invoke-Unpack {

}


# There is no default implementation of this callback. Typically you will override
# this callback to copy the compiled binaries or libraries in
# $HAB_CACHE_SRC_PATH/$pkg_dirname to $pkg_prefix.
function Invoke-Install {
  Copy-Item -Path ${HAB_CACHE_SRC_PATH} -Destination $pkg_prefix -Recurse -Force
}








