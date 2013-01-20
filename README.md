# ZooChat

It's a multi room chat system.

## for rvm user

Check ruby version.

```
cat .rvmrc.sample
```

```
cp .rvmrc.sample .rvmrc
```

Customize .rvmrc for your environment.

```
vim .rvmrc
```

Trust .rvmrc

```
cd .. && cd -
```

```
====================================================================================
= NOTICE                                                                           =
====================================================================================
= RVM has encountered a new or modified .rvmrc file in the current directory       =
= This is a shell script and therefore may contain any shell commands.             =
=                                                                                  =
= Examine the contents of this file carefully to be sure the contents are          =
= safe before trusting it! ( Choose v[iew] below to view the contents )            =
====================================================================================
Do you wish to trust this .rvmrc file? (/{path_to_your_project_dir}/zoochat/.rvmrc)
y[es], n[o], v[iew], c[ancel]> 
```

Enter 'y'

## development

Customize .env for your environment.

```
cp .env.sample .env
vim .env
```

```
foreman start -f Procfile.development
```

## heroku

```
heroku create zoochat
heroku addons:add heroku-postgresql:dev
heroku addons:add pgbackups:auto-week
heroku addons:add newrelic
heroku addons:add sendgrid:starter
heroku config:add FB_APP_ID=your_app_id FB_APP_SECRET=your_app_secret FB_APP_SCOPE=email
heroku config:add MAIL_DOMAIN=heroku.com MAIL_HOST=smtp.sendgrid.net
heroku addons:add pusher:sandbox
```
