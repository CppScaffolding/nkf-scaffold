-- scaffold geniefile for nkf

nkf_script = path.getabsolute(path.getdirectory(_SCRIPT))
nkf_root = path.join(nkf_script, "nkf")

nkf_includedirs = {
	path.join(nkf_script, "config"),
	nkf_root,
}

nkf_libdirs = {}
nkf_links = {}
nkf_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { nkf_includedirs }
	end,

	_add_defines = function()
		defines { nkf_defines }
	end,

	_add_libdirs = function()
		libdirs { nkf_libdirs }
	end,

	_add_external_links = function()
		links { nkf_links }
	end,

	_add_self_links = function()
		links { "nkf" }
	end,

	_create_projects = function()

project "nkf"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		nkf_includedirs,
	}

	defines {}

	files {
		path.join(nkf_script, "config", "**.h"),
		path.join(nkf_root, "**.h"),
		path.join(nkf_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
