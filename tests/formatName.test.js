const assert = require("assert");
const { displayName } = require("../contents/ui/logic/formatName.js");
let passed = 0, failed = 0;
function test(name, fn) {
  try { fn(); passed++; }
  catch (e) { failed++; console.error("FAIL: " + name + " -> " + e.message); }
}
test("nombre normal", () => assert.strictEqual(displayName("id2", ["id1","id2"], ["Trabajo","Ocio"]), "Ocio"));
test("fallback si nombre vacío", () => assert.strictEqual(displayName("id2", ["id1","id2"], ["Trabajo",""]), "Desktop 2"));
test("fallback si nombre solo espacios", () => assert.strictEqual(displayName("id1", ["id1"], ["   "]), "Desktop 1"));
test("fallback si id no está en la lista", () => assert.strictEqual(displayName("x", ["id1"], ["Trabajo"]), "Desktop 1"));
test("listas vacías no rompen", () => assert.strictEqual(displayName(undefined, [], []), "Desktop 1"));
test("desincronización ids/nombres no rompe", () => assert.strictEqual(displayName("id2", ["id1","id2"], ["Solo"]), "Desktop 2"));
console.log(`\n${passed} passed, ${failed} failed`);
process.exit(failed === 0 ? 0 : 1);
