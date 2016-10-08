class base::users {
  user { "lewispeckover":
    ensure => present,
    groups => "wheel",
    managehome => "true",
  } ->
  ssh_authorized_key { "lewispeckover@mbp2.local":
    user => "lewispeckover",
    type => "ssh-rsa",
    key => "AAAAB3NzaC1yc2EAAAABIwAAAQEA2QPs5FDj9TbI/zF9Jut5d3x9aQHsdjHndlqwvw2bA9ZGJNNHfQXWy7yQRwYCWR4jBLIr2Bxzy/r/iBPkpsLP3it1ebk0RrvCEDLHMF0Op8z+Im7dIcqs8IpwM15xfnVI8WjsABXSbgoZplDN2gWRlu/GK8KGQG8Rq8aVeLgx3+87/6i4Pzdu0iAIFNGg/Fkp0WR+8WKMYlyLlfFPcWndpf5KA3sufmtiP4TJzk8aSbPCnjIgBlZsX1qsKRN+7K5iW0/4dU4uePY3XrR9uguAEvISTJwb3mvn1M7mtCANA3gDTh1MQO92FqVaZEnt/tTPa22YBNVIXGtfpr5p2nygpw=="
  }
}
