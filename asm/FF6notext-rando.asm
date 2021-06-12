incsrc "FF6notext.asm"

; Wrap field event code 86 (gain Esper) with a routine for displaying a
;   custom dialogue box to indicate which Esper is being acquired. This
;   is intended for use with randomizers, where you otherwise won't know
;   which Esper you've received until looking at your menu.
incsrc "esper_handler.asm"
