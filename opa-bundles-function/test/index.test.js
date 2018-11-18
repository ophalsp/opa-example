const test = require(`ava`);
const tools = require(`@google-cloud/nodejs-repo-tools`);
const supertest = require(`supertest`);

const BASE_URL = process.env.BASE_URL;

test.before(`Must specify BASE_URL`, t => {
  t.truthy(BASE_URL);
});

test.before(tools.checkCredentials);

test.cb(`helloGET: should print hello world`, (t) => {
  supertest(BASE_URL)
    .get(`/helloGET`)
    .expect(200)
    .expect((response) => {
      t.is(response.text, `Hello world!`);
    })
    .end(t.end);
});
