#ifndef ABSOLUTE_MINIMUM_MODE
#include "map_files\shared\CentCom.dmm" //this MUST be loaded no matter what for SSmapping's multi-z to work correctly
#else
#include "map_files\shared\CentCom_minimal.dmm"
#endif

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS // I cry
		#include "map_files/domotan/old_doma.dmm"
		#include "map_files/domotan/domotan_north.dmm"
		#include "map_files/domotan/domotan_east.dmm"
		#include "map_files/domotan/domotan_west.dmm"
		#include "map_files/domotan/domotan_south.dmm"
		#include "map_files/debug/roguetest.dmm"
		#include "map_files/domotan/necropolis_l1_dermus.dmm"
	#endif
	#ifdef ALL_TEMPLATES
		#include "templates.dm"
	#endif
#endif
