$packageName = 'p4merge'
$fileType = 'exe'
$silentArgs = '/s /v"/qn ADDLOCAL=P4SCC_MOVED_FROM_P4V_INSTALLER,P4MERGE,P4DVCS,P4EXP_MOVED_FROM_P4V_INSTALLER,P4MERGE64,P4MERGECRTx64,P4DVCS64,P4MERGE_EN,P4SANDBOX_MOVED_FROM_P4V_INSTALLER,QT,QT64,V"'
$url = 'http://cdist2.perforce.com/perforce/r15.2/bin.ntx86/p4vinst.exe'
$checksum = '5bae6228183d4441b72a926aabdae85bf4158f11'
$checksumType = 'sha1'
$url64 = 'http://cdist2.perforce.com/perforce/r15.2/bin.ntx64/p4vinst64.exe'
$checksum64 = '723dc8de16e4185f9834709859cbadc068a481d9'
$checksumType64 = 'sha1'

Install-ChocolateyPackage -PackageName $packageName `
                          -FileType $fileType `
                          -SilentArgs $silentArgs `
                          -Url $url `
                          -Checksum $checksum `
                          -ChecksumType $checksumType `
                          -Url64bit $url64 `
                          -Checksum64 $checksum64 `
                          -ChecksumType64 $checksumType64
