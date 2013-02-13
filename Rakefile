# Maintenance Script by Tunghsiao Liu

# Please check the wordpress download page and ensure to use most recent version
# http://ja.wordpress.org/
# http://dreamcolor.net/project/wordpress-chinese-translation/

# Speicify current WordpRess version
wp_ver       = '3.5.1'

# localhost directory
wp_local     = '~/dropbox/sparanoid-web/\~localhost/\~/wp-content'

# Temporary files directory
wp_tmp       = '~/dropbox/sparanoid-web/postholic.com/\~wp-tmp'

# Local static files directory for storing theme zipballs for downloading
local_static = '~/dropbox/sparanoid-web/static.sparanoid.com'

# Rakefile frome sparanoid.com to sync local static files to Amazon S3
s3_rake      = '~/dropbox/sparanoid-code/sparanoid.com/Rakefile'

# Lab directory for updating themes .json files
lab_static   = '~/dropbox/sparanoid-web/sparanoid.com/'

# Server settings
ssh_user     = 'root@postholic.com'
remote_root  = '/srv/www/postholic.com/public_html/wp-content'

# Prevent .svn, .git, files from uploading to the server
wp_exclude   = '--exclude=.*'

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

# Default task
desc 'Download and update language files to localhost'
task :default => [:download, :update, :translate] do
  puts "Task completed"
end

# Deploy task
desc 'Deploy to server'
task :deploy => [:translate, :lang] do
  puts "Deploying translations and themes completed"
end

# Download task
# - Geting WordPress and themes language files from wordpress.org to local
task :download do
  sh "wget -N http://cn.wordpress.org/wordpress-#{wp_ver}-zh_CN.zip -P #{wp_tmp}/"
  sh "wget -N http://ja.wordpress.org/wordpress-#{wp_ver}-ja.zip -P #{wp_tmp}/"
  puts "Downloading WordPress language files                 Done"
end

# Update task
# - Copy (Update) language files to localhost
task :update do
  system "unzip -qqo #{wp_tmp}/wordpress-#{wp_ver}-zh_CN.zip -d #{wp_tmp}/cn/"
  system "unzip -qqo #{wp_tmp}/wordpress-#{wp_ver}-ja.zip -d #{wp_tmp}/ja/"
  system "cp -R #{wp_tmp}/cn/wordpress/wp-content/languages/ #{wp_local}/languages/"
  system "cp -R #{wp_tmp}/ja/wordpress/wp-content/languages/ #{wp_local}/languages/"
  system "rm -rf #{wp_local}/languages/zh_CN*.css"
  system "rm -rf #{wp_local}/languages/zh_CN*.js"
  system "rm -rf #{wp_local}/languages/zh_CN*.php"
  puts "Updaing language files to localhost                  Done"
end

# Translate task
# - Re-translate incorrect and ridiculous translations made by Chinese official WordPress translation team
desc 'Translate stupid official strings'
task :translate do
  system "sh ./wp-translate.sh"
  puts "Translating bad official strings                     Done"
end

# Language files deploy task
# - Upload WordPress and themes language files to server
task :lang do
  system "rsync -avz --delete #{wp_exclude} #{wp_local}/languages/ #{ssh_user}:#{remote_root}/languages/"
  puts "Uploading WordPress language files to server         Done"
end

# Kai series themes deploy task
# - Upload custom themes (Kai series) files to server
task :theme => [:t12k, :t11k, :t10k] do
  puts "Deploying Kai series themes completed"
  system "rake --rakefile #{s3_rake} s3"
  puts "Tagging new versions and uploading to Amazon S3 completed"
  system "make -C #{lab_static}"
  puts "Bumping new versions to make theme updatable completed"
end

task :t12k do
  theme = 'twentytwelve-kai'
  system "rsync -avz --delete #{wp_exclude} #{wp_local}/themes/twentytwelve-kai/ #{ssh_user}:#{remote_root}/themes/twentytwelve-kai/"
  puts "Uploading Twenty Twelve Kai to server                Done"
  system "git --work-tree #{wp_local}/themes/#{theme}/ --git-dir #{wp_local}/themes/#{theme}/.git archive --format=zip --prefix=#{theme}/ -o #{local_static}/download/#{theme}.zip HEAD"
  puts "Creating zipball to static.sparanoid.com             Done"
end

task :t11k do
  theme = 'twentyeleven-kai'
  system "rsync -avz --delete #{wp_exclude} #{wp_local}/themes/twentyeleven-kai/ #{ssh_user}:#{remote_root}/themes/twentyeleven-kai/"
  puts "Uploading Twenty Eleven Kai to server                Done"
  system "git --work-tree #{wp_local}/themes/#{theme}/ --git-dir #{wp_local}/themes/#{theme}/.git archive --format=zip --prefix=#{theme}/ -o #{local_static}/download/#{theme}.zip HEAD"
  puts "Creating zipball to static.sparanoid.com             Done"
end

task :t10k do
  theme = 'twentyten-kai'
  system "rsync -avz --delete #{wp_exclude} #{wp_local}/themes/twentyten-kai/ #{ssh_user}:#{remote_root}/themes/twentyten-kai/"
  puts "Uploading Twenty Ten Kai to server                   Done"
  system "git --work-tree #{wp_local}/themes/#{theme}/ --git-dir #{wp_local}/themes/#{theme}/.git archive --format=zip --prefix=#{theme}/ -o #{local_static}/download/#{theme}.zip HEAD"
  puts "Creating zipball to static.sparanoid.com             Done"
end

# Clean task
desc 'Clean up cache files in temporary directory'
task :clean do
  system "mkdir #{wp_tmp}/_todelete"
  system "mv -f #{wp_tmp}/* #{wp_tmp}/_todelete"
  system "mv -f #{wp_tmp}/_todelete/wordpress-#{wp_ver}-zh_CN.zip #{wp_tmp}/_todelete/wordpress-#{wp_ver}-ja.zip #{wp_tmp}/"
  system "rm -rf #{wp_tmp}/_todelete/"
  puts "Cleaning file cache                                  Done"
end