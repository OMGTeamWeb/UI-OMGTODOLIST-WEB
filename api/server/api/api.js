var router = require('express').Router();

// api router will mount other routers
// for all our resources
router.use('/teacher', require('./teacher/teacherRoutes'));
router.use('/student', require('./student/studentRoutes'));
router.use('/group', require('./group/groupRoutes'));

router.use('/bimester', require('./bimester/bimesterRoutes'));
router.use('/topic', require('./topic/topicRoutes'));
router.use('/exercise', require('./exercise/exerciseRoutes'));
router.use('/method', require('./method/methodRoutes'));
router.use('/attempt', require('./attempt/attemptRoutes'));

module.exports = router;
