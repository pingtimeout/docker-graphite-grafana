# Edit this file to override the default graphite settings, do not edit settings.py

# Turn on debugging and restart apache if you ever see an "Internal Server Error" page
#DEBUG = True

# Set your local timezone (django will try to figure this out automatically)
TIME_ZONE = 'UTC'

# Setting MEMCACHE_HOSTS to be empty will turn off use of memcached entirely
#MEMCACHE_HOSTS = ['127.0.0.1:11211']

# Sometimes you need to do a lot of rendering work but cannot share your storage mount
#REMOTE_RENDERING = True
#RENDERING_HOSTS = ['fastserver01','fastserver02']
#LOG_RENDERING_PERFORMANCE = True
#LOG_CACHE_PERFORMANCE = True

# If you've got more than one backend server they should all be listed here
#CLUSTER_SERVERS = []

# Override this if you need to provide documentation specific to your graphite deployment
#DOCUMENTATION_URL = "http://wiki.mycompany.com/graphite"

# Enable email-related features
#SMTP_SERVER = "mail.mycompany.com"

# LDAP / ActiveDirectory authentication setup
#USE_LDAP_AUTH = True
#LDAP_SERVER = "ldap.mycompany.com"
#LDAP_PORT = 389
#LDAP_SEARCH_BASE = "OU=users,DC=mycompany,DC=com"
#LDAP_BASE_USER = "CN=some_readonly_account,DC=mycompany,DC=com"
#LDAP_BASE_PASS = "readonly_account_password"
#LDAP_USER_QUERY = "(username=%s)"  #For Active Directory use "(sAMAccountName=%s)"

# If sqlite won't cut it, configure your real database here (don't forget to run manage.py syncdb!)
#DATABASE_ENGINE = 'mysql' # or 'postgres'
#DATABASE_NAME = 'graphite'
#DATABASE_USER = 'graphite'
#DATABASE_PASSWORD = 'graphite-is-awesome'
#DATABASE_HOST = 'mysql.mycompany.com'
#DATABASE_PORT = '3306'

SECRET_KEY = 'mydummysecret'

CARBONLINK_HOSTS = ['127.0.0.1:10012', '127.0.0.1:10022', '127.0.0.1:10032', '127.0.0.1:10042', '127.0.0.1:10052', '127.0.0.1:10062', '127.0.0.1:10072', '127.0.0.1:10082', '127.0.0.1:10092', '127.0.0.1:10102', '127.0.0.1:10112', '127.0.0.1:10122', '127.0.0.1:10132', '127.0.0.1:10142', '127.0.0.1:10152', '127.0.0.1:10162', '127.0.0.1:10172', '127.0.0.1:10182', '127.0.0.1:10192', '127.0.0.1:10202', '127.0.0.1:10212', '127.0.0.1:10222', '127.0.0.1:10232', '127.0.0.1:10242', '127.0.0.1:10252', '127.0.0.1:10262', '127.0.0.1:10272', '127.0.0.1:10282', '127.0.0.1:10292', '127.0.0.1:10302', '127.0.0.1:10312', '127.0.0.1:10322']
