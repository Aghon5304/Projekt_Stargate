extends Node

#sygnał informujący że przedmiot w ekwipunku został użyty
signal Item_used
signal Bohater_monolog(monolog: String)

@export var is_not_paused = true
var is_notebook_open := false
