const { assert } = require('chai');
const newStudent = require('../index');

describe('Welcome New Student', () => {
    it('should welcome a new student', () => {
        assert(newStudent, "Did you add a name inside the quotations?")
        assert.isAbove(newStudent.length, 0);
    });
});