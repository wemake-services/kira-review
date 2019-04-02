# Code review automation
# https://github.com/danger/danger
#
# Policy:
# 1. Use `warn` for all things that are important, but not related to code.
#   So it will be possible to fix these issues without creating new commits
# 2. Use `failure` for all things that are important and are related to code.
#   So people will have to create new commits to address these issues.
# 3. Place `failure`s after all `warn` rules
#   to collect maximum amount of issues in a code review comment
#
# Runtime:
# Note, that this script is executed inside a docker container,
# and we tend to use the full path. The same as in Dockerfile.
# In case you just want to copy this file, then deal with paths.

# Welcome message:
message(
  "Before getting a real human to review your code I am here to help you.

  Make sure that you are familiar with our [merge request workflow](https://wemake.services/meta/rsdp/creating-merge-requests).

  Long story short, you will need to fix critical issues, otherwise your CI build will not pass. Warnings are also required to be fixed, but there are some exceptions when it is fine to leave them as-is.

  Reviewer must ask you about unfixed warnings if something is not clear.

  If you have any questions:
  1. Read docs: https://github.com/wemake-services/kira-review
  2. Ping your architect, ask right away
  3. Create a bug, that something is not working / is not clear

  Have fun!"
)

# Can only warn:
danger.import_dangerfile(path: "/danger/danger-stages/optional/")

# Platform specific files (can both `warn` and `fail` pipeline):
ENV.fetch("DANGER_PLATFORMS", "").split(",").each { |platform|
  danger.import_dangerfile(
    path: "/danger/danger-platforms/#{platform.strip()}/"
  )
}

# Critical checks, fail only:
danger.import_dangerfile(path: "/danger/danger-stages/critical/")
