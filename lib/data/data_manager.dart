import 'dart:math';

import 'package:financial_assistant/models/course_model.dart';
import 'package:financial_assistant/models/news_model.dart';

import '../../data/shared_preference_service.dart';
import '../models/test_model.dart';
import '../models/wallet_model.dart';

class DataManager {
  static WalletModel data =
      WalletModel(totalBalance: 0, incomesData: [], expensesData: []);

  static Future<void> addOrUpdateWallet(WalletModel inputData) async {
    data = await SharedPreferencesService.getLoanOutputDataList() ??
        WalletModel(totalBalance: 0, incomesData: [], expensesData: []);

    // Check if the data is not equal to inputData
    if (data != inputData) {
      // Update existing item
      data = inputData;
      await SharedPreferencesService.saveLoanOutputDataList(data);
    }
  }

  static Future<List<WalletModel>> getWallet() async {
    data = await SharedPreferencesService.getLoanOutputDataList() ??
        WalletModel(totalBalance: 0, incomesData: [], expensesData: []);
    return [data];
  }

  static Future<void> addToIncomeList(WalletChangeData newIncome) async {
    // Get the current data from SharedPreferences
    data = await SharedPreferencesService.getLoanOutputDataList() ??
        WalletModel(totalBalance: 0, incomesData: [], expensesData: []);

    // Add the new income to the list
    data.incomesData.add(newIncome);
    // Update the total balance
    updateTotalBalance();

    // Update and save the data
    await SharedPreferencesService.saveLoanOutputDataList(data);
  }

  static Future<void> addToExpensesList(WalletChangeData newExpense) async {
    // Get the current data from SharedPreferences
    data = await SharedPreferencesService.getLoanOutputDataList() ??
        WalletModel(totalBalance: 0, incomesData: [], expensesData: []);

    // Add the new expense to the list
    data.expensesData.add(newExpense);
    // Update the total balance
    updateTotalBalance();

    // Update and save the data
    await SharedPreferencesService.saveLoanOutputDataList(data);
  }

  static Future<double> getTotalBalance() async {
    // Get the current data from SharedPreferences
    data = await SharedPreferencesService.getLoanOutputDataList() ??
        WalletModel(totalBalance: 0, incomesData: [], expensesData: []);

    // Calculate the total balance
    double totalIncome = data.incomesData
        .map((income) => income.changeValue)
        .fold(0, (sum, amount) => sum + amount);

    double totalExpense = data.expensesData
        .map((expense) => expense.changeValue)
        .fold(0, (sum, amount) => sum + amount);

    return data.totalBalance +
        await getTotalExpenses() +
        await getTotalExpenses();
  }

  static Future<double> getTotalIncomes() async {
    // Get the current data from SharedPreferences
    data = await SharedPreferencesService.getLoanOutputDataList() ??
        WalletModel(totalBalance: 0, incomesData: [], expensesData: []);

    // Calculate the total balance
    double totalIncome = data.incomesData
        .map((income) => income.changeValue)
        .fold(0, (sum, amount) => sum + amount);

    return totalIncome;
  }

  static Future<double> getTotalExpenses() async {
    // Get the current data from SharedPreferences
    data = await SharedPreferencesService.getLoanOutputDataList() ??
        WalletModel(totalBalance: 0, incomesData: [], expensesData: []);

    // Calculate the total balance
    double totalExpense = data.expensesData
        .map((expense) => expense.changeValue)
        .fold(0, (sum, amount) => sum + amount);

    return totalExpense;
  }

  static void updateTotalBalance() {
    // Calculate the total balance
    double totalIncome = data.incomesData
        .map((income) => income.changeValue)
        .fold(0, (sum, amount) => sum + amount);

    double totalExpense = data.expensesData
        .map((expense) => expense.changeValue)
        .fold(0, (sum, amount) => sum + amount);

    // Update the total balance in the data
    data.totalBalance = totalIncome - totalExpense;
  }

