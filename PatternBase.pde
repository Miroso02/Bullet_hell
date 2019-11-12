// Base for:
// 1) Bullet mPattern;
// 2) Cannon mPattern and fcPattern;

class PatternBase {
  GameObject gameObject;
  HashMap<String, Object> data = new HashMap<String, Object>();

  int time = 0; // Time passedd from creating this pattern
  int num = 0; // Number of bullet shot by this pattern
}
