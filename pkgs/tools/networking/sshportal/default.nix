{ buildGoModule, fetchFromGitHub }:

let version = "1.18.3";

in buildGoModule {
  pname = "sshportal";
  inherit version;

  src = fetchFromGitHub {
    owner = "moul";
    repo = "sshportal";
    rev = "v${version}";
    sha256 = "07wkkirbzjsmfq20pzk90qs35i4kxrvwaaq5zjk69k79ffq7xvr3";
  };

  vendorSha256 = "1qbzfq0xbz08svr4pg1cayjrfaq8i2jwjk4y7c7mdv81wn7ffa6m";
}
