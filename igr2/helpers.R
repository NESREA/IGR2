# helpers.R
library(stringr)

zones <- c('NCZH', 'NEZH', 'NWZH', 'SEZH', 'SSZH', 'SWZH')

states <- c(
  'ANAMBRA',    'BENUE',     'BORNO',   'CRS',
  'EBONYI',     'EKITI',     'ENUGU',   'GOMBE',
  'IMO',        'KADUNA',    'KANO',    'KATSINA',
  'KEBBI',      'KWARA',     'LAGOS',   'NASS',
  'NIGER',      'ONDO',      'OSUN',    'OYO',
  'PLATEAU',    'RIVERS',    'SOKOTO'
)
names(states) <- states %>% 
  str_to_title()
  

revenueCategory <- structure(
  c(
    'con.renew',
    'nat.guid',
    'nat.reg',
    'nc.admin',
    'aud.cert',
    'aqwt.perm',
    'lab',
    'appl.emp',
    'imp.ueee',
    'res.ref.id',
    'con.reg.wshp',
    'bids',
    'bts',
    'epr.man',
    'accred.ve',
    'tender'
  ),
  names = c(
    'Consultant renewal',
    'Guidelines',
    'Regulations',
    'Admin Fines',
    'Audit',
    'AQWT Permit',
    'Laboratory',
    'EMP Application',
    'Import of UEEE',
    'Resig/Refer/ID',
    'Consultant W/shop',
    'Bids',
    'BTS',
    'EPR Manual',
    'NVECP',
    'Tenders'
  )
)
