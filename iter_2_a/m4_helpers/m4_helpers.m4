m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«M4_HELPERS»,,«m4_define(«M4_HELPERS»,1) m4_dnl

m4_define(«m4_working_directory», «.»)

m4_define(«m4_loadfile», «m4_dnl
m4_pushdef(«m4_working_directory», m4_working_directory/$1) m4_dnl
m4_include(m4_working_directory/$2) m4_dnl
m4_popdef(«m4_working_directory») m4_dnl
») m4_dnl

») m4_dnl
