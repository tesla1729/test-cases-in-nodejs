var express = require('express');
const router = express.Router();

router.get('/check', (req, res)=>{
	if(req.query.id){
		res.status(200).send({success:true})
	}else{
		res.status(500).send({success:false})

	}
	
});



module.exports  = {router};
