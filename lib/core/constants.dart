class Constants {
  // Network Service Constants
  static const requiresAuthTokenKey = 'requiresAuthToken';
  static const exampleEndPoint = '/breeds/list/all';
  static const randomQuestionEndPoint = '/questions/random/5';
  static const updateQuestionStatusEndPoint = '/questions';
  static const messageKey = 'message';
  static const contentTypeHeader = 'Content-Type';
  static const applicationJson = 'application/json';

  // Environment Constants
  static const baseUrlKey = 'baseUrl';
  static const defaultBaseUrl = 'https://flutter-master-server.onrender.com';

  // Storage Service Constants
  static const isCorrectField = 'is_correct';
  static const questionIdField = 'questionId';
  static const questionsCollection = 'questions';

  // API Field Names
  static const isCorrectApiField = 'isCorrect';

  // Local Storage Constants
  static const userIdKey = 'userId';
  static const failedQuestionsKey = '_failedQuestions';
}
