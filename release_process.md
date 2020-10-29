# Release process (draft)

## Released and tagged repos:
- mion
- meta-mion
- meta-mion-stordis
- mion-ci
- mion-docs

# Release Candidate checklist - gating criteria
1. All submodules have been updated
1. DISTRO_VERSION and DISTRO_NAME have been bumped in meta-mion (see note on release names below) 
1. Last CI run passing [CI Actions](https://github.com/APS-Networks/mion-ci/actions)
1. Smoke test is performed and passing (see below)

# Pre-release checklist - gating criteria
1. All RC checklist items (above) have been satisfied
1. All issues tagged for this release milestone have been closed
1. No outstanding merge requests (release repos and docs, CI, etc.) [Query here](https://github.com/pulls?q=is%3Aopen+is%3Apr+archived%3Afalse+user%3AAPS-Networks)
1. Documentation has been updated and copyright/licenses checked
1. Release notes have been created and reviewed (see below)

- Releases are named alphabetically after the islands of ireland [listed here](https://en.wikipedia.org/wiki/List_of_islands_of_Ireland) - Achill, Blasket, ...

- **NOTE: Strictly no releases on a Friday**
***

## Smoke test - build and flash an image to supported hardware
- Clean check out chosen release commits on release branch branch (dunfell) build against those commits 
- Flash onto a switch
- Test that the switch and containers come up correctly and the system looks like its working correctly
- **TODO: define pre-release smoke tests / checks**

## Release notes
- Should be written in advance of the release and reviewed
- Live in the annotated tags of the top level Mion repo but list all relevant changes for the release

#### Proposed format for annotated tags
1. List of major new features and improvements
1. List of main (important) bug fixes
1. (if required) Errata of known issues
1. (if required) Breaking changes and update instructions

## Tagged release
- Annotated git tag containing a list of new features and bug fixes since last full release - **only changes relevant to this repo should be included**
- Make sure the docs are tagged the same as the code (dont need annotations) and available on https://docs.mion.io

## Source release (only if specifically requested by user)
- A script is provided to create a source release (only if required for a specific use case) - source_release.sh in this repo
- If this type of release is requested the resulting tarball should be extracted and built to make sure it works

## Other stuff (TODO)
- What is the process for a release announcement?
- Bug tracking once releases are public?
