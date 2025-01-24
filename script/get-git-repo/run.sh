#!/bin/bash

CUR_DIR=$PWD
echo "$CUR_DIR"
SCRIPT_DIR=${MLC_TMP_CURRENT_SCRIPT_PATH}

folder=${MLC_GIT_CHECKOUT_FOLDER}
if [ ! -e "${MLC_TMP_GIT_PATH}" ]; then
  cmd="rm -rf ${folder}"
  echo $cmd
  eval $cmd
  echo "******************************************************"
  echo "Current directory: ${CUR_DIR}"
  echo ""
  echo "Cloning ${MLC_GIT_REPO_NAME} from ${MLC_GIT_URL}"
  echo ""
  echo "${MLC_GIT_CLONE_CMD}";
  echo ""

  ${MLC_GIT_CLONE_CMD}
  rcode=$?

  if [ ! $rcode -eq 0 ]; then #try once more
    rm -rf $folder
    ${MLC_GIT_CLONE_CMD}
    test $? -eq 0 || exit $?
  fi

  cd ${folder}

  if [ ! -z ${MLC_GIT_SHA} ]; then

    echo ""
    cmd="git checkout -b ${MLC_GIT_SHA} ${MLC_GIT_SHA}"
    echo "$cmd"
    eval "$cmd"
    test $? -eq 0 || exit $?

  elif [ ! -z ${MLC_GIT_CHECKOUT_TAG} ]; then

    echo ""
    cmd="git fetch --all --tags"
    echo "$cmd"
    eval "$cmd"
    cmd="git checkout tags/${MLC_GIT_CHECKOUT_TAG} -b ${MLC_GIT_CHECKOUT_TAG}"
    echo "$cmd"
    eval "$cmd"
    test $? -eq 0 || exit $?
  
  else
    cmd="git rev-parse HEAD >> ../tmp-mlc-git-hash.out"
    echo "$cmd"
    eval "$cmd"
    test $? -eq 0 || exit $?
  fi

else
  cd ${folder}
fi

if [ ! -z ${MLC_GIT_PR_TO_APPLY} ]; then
  echo ""
  echo "Fetching from ${MLC_GIT_PR_TO_APPLY}"
  git fetch origin ${MLC_GIT_PR_TO_APPLY}:tmp-apply
fi

IFS=',' read -r -a cherrypicks <<< "${MLC_GIT_CHERRYPICKS}"
for cherrypick in "${cherrypicks[@]}"
do
  echo ""
  echo "Applying cherrypick $cherrypick"
  git cherry-pick -n $cherrypick
  test $? -eq 0 || exit $?
done

IFS=',' read -r -a submodules <<< "${MLC_GIT_SUBMODULES}"

for submodule in "${submodules[@]}"
do
    echo ""
    echo "Initializing submodule ${submodule}"
    git submodule update --init "${submodule}"
    test $? -eq 0 || exit $?
done

if [ ${MLC_GIT_PATCH} == "yes" ]; then
  IFS=', ' read -r -a patch_files <<< ${MLC_GIT_PATCH_FILEPATHS}
  for patch_file in "${patch_files[@]}"
  do
    echo ""
    echo "Applying patch $patch_file"
    git apply "$patch_file"
    test $? -eq 0 || exit $?
  done
fi

cd "$CUR_DIR"
