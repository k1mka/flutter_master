import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master/domain/repository.dart';
import 'package:flutter_master/ui/survey_screen/cubit/survey_state.dart';

class SurveyCubit extends Cubit<SurveyState> {
  SurveyCubit(this.repository) : super(SurveyInitial()) {
    getQuestion();
  }

  final Repository repository;

  // TODO(George): get from fire store
  final List<String> questions = [
    'Разница между mixin и extension',
    'Объясни разницу между агрегацией и композицией',
    'Как поддерживать чистоту кода в проекте',
    'Какие типы параметров бывают в конструкторах',
    'Что такое Future',
    'Какие шаблоны проектирования ты знаешь?',
    'Какого рода задачи на данный момент тебя просят выполнять как флаттер инженера',
    'Принципы SOLID',
    'Разница между dependency injection и inversion',
    'Какое преимущество использовать const',
    'Расскажи мне о концепции Null Safety',
    'Расскажи мне про виды компиляции которые есть в dart',
    'Какие процессы происходят на этапе компиляции?',
    'Расскажи мне все, что ты знаешь про архитектуру Flutter',
    'Что подразумевает собой реактивное программирование?',
    'Что такое event loop?',
    'На уровне операционной системы работает 4 потока, что это за потоки?',
    'Расскажи мне, как флаттер отрисовывает виджеты?',
    'Расскажи про инструменты анимаций, которые ты использовал',
    'Что такое CI/CD и зачем оно нужно?',
    'Что такое Docker Compose и зачем оно нужно?',
    'Что такое чистая архитектура?',
    'Что такое Singleton',
    'Какие типы баз данных бывают',
    'Какие есть методы коммуникации с Rest API',
    'Что такое билд контекст и зачем он нужен',
    'Какие протоколы для обмена данными ты знаешь?',
    'Что такое DAO паттерн?',
    'Что такое Repository pattern?',
    'Какие инструменты Flutter вы используете для анализа и оптимизации производительности?',
    'Объясни принцип работы JIT и AOT',
    'Какие базовые типы вы знаете? Какие структуры данных вам известны?',
    'В чем разница между dynamic и Object?',
    'В чем разница между final, var и const?',
    'Могу ли я вызвать метод add() для константного списка?',
    'От чего наследуются типы?',
    'В чём отличие List и Set?',
    'Можем ли мы изменить объект, который final?',
    'Что такое typedef и когда его можно использовать?',
    'Какие методы объектов вы знаете?',
    'Есть ли в Dart интерфейсы?',
    'Что такое абстрактный класс? Можем ли создать экземпляр абстрактного класса?',
    'Зачем использовать геттеры и сеттеры?'
  ];


  void uploadNewQuestion() async {
    emit(SurveyLoading());
    final randomQuestion = _getRandomQuestion();
    emit(SurveySuccessLoaded(randomQuestion));
  }

  void registerFail(String question) async {
    emit(SurveyLoading());
    await repository.updateFail(question);
    final randomQuestion = _getRandomQuestion();
    emit(SurveySuccessLoaded(randomQuestion));
  }

  void getQuestion() async {
    emit(SurveyLoading());
    final randomQuestion = _getRandomQuestion();
    emit(SurveySuccessLoaded(randomQuestion));
  }

  String _getRandomQuestion() {
    final random = Random();
    return questions[random.nextInt(questions.length)];
  }
}
