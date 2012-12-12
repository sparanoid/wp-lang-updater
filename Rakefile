# Postholic.com WordPress Maintenance Script by Tunghsiao Liu

# Please check the wordpress download page and ensure to use most recent version
# http://ja.wordpress.org/
# http://dreamcolor.net/project/wordpress-chinese-translation/

# Server settings
ssh_user    = 'root@postholic.com'
remote_root = '/srv/www/postholic.com/public_html/wp-content'
# ssh_key   = '~/dropbox/sparanoid-web/~ssh/sparanoid.pem'

# Speicify current WordpRess version
wp_ver_short = '3.5'
wp_ver       = 'tags/3.5/messages'

# I'd like to use a tagged commit specify the version of current WordPress that I'm using.
# But Chinese WordPress kids always don't know how to tag new version for their release.
# So in this situation we have to switch to trunk to get the latest translation files
# wp_ver       = 'trunk/messages'

wp_remote = 'http://i18n.svn.wordpress.org'
wp_local  = '~/dropbox/sparanoid-web/\~localhost/\~/wp-content'
wp_tmp    = '~/dropbox/sparanoid-web/postholic.com/\~wp-tmp'

# Prevent .svn, .git, files from uploading to the server
wp_exclude = '--exclude=.*'

# wget references
# -r           -- recursive download
# -l1          -- download only level 1 directories
# --no-parent  -- no parent directories downloads for -r flag
# -nd          -- no directory structures for parents directories
# -N           -- check timestamps
# -R           -- rejlist -reject

# unzip references
# -q  quiet mode (-qq => quieter)
# -o  overwrite files WITHOUT prompting

# Default task:
# 1. Geting WordPress language files from wordpress.org to local
# 2. Geting themes language files from wordpress.org to local
desc 'Update Geting Twenty Eleven theme language files to locallocal files'
task :default => [:wplang_local, :t11_local, :t10_local] do
  puts '>>> Local files updated'
end

# Deploy task:
# 1. Re-translate incorrect and ridiculous translations made by Chinese official WordPress translation team
# 2. Upload WordPress language files to server
# 3. Upload themes language files to server
# 4. Upload custom themes (Kai series) files to server
desc 'Deploy to server'
task :deploy => [:translate, :wplang_deploy, :t11_deploy, :t10_deploy, :themes] do
  puts '>>> Deployed files to server'
end

task :wplang_local do
  puts '>>> Geting WordPress language files to local'
  # sh "wget -r -l1 --no-parent -R 'index.html*' -nd -N #{wp_remote}/zh_CN/#{wp_ver}/ -P #{wp_local}/languages/"
  # sh "wget -r -l1 --no-parent -R 'index.html*' -nd -N #{wp_remote}/ja/#{wp_ver}/ -P #{wp_local}/languages/"
  # sh "wget http://cn.wordpress.org/wordpress-#{wp_ver_short}-zh_CN.zip -P #{wp_tmp}/"
  # sh "wget http://ja.wordpress.org/wordpress-#{wp_ver_short}-ja.zip -P #{wp_tmp}/"
  sh "unzip -qqo #{wp_tmp}/wordpress-#{wp_ver_short}-zh_CN.zip -d #{wp_tmp}/cn/"
  sh "unzip -qqo #{wp_tmp}/wordpress-#{wp_ver_short}-ja.zip -d #{wp_tmp}/ja/"
  sh "cp -R #{wp_tmp}/cn/wordpress/wp-content/languages/ #{wp_local}/languages/"
  sh "cp -R #{wp_tmp}/ja/wordpress/wp-content/languages/ #{wp_local}/languages/"
  # sh "cd #{wp_local}/languages/"
  puts '>>> Done.'
end

# WordPress language files deploy task
# 1. Upload WordPress language files to server
task :wplang_deploy do
  puts '>>> Uploading WordPress language files to server'
  sh "rsync -avz --delete #{wp_exclude} #{wp_local}/languages/ #{ssh_user}:#{remote_root}/languages/"
  puts '>>> Done.'
end

