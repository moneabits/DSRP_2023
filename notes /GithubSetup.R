## install this 
install.packages(c("usethis", "credentials"))

usethis::use_git()


# set name and email
usethis::use_git_config(user.name = "Mone Abbott",
                        user.email = "moneabbott@gmail.com")

## create a personal token 
usethis::create_github_token()


## set personal token !1
credentials::set_github_pat("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")

