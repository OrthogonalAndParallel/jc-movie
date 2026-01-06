# 脚本说明：
# 从 Git 提取信息并生成 lib/git_info.dart，供 Dart 代码读取版本/提交信息。

FILE="lib/git_info.dart"

COMMIT=`git rev-parse --short HEAD`
DESCRIBE=`git describe --tags --always`

# copy by https://gist.github.com/ericbmerritt/f52f1c48b86150704270
# https://gist.github.com/rponte/fdc0724dd984088606b0

# increment the build number (ie 115 to 116)
# VERSION=`echo $DESCRIBE | awk '{split($0,a,"-"); print a[1]}'`
BUILD=`echo $DESCRIBE | awk '{split($0,a,"-"); print a[2]}'`
PATCH=`echo $DESCRIBE | awk '{split($0,a,"-"); print a[3]}'`

if [[ "${DESCRIBE}" =~ ^[A-Fa-f0-9]+$ ]]; then
    # VERSION="0.0.0"
    BUILD=`git rev-list HEAD --count`
    PATCH=${DESCRIBE}
fi

if [ "${BUILD}" = "" ]; then
    BUILD='0'
fi

if [ "${BUILD}" = "" ]; then
    PATCH=$DESCRIBE
fi


REAL_VERSION=${BUILD}.${PATCH}
echo "const gitCommit = '$COMMIT';" > $FILE
echo "const gitTag = '$REAL_VERSION';" >> $FILE