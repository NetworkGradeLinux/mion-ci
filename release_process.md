# Release process
* The mion project follows a quartelry release cycle, with releases targeting December, March, June and September of each year
* The releases are named <yocto_branch>-\<year>.\<month>, for example `dunfell-2020.12`
* Releases code are named alphabetically after the islands of ireland [listed here](https://en.wikipedia.org/wiki/List_of_islands_of_Ireland) - Achill, Blasket, ...
* In the interest keeping things simple and managabe there is currently no branching straegy for releases
* **Strictly no releases on a Friday - EVER - no exceptions**

## Released and tagged repos:
- mion
- meta-mion
- meta-mion-bsp
- mion-ci
- mion-docs

# Release Candidate checklist - gating criteria
1. All submodules have been updated
1. DISTRO_VERSION and DISTRO_NAME have been bumped in meta-mion (see note on release names below) 
1. Last CI run passing [CI Actions](https://github.com/APS-Networks/mion-ci/actions)
1. Smoke test is performed and passing (see below) on all available platforms
1. Release candidate tags generated and pushed to all repos

# Release checklist - gating criteria
1. All RC checklist items (above) have been satisfied - the release should be the same as the final RC
1. All issues tagged for this release milestone have been closed (or removed if they will not be completed) [mion project board](https://github.com/orgs/NetworkGradeLinux/projects/1)
1. All new bugs have been triaged (important and unresolved bugs must be tracked in the Errata of the release) [mion project board](https://github.com/orgs/NetworkGradeLinux/projects/1)
1. No outstanding merge requests (release repos and docs, CI, etc.) [Query here](https://github.com/pulls?q=is%3Aopen+is%3Apr+archived%3Afalse+user%3AAPS-Networks)
1. Documentation has been updated and copyright/licenses checked
1. Release notes have been created and reviewed (see format below)

***

## Smoke test - build and flash an image to supported hardware
- Clean check out chosen release commits on release branch branch (dunfell) build against those commits 
- Install the image onto a switch
- Test that the switch boot up and and the system appears to be working correctly, if necessary check that the containers come up correctly
- **TODO: define pre-release smoke tests / checks**

## Creating the release
- Create and push an annotated tag containing the release notes to the five repos listed above
- Create a "Release" on the top level mion repo, using the new tag and paste in the same release notes 
  - It might be necessary to slightly change the formatting of the release notes here as they will be rendedred as Markdown, eg. bullet lists

#### Format for annotated tags and GitHub release text
1. *Main features and improvements*
1. *Notable bug fixes*
1. (if required) *Errata of known issues*
1. (if required) *Breaking changes and update instructions*


## TODO
- Release testing should be defined in a test plan
- Formalise process for release announcement
