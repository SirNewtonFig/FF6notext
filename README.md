# FF6 no-text patch

by Sir Newton Fig

sirnewtonfig@gmail.com

## Contents

1) Introduction
2) Files
3) Technical Bits
4) Thanks

## 1) Introduction

This patch is a mod-agnostic no-text patch for FF6us. By mod agnostic, I mean that it does not modify the event or dialogue bank of the ROM, and thus should be equally useful for any given hack.

It skips dialogue in the field and combat engines, and displays only the dialogue events that contain multiple choice options or treasure indicators. This dialogue suppression can be toggled in the Config menu using the Stereo/Mono toggle, now a Text: Off/On toggle (which defaults to Off).

## 2) Files
```
  |- asm/...
  |- ips/
      |- rando/...
      |- standard/...   
```

This archive contains a standard and rando version of the patch. The rando version is meant for use in randomizers such as Beyond Chaos or Beyond Chaos: Gaiden, which might relocate where individual Espers are acquired. Since the player won't know which Esper they've received with no text indicator until they open the menu and scan through their list of Espers, the rando version will display a dialogue box indicating which Esper was acquired, much like it does with treasure chests.

If you're not playing on a randomizer, then you can just use the standard version of the patch, assuming you know which Espers are where. Or if you find it more rewarding to have the dialogue pop up, use the rando version anyway, doesn't matter.

Additionally, headered and non-headered versions of the above are provided.

Finally, the ASM files used to build these patches are provided to accommodate more complicated use cases, like the ones mentioned below in Technical Bits.

## 3) Technical Bits

This hack was built by slicing into the event handlers for dialogue events in the field and battle engines. If your hack changes or moves these, you will need to modify this patch to tie into them.

In addition to some tweaks to these event handlers, this patch uses 124 bytes of free space in bank $C0. It should be trivial to relocate this anywhere else in the bank, if the chosen space conflicts.

In the randomizer version of the patch (see Versions below), I am also recycling the dialogue control code for the "spell gained" placeholder, which I have turned into an "esper gained" placeholder for a custom "Got the magicite <X>" dialogue. If your hack is using dialogue control code $1B for some reason, you can add your own by relocating the "EsperControlCode" block in "esper_handler.asm" to free space, and jumping to a new control code check in the sequence of checks starting at $C0/8302. Code $17 or 18 might be a good candidate.

Finally, if you're already repurposing the Stereo/Mono toggle, then I'll leave it in your capable hands to find another switch to move this to – or you could just have it always on by altering the CheckConfig and TextEnabled routines in the field and battle dialogue handler files respectively.

## 4) Thanks

Shout out to seibaby for pointing me in the right direction on the combat dialogue handlers. Bank C1 scares me a little, and I was starting to think I wasn't going to be able to pull off the combat dialogue skip.

Big thanks to Deschain, Gens and Ludovician over on the BNW discord for testing the crap out of this while I was building it. And apologies to everyone else over there for spamming my development progress as I worked out the kinks ;P
