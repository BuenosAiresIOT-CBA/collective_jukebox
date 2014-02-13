module.exports = function(){
    switch(process.env.NODE_ENV){
        case 'production':
        return {

        };
        case 'test':
        return {
   
        };
        default :
        return {
        };
    }
};
