module.exports = function(){
    switch(process.env.NODE_ENV){
        case 'production':
          server: 'http://ancient-bayou-6222.herokuapp.com'

        };
        case 'staging':
        return {
          server: 'http://ancient-bayou-6222.herokuapp.com'
        };
        default:
        return {
          server: 'http://localhost:3000'

        }
      };
    };