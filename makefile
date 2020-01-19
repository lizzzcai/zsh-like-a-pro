# makefile to copy the zsh config to destination.

MY_ZSH   := .my.zshrc
MY_P10K  := .my.p10k.zsh

TARGET_ZSH := ~/.zshrc
ZSH_BAKCUP := backup.zshrc

TARGET_P10K := ~/.p10k.zsh
P10K_BAKCUP := backup.p10k.zsh



.PHONY: all diff backup copy undo

all:

# get the difference
diff:
	diff $(MY_ZSH) $(TARGET_ZSH)
	diff $(MY_P10K) $(TARGET_P10K)

# backup the original config
backup:
	cp $(TARGET_ZSH) $(ZSH_BAKCUP)
	cp $(TARGET_P10K) $(P10K_BAKCUP)

# copy the config to target
copy:
	cp $(MY_ZSH) $(TARGET_ZSH)
	cp $(MY_P10K) $(TARGET_P10K)

# copy the backup to target
undo:
	cp $(ZSH_BAKCUP) $(TARGET_ZSH)
	cp $(P10K_BAKCUP) $(TARGET_P10K)
