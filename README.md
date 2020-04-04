# Neovim for PHP developers
This is my current neovim config.

This is a general purpose neovim setup in some ways, however it's heavily geared toward PHP development because that's what pays the bills right now. That said, it works fine when I dabble in other languages, and I'm always adding support there.

This is as close to a "poor man's PhpStorm" as I can get it right now, and it works very well for me.

## Who should use this?
If you don't write PHP code on a daily basis, this is probably not interesting to you.

If you like vi and you write PHP code regularly, you might like this a lot. I do.

## What You Get
- Code introspection
- Goto definition
- Automatically add `use` statements
- Run tests (or a single test) from vim
- Intelligent tab completion
- Some code generation (although I don't even use it much these days)
- A nice color scheme
- A nice status bar at the bottom with info about current buffers, etc
- Fancy git integration (I don't use this much but a lot of people really like it, the diff tools are pretty nice if you are 133t)
- Auto-linting (syntax errors and docblock conflicts/incorrect typehints highlighted while you work)
- Not having to move a mouse around constantly

## Install/Setup
*This used to be hard to setup but I noticed recently I had no problems on a new machine running Ubuntu 18.*

1. Install neovim
```
$ sudo apt install neovim
```
If you aren't using debian/ubuntu, you can figure out how to get it installed. Go have a look at [neovim](https://github.com/neovim/neovim).

2. Clone this repo to the configuration directory neovim looks for:

```
$ mkdir -p $HOME/.config && cd $HOME/.config && git clone git@github.com:kevinquinnyo/nvim.git
```

**NOTE**: neovim by default uses `$HOME/.config/nvim/init.vim` instead of the classic `$HOME/.vimrc`, and I've broken my config down into separate files.

3. Install the plugins
```
vi
```
Then: `:PlugInstall`

If nothing went wrong, you're done.  Exit vim, and re-open.

### How to Use
So right now there are a lot of plugins and many of them I don't even use.

I'm only going to go over the ones that I use on a daily basis here.

The first thing to understand about this is that I almost never open files with vim from the command line. I just open it like this:

```
vi
```

Then everything else happens from inside vim. Get used to that way of using vim.

**Very important note**: I also have remapped cycling through buffers to `<Tab>` (the TAB key) and `<S-Tab>` (`SHIFT+TAB`) to cycle in reverse. I did this because it seemed natural to me. If you don't like that, change it in `general.vim`.

1. [ctrlp](https://github.com/ctrlpvim/ctrlp.vim) This is definitely the most important plugin. It's how I find and open the file I'm looking for.

Note that I have remapped `<c-p>` to `<c-f>` meaning you would use `CTRL+F` (just like you would in a web browser) instead of `CTRL-P`. Why did I do that? If I make a mistake more than 3 times, I just accept that it's not a mistake, and automate around it. If my hands want to reach for `CTRL+F` then so be it. Feel free to change that if you don't like it.

So when you open vim in a project directory, the first thing you do is type `CTRL+F`, and start typing what you are looking for.

2. [phpactor](https://github.com/phpactor/phpactor) Arguably this should be in the #1 spot, but I'm ordering it on usage, and ctrl-p gets a slight edge. But this plugin is the core that makes this a viable PHP IDE in vim.

This provides:
- Goto definition `<Leader>o` (that's `\o`). This will take you directly to the class or class member under the cursor.
  - It works 99% of the time. The only time it doesn't work is when you're dealing with code that has a little bit too much magic and it can't figure out how to resolve the class.
- Include use statement: `<Leader>u` (that's `\u`). This will create a `use` statement for the class under the cursor. If there is ambiguity, it will provide a list and let you select the correct class. It will also alphebetize them by default.
- Transform - I use this a lot. It's a bit of a multi-purpose tool, including a nice refactoring helper. I mainly use it to apply properties to a class automatically, and to automatically implement contracts (it creates the required interface for you).
  - Just try this one and it will prompt you to choose an option.
- There's a ton of stuff baked in here that I hardly ever use or have never used. Maybe you'll use the rich feature set more than me.

3. [ale](https://github.com/dense-analysis/ale) Asynchronous Lint Engine. This is awesome for automatically bringing your code into phpcs, phpstan, phpmd, etc standards. If your project already has requirements defined for this via configuration files, it will find them, and automatically bring you into compliance every time you save. This prevents those `git commit -m 'fix coding standards ..again` commits.

4. [vim-test](https://github.com/janko/vim-test) When you are editing a test, just get the cursor near or inside the test function and then it's `t<C-n>` (that's the letter `t` followed by `CTRL+N`). I use this all the time. Sometimes you need to run a full test suite, but it's nice to just edit something, then run a test directly in vim. It's pretty amazing actually.

Everything else in this config is either cosmetic, or I don't use it very often. (I think?)
