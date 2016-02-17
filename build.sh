#!/bin/sh

SOURCE="https://github.com/Benvie/JavaScriptNext.tmLanguage/archive/master.zip"
SOURCE_ZIP="tmLanguage.zip"
SOURCE_DIR="JavaScriptNext.tmLanguage*"

BUNDLE_DIR="JavaScriptNext.tmBundle"
BUNDLE_THEMES="${BUNDLE_DIR}/Themes"
BUNDLE_SYNTAXES="${BUNDLE_DIR}/Syntaxes"
BUNDLE_PREFERENCES="${BUNDLE_DIR}/Preferences"

download() {
  curl -s -L -o "${SOURCE_ZIP}" "${SOURCE}"
}

extract() {
  unzip -q "${SOURCE_ZIP}"
}

make_directories() {
  mkdir -p "${BUNDLE_DIR}"
  mkdir -p "${BUNDLE_THEMES}"
  mkdir -p "${BUNDLE_SYNTAXES}"
  mkdir -p "${BUNDLE_PREFERENCES}"
}

copy_files() {
  cp ${SOURCE_DIR}/*.tmTheme "${BUNDLE_THEMES}"
  cp ${SOURCE_DIR}/*.tmLanguage "${BUNDLE_SYNTAXES}"
  cp ${SOURCE_DIR}/*.tmPreferences "${BUNDLE_PREFERENCES}"
  cp "info.plist" "${BUNDLE_DIR}"
}

patch_syntax() {
  /usr/libexec/PlistBuddy -c "Set scopeName source.js.es6" "${BUNDLE_SYNTAXES}/JavaScriptNext.tmLanguage"
}

download
extract
make_directories
copy_files
patch_syntax
