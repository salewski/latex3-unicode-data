#!/usr/bin/env texlua

-- Identify the bundle and module
bundle = ""
module = "unicode-data"

-- Non-standard installation
installfiles = {"*.def", "*.tex", "*.txt"}

-- Nothing to typeset or unpack
sourcefiles  = installfiles
textfiles    = {"*.md"}
typesetfiles = { }
unpackfiles  = { }

-- Testing
checkformat  = "tex"
checkengines = {"xetex", "luatex"}
stdengine    = "xetex"

-- Non-standard installation root
tdsroot = "generic"

-- Release a TDS-style zip
packtdszip  = true

-- Versioning
versionfiles = {"load-unicode-*.tex"}
function setversion_update_line(line, date, version)
  return string.gsub(
    line,
    "v%d.%d.? %(%d%d%d%d%-%d%d%-%d%d%)",
    "v" .. version .. " (" .. date .. ")"
  )
end

-- Find and run the build system
kpse.set_program_name("kpsewhich")
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end
