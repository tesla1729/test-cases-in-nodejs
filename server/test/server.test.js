const expect = require('expect');
const request = require('supertest');

const { app } = require('./../server');





describe('GET /api/check', ()=>{

    it('should get success flag false', (done)=>{
        request(app)
            .get('/api/check')
            .expect(500)
            .expect((res)=>{
                expect(res.body.success).toBe(false);
            })
            .end(done);
    })

 })

