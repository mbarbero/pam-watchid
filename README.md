# PAM WatchID

A PAM plugin written in Swift for authenticating using the `kLAPolicyDeviceOwnerAuthenticationWithBiometricsOrWatch` API or `kLAPolicydeviceOwnerAuthenticationWithBiometricsOrCompanion` API in macOS 10.15 and later.

![](demo.gif Demo of the PAM WatchID plugin)

## Installation

`$ make install`

This will edit, if required, the file `/etc/pam.d/sudo_local` to include the line `auth  sufficient  /usr/local/lib/pam/pam_watchid.so`. See `enable.sh` for details

_Note that you might have other `auth`, don't remove them._
