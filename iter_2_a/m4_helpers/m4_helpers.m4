m4_changequote m4_dnl
m4_changequote(«,») m4_dnl
m4_ifdef(«M4_HELPERS»,,«m4_define(«M4_HELPERS»,1) m4_dnl
m4_ifdef(«M4_WORKING_DIR»,,«m4_define(«M4_WORKING_DIR», «.»)») m4_dnl
m4_define(«m4_loadfile», «m4_dnl
m4_pushdef(«M4_WORKING_DIR», M4_WORKING_DIR/$1) m4_dnl
m4_include(M4_WORKING_DIR/$2) m4_dnl
m4_popdef(«M4_WORKING_DIR») m4_dnl
») m4_dnl
») m4_dnl