  static Future<List<CourseModel>> getRandom3Courses() async {
    List<CourseModel> allCourses = await getAllCourse();
    // Проверяем, что у нас есть хотя бы 3 курса в общем списке
    if (allCourses.length < 3) {
      throw Exception("Недостаточно курсов для выбора случайных трех.");
    }

    // Создаем копию общего списка, чтобы не изменять оригинал
    List<CourseModel> copyList = List.from(allCourses);

    // Создаем генератор случайных чисел
    var random = Random();

    // Выбираем три случайных курса
    List<CourseModel> randomCourses = [];
    for (int i = 0; i < 3; i++) {
      int randomIndex = random.nextInt(copyList.length);
      randomCourses.add(copyList[randomIndex]);
      copyList.removeAt(randomIndex);
    }

    return randomCourses;
  }

  static Future<List<CourseModel>> getAllCourse() async {
    List<CourseModel> models = [
      CourseModel(
          imgUrl:
              'https://www.shutterstock.com/image-photo/financial-economic-crisis-coins-graph-260nw-2164600715.jpg',
          courseName: "Основы финансового анализа",
          courseDescription:
              "Этот курс знакомит вас с основными понятиями и методами финансового анализа. Вы узнаете, как оценивать финансовое состояние и результаты деятельности компаний, как анализировать финансовые отчеты, как использовать финансовые показатели, как проводить финансовое моделирование и прогнозирование, как оценивать инвестиционные проекты и риски.",
          test: TestModel(
              testName: "Тест по основам финансового анализа",
              questions: [
                QuestionModel(
                    questionText: "Что такое баланс?",
                    options: [
                      "Отчет, показывающий активы, обязательства и капитал компании на определенную дату",
                      "Отчет, показывающий доходы, расходы и прибыль компании за определенный период времени",
                      "Отчет, показывающий движение денежных средств компании за определенный период времени",
                      "Отчет, показывающий изменение капитала компании за определенный период времени"
                    ],
                    correctOptionIndex: 0),
                QuestionModel(
                    questionText: "Что такое отчет о прибылях и убытках?",
                    options: [
                      "Отчет, показывающий активы, обязательства и капитал компании на определенную дату",
                      "Отчет, показывающий доходы, расходы и прибыль компании за определенный период времени",
                      "Отчет, показывающий движение денежных средств компании за определенный период времени",
                      "Отчет, показывающий изменение капитала компании за определенный период времени"
                    ],
                    correctOptionIndex: 1),
                QuestionModel(
                    questionText:
                        "Что такое отчет о движении денежных средств?",
                    options: [
                      "Отчет, показывающий активы, обязательства и капитал компании на определенную дату",
                      "Отчет, показывающий доходы, расходы и прибыль компании за определенный период времени",
                      "Отчет, показывающий движение денежных средств компании за определенный период времени",
                      "Отчет, показывающий изменение капитала компании за определенный период времени"
                    ],
                    correctOptionIndex: 2),
                QuestionModel(
                    questionText: "Что такое ликвидность?",
                    options: [
                      "Способность компании платить свои краткосрочные обязательства",
                      "Способность компании генерировать прибыль из своих активов",
                      "Способность компании привлекать долгосрочное финансирование",
                      "Способность компании расти и развиваться в долгосрочной перспективе"
                    ],
                    correctOptionIndex: 0),
                QuestionModel(
                    questionText: "Что такое рентабельность?",
                    options: [
                      "Способность компании платить свои краткосрочные обязательства",
                      "Способность компании генерировать прибыль из своих активов",
                      "Способность компании привлекать долгосрочное финансирование",
                      "Способность компании расти и развиваться в долгосрочной перспективе"
                    ],
                    correctOptionIndex: 1),
                QuestionModel(
                    questionText: "Что такое финансовый рычаг?",
                    options: [
                      "Отношение долга к капиталу компании",
                      "Отношение активов к капиталу компании",
                      "Отношение прибыли к доходу компании",
                      "Отношение прибыли к капиталу компании"
                    ],
                    correctOptionIndex: 0),
                QuestionModel(
                    questionText: "Что такое коэффициент текучести?",
                    options: [
                      "Отношение наличных и эквивалентов к краткосрочным обязательствам компании",
                      "Отношение оборотных активов к краткосрочным обязательствам компании",
                      "Отношение оборотных активов за вычетом запасов к краткосрочным обязательствам компании",
                      "Отношение оборотных активов за вычетом дебиторской задолженности к краткосрочным обязательствам компании"
                    ],
                    correctOptionIndex: 2),
                QuestionModel(
                    questionText:
                        "Что такое коэффициент оборачиваемости активов?",
                    options: [
                      "Отношение дохода к среднему балансу активов компании",
                      "Отношение прибыли к среднему балансу активов компании",
                      "Отношение дохода к среднему балансу капитала компании",
                      "Отношение прибыли к среднему балансу капитала компании"
                    ],
                    correctOptionIndex: 0),
                QuestionModel(
                    questionText: "Что такое чистая текущая стоимость (NPV)?",
                    options: [
                      "Разница между приведенной стоимостью будущих денежных потоков от инвестиционного проекта и его начальной стоимостью",
                      "Разница между будущей стоимостью будущих денежных потоков от инвестиционного проекта и его начальной стоимостью",
                      "Разница между приведенной стоимостью будущих денежных потоков от инвестиционного проекта и его конечной стоимостью",
                      "Разница между будущей стоимостью будущих денежных потоков от инвестиционного проекта и его конечной стоимостью"
                    ],
                    correctOptionIndex: 0),
              ])),
      CourseModel(
        imgUrl:
            'https://thumbs.dreamstime.com/b/infographic-showing-economics-trends-39390289.jpg',
        courseName: "Основы макроэкономики",
        courseDescription:
            "Этот курс знакомит вас с основными понятиями и инструментами макроэкономического анализа. Вы узнаете о роли государства в регулировании экономики, о причинах и последствиях инфляции и безработицы, о взаимодействии между денежной и фискальной политикой, о влиянии международной торговли и курсов валют на национальный доход и благосостояние.",
        test: TestModel(
          testName: "Тест по основам макроэкономики",
          questions: [
            QuestionModel(
                questionText: "Что такое ВВП?",
                options: [
                  "Сумма всех доходов, полученных в экономике за определенный период времени",
                  "Сумма всех расходов, совершенных в экономике за определенный период времени",
                  "Сумма всех товаров и услуг, произведенных в экономике за определенный период времени",
                  "Все вышеперечисленное"
                ],
                correctOptionIndex: 3),
            QuestionModel(
                questionText: "Что такое инфляция?",
                options: [
                  "Повышение общего уровня цен в экономике",
                  "Повышение количества денег в обращении",
                  "Повышение уровня безработицы в экономике",
                  "Повышение производительности труда в экономике"
                ],
                correctOptionIndex: 0),
            QuestionModel(
                questionText: "Что такое дефицит бюджета?",
                options: [
                  "Превышение расходов государства над его доходами за определенный период времени",
                  "Превышение доходов государства над его расходами за определенный период времени",
                  "Разница между сбережениями и инвестициями в экономике",
                  "Разница между экспортом и импортом в экономике"
                ],
                correctOptionIndex: 0),
            QuestionModel(
                questionText: "Что такое денежная политика?",
                options: [
                  "Действия государства по управлению денежным обращением и установлению процентных ставок",
                  "Действия государства по управлению государственным долгом и дефицитом бюджета",
                  "Действия государства по управлению налоговой системой и распределением доходов",
                  "Действия государства по управлению торговым балансом и курсом национальной валюты"
                ],
                correctOptionIndex: 0),
            QuestionModel(
                questionText: "Что такое фискальная политика?",
                options: [
                  "Действия государства по управлению денежным обращением и установлению процентных ставок",
                  "Действия государства по управлению государственным долгом и дефицитом бюджета",
                  "Действия государства по управлению налоговой системой и распределением доходов",
                  "Действия государства по управлению торговым балансом и курсом национальной валюты"
                ],
                correctOptionIndex: 2),
            QuestionModel(
                questionText: "Что такое агрегатный спрос?",
                options: [
                  "Сумма всех планируемых расходов на товары и услуги в экономике при данном уровне цен",
                  "Сумма всех планируемых доходов от продажи товаров и услуг в экономике при данном уровне цен",
                  "Сумма всех фактических расходов на товары и услуги в экономике за определенный период времени",
                  "Сумма всех фактических доходов от продажи товаров и услуг в экономике за определенный период времени"
                ],
                correctOptionIndex: 0),
            QuestionModel(
                questionText: "Что такое агрегатное предложение?",
                options: [
                  "Сумма всех планируемых расходов на товары и услуги в экономике при данном уровне цен",
                  "Сумма всех планируемых доходов от продажи товаров и услуг в экономике при данном уровне цен",
                  "Сумма всех фактических расходов на товары и услуги в экономике за определенный период времени",
                  "Сумма всех фактических доходов от продажи товаров и услуг в экономике за определенный период времени"
                ],
                correctOptionIndex: 1),
            QuestionModel(
                questionText: "Что такое мультипликатор?",
                options: [
                  "Коэффициент, показывающий, насколько изменяется агрегатный спрос в ответ на изменение одного из его компонентов",
                  "Коэффициент, показывающий, насколько изменяется агрегатное предложение в ответ на изменение одного из его компонентов",
                  "Коэффициент, показывающий, насколько изменяется уровень цен в ответ на изменение агрегатного спроса или предложения",
                  "Коэффициент, показывающий, насколько изменяется уровень дохода в ответ на изменение уровня сбережений или инвестиций"
                ],
                correctOptionIndex: 0),
            QuestionModel(
                questionText: "Что такое баланс платежей?",
                options: [
                  "Система учета всех денежных потоков, связанных с международными транзакциями экономических агентов за определенный период времени",
                  "Система учета всех товарных и услугных потоков, связанных с международной торговлей экономических агентов за определенный период времени",
                  "Система учета всех долговых и кредитных обязательств, связанных с международным финансирования",
                ],
                correctOptionIndex: 0),
          ],
        ),
      ),
      CourseModel(
        imgUrl:
            'https://www.investopedia.com/thmb/JIiZGZL6coMkdKoKy0cBuLj7JbY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/development-economics.asp-final-9a5837e42dfa4054bc69e63eb979ff52.png',
        courseName: "Введение в макроэкономику",
        courseDescription:
            "Этот курс представляет основные принципы и понятия макроэкономики, включая изучение влияния национального дохода, инфляции и безработицы на экономику.",
        test: TestModel(
          testName: "Тест по макроэкономике",
          questions: [
            QuestionModel(
                questionText: "Что такое ВВП?",
                options: [
                  "Общий объем производства товаров и услуг в стране за определенный период времени",
                  "Общий объем продаж товаров и услуг в стране за определенный период времени",
                  "Общий объем прибыли от продаж товаров и услуг в стране за определенный период времени",
                  "Общий объем инвестиций в экономику страны за определенный период времени"
                ],
                correctOptionIndex: 0),
            QuestionModel(
                questionText: "Что такое инфляция?",
                options: [
                  "Уменьшение общего уровня цен на товары и услуги",
                  "Увеличение общего уровня цен на товары и услуги",
                  "Стабилизация общего уровня цен на товары и услуги",
                  "Отсутствие изменений в общем уровне цен на товары и услуги"
                ],
                correctOptionIndex: 1),
            // Add more questions here...
          ],
        ),
      ),
      CourseModel(
        imgUrl:
            'https://keydifferences.com/wp-content/uploads/2019/08/economics-vs-economy.jpg',
        courseName: "Финансовая грамотность",
        courseDescription:
            "Этот курс направлен на развитие финансовой грамотности, включая понимание личных финансов, управление бюджетом и основы инвестирования.",
        test: TestModel(
          testName: "Тест по финансовой грамотности",
          questions: [
            QuestionModel(
                questionText: "Что такое кредитный рейтинг?",
                options: [
                  "Оценка финансовой устойчивости банка",
                  "Оценка финансовой устойчивости физического лица или компании",
                  "Оценка стоимости заемных средств в экономике",
                  "Оценка уровня инфляции в стране"
                ],
                correctOptionIndex: 1),
            QuestionModel(
                questionText: "Что включает в себя бюджет?",
                options: [
                  "Только доходы",
                  "Только расходы",
                  "Доходы и расходы",
                  "Только инвестиции"
                ],
                correctOptionIndex: 2),
            // Add more questions here...
          ],
        ),
      ),
      CourseModel(
        imgUrl:
            'https://cepr.org/sites/default/files/styles/16_9_small/public/voxeu-cover-image/AdobeStock_335877295.jpeg',
        courseName: "Экономика в современном мире",
        courseDescription:
            "Курс предоставляет обзор основных экономических концепций и тенденций, действующих в современном мире.",
        test: TestModel(
          testName: "Тест по современной экономике",
          questions: [
            QuestionModel(
                questionText: "Что такое мировая торговля?",
                options: [
                  "Обмен товарами и услугами только внутри страны",
                  "Обмен товарами и услугами между разными странами",
                  "Обмен внутри страны и между странами",
                  "Обмен только финансовыми активами между странами"
                ],
                correctOptionIndex: 2),
            QuestionModel(
                questionText: "Что влияет на валютный курс?",
                options: [
                  "Только экономические показатели страны",
                  "Только политические события",
                  "Экономические и политические события",
                  "Только курс золота на мировом рынке"
                ],
                correctOptionIndex: 2),
            // Add more questions here...
          ],
        ),
      ),
      CourseModel(
        imgUrl:
            'https://images.squarespace-cdn.com/content/v1/593bf4fa46c3c411477261b8/1592933059663-RMAAL13LYV02WCPF68G4/What+Is+the+Economic+Impact+of+Cryptocurrency%3F+.jpg',
        courseName: "Управление личными финансами",
        courseDescription:
            "Этот курс научит вас эффективно управлять своими личными финансами, планировать бюджет, и принимать обоснованные финансовые решения.",
        test: TestModel(
          testName: "Тест по управлению личными финансами",
          questions: [
            QuestionModel(
                questionText: "Что включает в себя финансовый план?",
                options: [
                  "Только доходы",
                  "Только расходы",
                  "Доходы и расходы",
                  "Только инвестиции"
                ],
                correctOptionIndex: 2),
            QuestionModel(
                questionText:
                    "Какие факторы следует учитывать при выборе метода инвестирования?",
                options: [
                  "Только потенциальная доходность",
                  "Только уровень риска",
                  "Потенциальная доходность и уровень риска",
                  "Только наличие страховки"
                ],
                correctOptionIndex: 2),
            // Add more questions here...
          ],
        ),
      ),
      CourseModel(
        imgUrl:
            'https://internationalfinance.com/wp-content/uploads/2022/03/ifm-feature-cryptocurrency-reshape-global-economy.jpg',
        courseName: "Финансовые рынки и инструменты",
        courseDescription:
            "Курс ознакомит вас с основными финансовыми рынками и инструментами, такими как акции, облигации, и деривативы.",
        test: TestModel(
          testName: "Тест по финансовым рынкам",
          questions: [
            QuestionModel(
                questionText: "Что такое акции?",
                options: [
                  "Доли владения в компании",
                  "Долговые обязательства компании",
                  "Инструменты защиты от инфляции",
                  "Инвестиционные сертификаты"
                ],
                correctOptionIndex: 0),
            QuestionModel(
                questionText: "Что представляют собой облигации?",
                options: [
                  "Доли владения в компании",
                  "Долговые обязательства компании",
                  "Инструменты защиты от инфляции",
                  "Инвестиционные сертификаты"
                ],
                correctOptionIndex: 1),
            // Add more questions here...
          ],
        ),
      ),
    ];

    return models;
  }

