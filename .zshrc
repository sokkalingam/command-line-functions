##### My custom additions #######

# ENV Vars
export M2_REPO=$HOME/.m2
export M2_HOME=$HOME/apache-maven-3.6.3
export M2=$M2_HOME/bin
export PATH=$PATH:$M2
export PATH=$PATH:/usr/local/sbin # rabbitmq
export GOOGLE_APPLICATION_CREDENTIALS=/Users/sokkalingam.subramanian/.config/gcloud/application_default_credentials.json

## Aliases
alias editprofile="code ~/.zshrc"
alias home="cd ~/"
#mvn
alias mci="mvn clean install -DskipTests"
alias mdt="mvn dependency:tree"
#git
alias gs="git status"
alias gd="git diff"
alias gda="git --no-pager diff"
alias gp="git pull"
alias gc="git checkout"
alias gmm="gc master && gp && gc - && git merge -"
alias gms="gc staging && gp && gc - && git merge -"

## Java versions
alias java11="export JAVA_HOME=`/usr/libexec/java_home -v 11`; java -version"
alias java8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"

function commit() {
    COMMIT_MSG=$1
    if [ -z $COMMIT_MSG ]; then
        COMMIT_MSG="More changes"
        echo "No commit message set, using default: $COMMIT_MSG"
    fi
    BRANCH_NAME=$(git branch | grep '*' | cut -d' ' -f2)
    git add . && git commit -m "$BRANCH_NAME: $COMMIT_MSG"
}

function gittag() {
    git tag -a -m "Release $1" $1 && git push --follow-tags origin master
}

function killprocessonport() {
    kill $(lsof -ti:"$1")
}
