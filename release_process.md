# Release process (draft)

## Released and tagged repos:
- mion
- meta-mion
- meta-mion-stordis

# Pre-release checklist - gating criteria
1. All issues tagged for this release milestone have been closed
2. No outstanding merge requests (release repos and docs, CI, etc.)
3. Last CI run passing
4. Documentation has been updated and copyright/licenses checked
5. Smoke test is performed and passing (see below)
6. Release notes have been created and reviewed (see below)
- NOTE: Strictly no releases on a Friday
***

## Smoke test - build and flash an image to supported hardware
- Check out chosen release commits on release branch branch (dunfell) build against those commits 
- Flash onto a switch
- Test that the switch and containers come up correctly and the system looks like its working correctly
- **TODO: define pre-release smoke tests / checks**

## Release notes
- Should be written in advance of the release and reviewed
- Live in the annotated tags of the top level Mion repo but list all relevant changes for the release

#### Proposed format
1. List of major new features and improvements
2. List of main (important) bug fixes
3. (if required) Errata of known issues
4. (if required) Breaking changes and update instructions

## Tagged release
- Change DISTRO_VERSION to appropriate revision and commit.
- Annotated and signed git tag containing a list of new features and bug fixes since last full release - **only changes relevant to this repo should be included**

## Source release - before repos are public
- Create a working source tree by cloning everything into the right place - as if for a build
- Tar it all up with ``tar --exclude=".*" -czvf mion_vX.Y.tgz mion/``
- Make sure the documentation covers the build process for this source/tarball release
- Extract the tarball to an empty dir
    + Check that none of the git history or other hidden files have been included anywhere
    + Perform a test build to make sure everything works correctly
- Place the tarball in a public GitHub repo (TODO create this repo and make sure it works)

## Other stuff (TODO)
- How do we make sure that the docs are tagged and match the release version - docs v1.0 for release v1.0 (doc submodule? dropdown?)
- What is the process for a release announcement? email? website?
- Bug tracking once releases are public?