  static Future<List<NewsModel>> getAllNews() async {
    List<NewsModel> news = [
      NewsModel(
          urlToImage:
              "https://friendsoftheearth.eu/wp-content/uploads/2022/01/new-ec-2-1024x1024.jpg",
          title:
              "Экономисты прогнозируют снижение инфляции в США и избежание рецессии",
          description:
              "По результатам опроса большинство бизнес-экономистов считают, что американская экономика сможет избежать рецессии в следующем году, даже если рынок труда ослабеет под давлением высоких процентных ставок"),
      NewsModel(
          urlToImage:
              "https://lcdgroup.org/wp-content/uploads/2023/07/us_economy-KL-1024x680-1.png",
          title:
              "ВВП может создавать солнечную картину экономики, но этот показатель говорит о другом",
          description:
              "За последние четыре квартала ВВП вырос на 3%, а GDI упал на 0,16%, согласно анализу данных Министерства торговли Джозефом ЛаВоргной, главным экономистом SMBC Nikko Securities. Это самое большое расхождение между двумя показателями за последнее время."),
      NewsModel(
          urlToImage:
              "https://cdn.corporatefinanceinstitute.com/assets/economy-1-1024x402.jpeg",
          title:
              "Американцы не счастливее от экономики Байдена, несмотря на то, что крупные СМИ говорят им, как хорошо у них все",
          description:
              "Несколько СМИ и фигур настаивали на том, что американская экономика сильна и утверждали, что те, кто не признает этого, не получают правильной информации."),
      NewsModel(
          urlToImage:
              "https://www.thestatesman.com/wp-content/uploads/2020/08/ECONOMY.jpg",
          title: "Госдолг США достиг рекордного уровня в \$29 трлн",
          description:
              "Госдолг США превысил \$29 трлн впервые в истории, по данным Министерства финансов. Это произошло после того, как Конгресс одобрил пакеты стимулирования экономики на сумму более \$5 трлн в ответ на пандемию коронавируса."),
      NewsModel(
          urlToImage:
              "https://comptroller.texas.gov/economy/fiscal-notes/2023/may/images/FNmay2023ScrollLG.jpg",
          title: "Китай снижает ставку по кредитам для поддержки экономики",
          description:
              "Китай снизил ключевую ставку по кредитам впервые за почти два года, чтобы стимулировать заемщиков и поддержать рост экономики, который замедлился до минимума за 10 лет. Ставка по кредитам с однолетним сроком была снижена с 4,35% до 4,25%, а ставка по кредитам с пятилетним сроком - с 4,8% до 4,75%."),
      NewsModel(
          urlToImage:
              "https://equitablegrowth.org/wp-content/uploads/2019/10/GDP-2.0-measuring-growth-1080x675.jpg",
          title:
              "Европейский центробанк оставил процентные ставки без изменений, но увеличил программу покупки активов",
          description:
              "Европейский центробанк оставил свою основную процентную ставку на уровне 0%, но увеличил объем своей программы покупки активов с 1,85 трлн евро до 2,2 трлн евро, чтобы смягчить последствия нового всплеска коронавируса для экономики еврозоны. Банк также продлил срок действия программы до конца марта 2025 года."),
      NewsModel(
          urlToImage:
              "https://www2.deloitte.com/content/dam/insights/us/articles/4674_IbtN-July-2018/images/4675_IbtN_July-2018_1440x660.jpg/_jcr_content/renditions/cq5dam.web.1440.660.jpeg",
          title:
              "Великобритания вступает в рецессию после сокращения ВВП на 1,5% в третьем квартале",
          description:
              "Великобритания вошла в техническую рецессию после того, как ее ВВП сократился на 1,5% в третьем квартале, по данным Офиса национальной статистики. Это второй квартал подряд, когда экономика страны сокращается, что является определением рецессии. Сокращение было вызвано ограничениями, введенными для борьбы с распространением коронавируса, которые ударили по секторам услуг, производства и строительства."),
      NewsModel(
          urlToImage:
              "https://i.investopedia.com/content/video/whats_the_economy/whatstheeconomy.png",
          title:
              "Япония вышла из рецессии после роста ВВП на 5,3% в третьем квартале",
          description:
              "Японская экономика вышла из рецессии после того, как ее ВВП вырос на 5,3% в третьем квартале, по данным Кабинета министров. Это самый быстрый темп роста с 1968 года, когда начался учет данных. Восстановление было поддержано восстановлением потребления, экспорта и капитальных вложений после снятия ограничений, связанных с коронавирусом."),
      NewsModel(
          urlToImage:
              "https://www.economist.com/cdn-cgi/image/width=1424,quality=80,format=auto/content-assets/images/20230722_LDD002.jpg",
          title:
              "Россия повышает ключевую ставку до 8,5%, чтобы сдержать инфляцию",
          description:
              "Центральный банк России повысил свою ключевую ставку с 8% до 8,5%, чтобы сдержать рост инфляции, который достиг 8,1% в октябре, самого высокого уровня с 2016 года. Банк также предупредил, что может повысить ставку еще раз в декабре, если инфляционные риски не уменьшатся. Повышение ставки ударит по заемщикам и потребителям, но укрепит рубль."),
      NewsModel(
          urlToImage:
              "https://keydifferences.com/wp-content/uploads/2019/08/economics-vs-economy.jpg",
          title:
              "Индия сокращает налог на корпоративную прибыль, чтобы стимулировать экономику",
          description:
              "Правительство Индии снизило налог на корпоративную прибыль с 30% до 22%, чтобы стимулировать экономический рост, который замедлился до 5,7% во втором квартале, самого низкого уровня за шесть лет. Снижение налога также направлено на привлечение иностранных инвесторов и улучшение конкурентоспособности индийских компаний."),
    ];

    return news;
  }
}
