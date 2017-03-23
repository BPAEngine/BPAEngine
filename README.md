# BPAEngine
The **Better Plymouth Animations Engine (BPAEngine)** is an engine based on plymouth that enable people to develop better boot screens without much effort.

[Plymouth](https://www.freedesktop.org/wiki/Software/Plymouth/Scripts/) is a scripting language for developing boot screens (See [some Fedora examples](https://www.youtube.com/watch?v=Q5Lfpr_WEQ0) running).

## Table of Contents

  1. [Licensing](#licensing)
  2. [Development / Contribution](#development-/-contribution)
      * [How to contribute code](#how-to-contribute-code)
      * [How to setup an BPAEngine development environment](#how-to-setup-an-bpaengine-development-environment)
      * [How to contribute documentation](#how-to-contribute-documentation)
  3. [Source Code Repository Layout](#source-code-repository-layout)


## Licensing

The **BPAEngine** is Free Software and is released under the terms of the [GPL v3](GPL3-LICENSE.txt) , except where noted. Additionally, 3rd-party content (like, but not exclusively, sample sprites and images) may be released under a different license. Please check the respective files for details.

## Development / Contribution

If you want to contribute to the **BPAEngine** read this guide on how to do that.

In particular, we are looking forward to see the following types of contributions:

  * *code*: contribute with your expertise in an area by helping us to expand the BPAEngine
  * *ideas*: participate in issue threads or start your own to have your voice heard
  * *copy editing*: fix typos, clarify language, and generally improve the quality of the content of the BPAEngine

### How to contribute code

  * Prerequisites: familiarity with [GitHub Pull Requests](https://help.github.com/articles/using-pull-requests.)

  * Fork the repository and make a pull-request with your changes

  * One of our main contributors will review your pull-request

  * If the pull request gets a positive review the reviewer will merge it

We tag our commits depending on the area that is affected by the change. Those are:

* **[engine]**  - Changes in the engine related parts at lib/BPAEngine/
* **[lib]**     - Changes in other general libraries parts at lib/
* **[samples]** - Changes in the samples provided at source/ also the sandbox directory
* **[dist]**    - Changes that affect our scripts and the Vagranfile
* **[doc]**     - Any documentation related changes at doc/ and in this README file

### How to setup an BPAEngine development environment

We are using [Vagrant](https://www.vagrantup.com/) to create our development
environment. All the tools needed for this are available for Linux, MacOS and
Windows.

1. Install [Vagrant](https://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads). Both tools support Linux, MacOS and Windows.

2. Clone this code repository:

    ```bash
    git clone git@github.com:mdeniz/BPAEngine.git
    ```

3. Execute Vagrant:

    ```bash
    vagrant up
    ```

4. Open VirtualBox to the VM running:

    ```bash
    VirtualBox
    ```

5. Login with user `root` and password `vagrant`, and then go to the vagrant directory:

    ```bash
    cd /vagrant
    ```

6. Run a preview from the sandbox code (this is the default):

    ```bash
    ./preview.sh #will preview the theme from source/sandbox/default
    ```

## Source Code Repository Layout

The BPAEngine source code repository is hosted on [Github](http://github.com/BPAEngine/BPAEngine) and organized like this:

    lib/BPAEngine   Script files that conform the engine
    lib             Other libs included
    docs            Documentation about the engine
    source/*        Subdirs here are theme related files and dirs
    source/samples  Example themes for learning
    source/sandbox  Default place for developing your theme
    *.sh            Bash scripts for previewing, exporting, installing and provisioning


Subdirs in source/ are ment to be a theme dir, each theme dir should have the same directories structure:

    theme.plymouth.template   Template file for the configuration
    theme.script     Your main script for the theme
    lib              Directory with your own libs and helper scripts

## API Reference and Guide

We are continously evolving the documentation as BPAEngine grows, check our [API Reference](https://github.com/BPAEngine/BPAEngine/blob/master/docs/reference/REFERENCE.md) or our [Guide](https://github.com/BPAEngine/BPAEngine/blob/master/docs/guide/GUIDE.md) to learn more about BPAEngine.

Happy Hacking! - :heart: Your BPAEngine Team
