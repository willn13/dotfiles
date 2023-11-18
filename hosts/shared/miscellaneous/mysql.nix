{ config, lib, pkgs, ... }:

{

services.mysql = {
    package = pkgs.mariadb;
    enable = true;


   initialDatabases = [{ name = "app"; }];
   ensureUsers = [
     {
       name = "app";
       ensurePermissions = { "app.*" = "ALL PRIVILEGES"; };
     }
   ];
 
   # Project specific MySQL config like require always a primary key
   settings.mysqld = {
     "sql_require_primary_key" = "on";
   };
 };
}