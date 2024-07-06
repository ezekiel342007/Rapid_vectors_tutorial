extends Node

static var totoal_award_amount: int

signal on_collectible_award_received

func give_collectible_award(collectible_award: int):
	totoal_award_amount += collectible_award
	on_collectible_award_received.emit(totoal_award_amount)
