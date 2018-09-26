{ stdenv
, lib
, fastqc
, flags ? null}:

with lib;

input:

stdenv.mkDerivation {
  name = "fastqc-check";
  buildInputs = [ fastqc ];
  buildCommand = ''
    mkdir $out
    fastqc \
      -o $out \
      ${optionalString (flags != null) flags} \
      ${input}
  '';
}
