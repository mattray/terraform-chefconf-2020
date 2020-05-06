name 'chefconf-2020'

default_source :supermarket

cookbook 'chefconf', path: 'chefconf-cookbook'

run_list 'chefconf'
