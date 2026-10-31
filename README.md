<sup> Not affiliated with Project DIVA or any Miku game. This is a completely different project. </sup>

<div align="center">

# ♪ Hatsune Miku: Project BASH ♪

### A tiny Miku-fied audio player for your terminal ✧･ﾟ: *✧･ﾟ:*

`♪ ♫ ･ﾟ✧   ✧ﾟ･ ♫ ♪`

---

</div>

## ✧ What is it?

**Project Bash** plays your music folder from inside a pretty terminal UI: a rainbow **HATSUNE MIKU** banner, drifting sparkles, a little ASCII Miku, and a "now playing" box with a progress bar. Everything is plain **Bash**; `mpv` makes the actual sound.

## ♡ What you need

| | |
|---|---|
| **`mpv`** | required, it plays the audio (`sudo pacman -S mpv` / `sudo apt install mpv`) |
| **`lolcat`** | optional, makes the banner and art truly RGB rainbow. Without it you get the teal → pink gradient |
| A terminal with **truecolor + UTF-8** | most modern ones (kitty, alacritty, foot, wezterm, xfce4-terminal...) |

## ✿ Install

```bash
chmod +x project-bash
mv project-bash (Your PATH, check with "echo $PATH")
```
...or you can let the Makefile do it for you. Just run `make install` :3

## ♪ Usage

```bash
pbash                 # plays ~/Music
pbash ~/Music/Miku    # plays a folder (subfolders too)
pbash song.mp3 a.flac # plays specific files
pbash --help
```

Folders are scanned recursively and sorted naturally (`2` before `10`).
When the last song ends it loops back to the first, so the music never stops unless you want it to ♫

## ⌨ Keys

| key | what it does |
|---|---|
| `space` / `enter` | pause · resume |
| `n` / `p` | next · previous song |
| `←` / `→` | seek back · forward (10 s) |
| `↑` / `↓` | volume up · down (5 %) |
| `s` | shuffle on / off |
| `l` | re-roll the rainbow colors ✧ (needs lolcat) |
| `q` / `Esc` | quit, **clears the terminal** |

## ⌨ Environment variables

| environment variable | what it does |
|---|---|
| `PROJECT_BASH_MUSIC` | default music folder |
| `PROJECT_BASH_ART` | path to your own ASCII art (see below) |
| `NO_COLOR` | turn all colors off |

### Swapping the ASCII Miku

Put any plain-text art in `~/.local/share/project-bash/miku.txt` and it gets picked up automatically, with the rainbow applied on it too (Or edit the `miku_art()` function in the script.)

## ☁ Good to know

- **Song names come from file names**, not from tags.
- **Volume and seek restart mpv**, so you may hear a tiny blip and a rewind of up to ~1 second. Pressing them while paused resumes playback.
- **Shuffle picks a random song next**, so repeats can happen. `p` goes to the previous song in list order.
- **Screen size:** the default ASCII Miku is tall, so it needs a terminal of roughly **37+ rows and 95+ columns**. On smaller terminals the art hides itself, and below 64 columns the banner shrinks to one line.

---

<div align="center">

`♪ ♫ ･ﾟ✧   ✧ﾟ･ ♫ ♪`

</div>