task :t12_local do
  theme_dir = 'themes/twentytwelve/languages'
  puts '>>> Geting Twenty Twelve theme language file to local'
  # sh "wget -r -l1 --no-parent -R 'index.html*' -nd -N #{wp_remote}/zh_CN/#{wp_ver}/twentytwelve/ -P #{wp_local}/#{theme_dir}/"
  sh "wget -r -l1 --no-parent -R 'index.html*' -nd -N #{wp_remote}/ja/#{wp_ver}/twentytwelve/ -P #{wp_local}/#{theme_dir}/"
  # sh "cd #{wp_local}/#{theme_dir}/"
  puts '>>> Done.'
end

task :t12_deploy do
  theme_dir = 'themes/twentytwelve/languages'
  puts '>>> Uploading Twenty Twelve theme language file to server'
  sh "rsync -avz --delete #{wp_exclude} #{wp_local}/#{theme_dir}/ #{ssh_user}:#{remote_root}/#{theme_dir}/"
  puts '>>> Done.'
end

task :t11_local do
  theme_dir = 'themes/twentyeleven/languages'
  puts '>>> Geting Twenty Eleven theme language file to local'
  # sh "wget -r -l1 --no-parent -R 'index.html*' -nd -N #{wp_remote}/zh_CN/#{wp_ver}/twentyeleven/ -P #{wp_local}/#{theme_dir}/"
  sh "wget -r -l1 --no-parent -R 'index.html*' -nd -N #{wp_remote}/ja/#{wp_ver}/twentyeleven/ -P #{wp_local}/#{theme_dir}/"
  # sh "cd #{wp_local}/#{theme_dir}/"
  puts '>>> Done.'
end

task :t11_deploy do
  theme_dir = 'themes/twentyeleven/languages'
  puts '>>> Uploading Twenty Eleven theme language file to server'
  sh "rsync -avz --delete #{wp_exclude} #{wp_local}/#{theme_dir}/ #{ssh_user}:#{remote_root}/#{theme_dir}/"
  puts '>>> Done.'
end

task :t10_local do
  theme_dir = 'themes/twentyten/languages'
  puts '>>> Geting Twenty Ten theme language file to local'
  # sh "wget -r -l1 --no-parent -R 'index.html*' -nd -N #{wp_remote}/zh_CN/#{wp_ver}/twentyten/ -P #{wp_local}/#{theme_dir}/"
  sh "wget -r -l1 --no-parent -R 'index.html*' -nd -N #{wp_remote}/ja/#{wp_ver}/twentyten/ -P #{wp_local}/#{theme_dir}/"
  # sh "cd #{wp_local}/#{theme_dir}/"
  puts '>>> Done.'
end

task :t10_deploy do
  theme_dir = 'themes/twentyten/languages'
  puts '>>> Uploading Twenty Ten theme language file to server'
  sh "rsync -avz --delete #{wp_exclude} #{wp_local}/#{theme_dir}/ #{ssh_user}:#{remote_root}/#{theme_dir}/"
  puts '>>> Done.'
end

# Themes deploy task, I disabled twentytwelve here cus it has built-in support for theme auto update
# 1. Upload custom themes (Kai series) files to server
task :themes => [:t11k, :t10k] do
  puts '>>> Uploaded custom themes to server'
end

task :t12k do
  puts '>>> Uploading Twenty Twelve Kai to server'
  sh "rsync -avz --delete #{wp_exclude} #{wp_local}/themes/twentytwelve-kai/ #{ssh_user}:#{remote_root}/themes/twentytwelve-kai/"
  puts '>>> Done.'
end

task :t11k do
  puts '>>> Uploading Twenty Eleven Kai to server'
  sh "rsync -avz --delete #{wp_exclude} #{wp_local}/themes/twentyeleven-kai/ #{ssh_user}:#{remote_root}/themes/twentyeleven-kai/"
  puts '>>> Done.'
end

task :t10k do
  puts '>>> Uploading Twenty Ten Kai to server'
  sh "rsync -avz --delete #{wp_exclude} #{wp_local}/themes/twentyten-kai/ #{ssh_user}:#{remote_root}/themes/twentyten-kai/"
  puts '>>> Done.'
end

# Translate task
# 1. Re-translate incorrect and ridiculous translations made by Chinese official WordPress translation team
desc 'Translate stupid offical strings'
task :translate do
  puts '>>> Translating bad offical strings'
  sh "sh ./wp-translate.sh"
  puts '>>> Done.'
end
