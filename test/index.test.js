const handler = require('../build/index').handler;

test('Handler should say hello', async () => {
  const out = await handler();
  expect(out.hello).toBe('world');
});