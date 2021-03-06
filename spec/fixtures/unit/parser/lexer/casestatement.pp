# $Id$

$var = "value"

case $var {
  "nope": {
     file { "/tmp/fakefile": mode => '0644', ensure => file }
  }
  "value": {
     file { "/tmp/existsfile": mode => '0755', ensure => file }
  }
}

$ovar = "yayness"

case $ovar {
    "fooness": {
         file { "/tmp/nostillexistsfile": mode => '0644', ensure => file }
    }
    "booness", "yayness": {
        case $var {
            "nep": {
                 file { "/tmp/noexistsfile": mode => '0644', ensure => file }
            }
            "value": {
                 file { "/tmp/existsfile2": mode => '0755', ensure => file }
            }
        }
    }
}

case $ovar {
    "fooness": {
         file { "/tmp/nostillexistsfile": mode => '0644', ensure => file }
    }
    default: {
        file { "/tmp/existsfile3": mode => '0755', ensure => file }
    }
}

$bool = true

case $bool {
    true: {
        file { "/tmp/existsfile4": mode => '0755', ensure => file }
    }
}

$yay = yay
$a = yay
$b = boo

case $yay {
    $a: { file { "/tmp/existsfile5": mode => '0755', ensure => file } }
    $b: { file { "/tmp/existsfile5": mode => '0644', ensure => file } }
    default: { file { "/tmp/existsfile5": mode => '0711', ensure => file } }

}

$regexvar = "exists regex"
case $regexvar {
    "no match": { file { "/tmp/existsfile6": mode => '0644', ensure => file } }
    /(.*) regex$/: { file { "/tmp/${1}file6": mode => '0755', ensure => file } }
    default: { file { "/tmp/existsfile6": mode => '0711', ensure => file } }
}
