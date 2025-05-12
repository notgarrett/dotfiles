with import <nixpkgs> { };

pkgs.mkShell {
  buildInputs =
    [ pkgs.jdk11 pkgs.gradle pkgs.gcc pkgs.git pkgs.bison pkgs.flex ];

  shellHook = ''
    rm -rf /tmp/gradle &> /dev/null
    mkdir /tmp/gradle 
    export GRADLE_USER_HOME="/tmp/gradle" 
    echo "org.gradle.java.home=${pkgs.jdk11}/lib/openjdk" > /tmp/gradle/gradle.properties
  '';
}
