//
//  GameViewController.swift
//  aliance
//
//  Created by Saq on 1/13/21.
//

import UIKit
protocol GameViewControllerDelegate {
    func endGame(player: String, trueResult: Int)
}
protocol GameViewControllerDelegateErkus {
    func endGameErkus(dic:[String:Int])
}
class GameViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var player: String!
    var delegate: GameViewControllerDelegate?
    var dic:[String:Int]!
    var delegateErkus: GameViewControllerDelegateErkus?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indent = "namesIndent"
        let cell = tableView.dequeueReusableCell(withIdentifier: indent) as! NamesTableViewCell
        if let color = UserDefaults.standard.colorForKey(key: "colorsKey") {
            cell.backgroundColor = color
        }
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = String(indexPath.row)
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        let langueage = UserDefaults.standard.string(forKey: "languageKey")
        
        switch langueage {
        case "English":
            cell.textLabel?.text = arrayEnglishWords.randomElement()
        case "Русский":
            cell.textLabel?.text = russianWordsArray.randomElement()
        default:
            cell.textLabel?.text = arrayArmenianWords.randomElement()
        }
        return cell
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var allSelected = true
        tableView.visibleCells.forEach { cell in
            if cell.isSelected == false {
                allSelected = false
            }
        }
        
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.isSelected == true {
            predictedWordsCount += 1
        }
        
        predictedWordsLable.text = "\(predictedWords): \(String(predictedWordsCount))"
        if allSelected == true {
            namesTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        predictedWordsCount -= 1
        predictedWordsLable.text = "\(predictedWords): \(String(predictedWordsCount))"
    }
    
//    override func viewDidDeasAppear(_ animated: Bool) {
//        super.viewDidDeasAppear(animated)
//        timer.invalidate()
//    }
//
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer.invalidate()
        print("anjateci timer@")
    }
    
    @IBOutlet var teamNameLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var namesTableView: UITableView!
    @IBOutlet var predictedWordsLable: UILabel!
    var predictedWordsCount = 0
    var predictedWords = ""
    var timer = Timer()
    var namesArray:[String] = []
    var counter = ""
    var counterInt = 0
    // #TODO: karanq sarqenq projecti mej swift file vor es barery @tex grne u erb petq lini @texic kanchenq
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = UserDefaults.standard.string(forKey: "timeIntervalKey") ?? ""
        if counter == "" {
            counter = "60"
        }
        counterInt = Int(counter) ?? 0
        
        title = ""
        if let color = UserDefaults.standard.colorForKey(key: "colorsKey") {
            self.view.backgroundColor = color
            namesTableView.backgroundColor = color
        }
        namesTableView.tableFooterView = UIView()
        namesTableView.layer.cornerRadius = 20
        namesTableView.allowsMultipleSelection = true
        namesTableView.allowsMultipleSelectionDuringEditing = true
        namesTableView.dataSource = self
        namesTableView.delegate = self
        time()
    }
    var name = ""
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        teamNameLabel.text = name
        print(name)
        let langueage = UserDefaults.standard.string(forKey: "languageKey")
        switch langueage {
        case "English":
            predictedWords = "Predicted words"
        case "Русский":
            predictedWords = "Предсказание слова"
        default:
            predictedWords = "Գուշակած բառեր"
        }
    }
    
    
    func time() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        counterInt = counterInt - 1
        if counterInt < 0 {
            return
        }
        if counterInt == 0 {
            //           endGame()
            endGameErkus()
            return
        }
        timeLabel.text = String(counterInt)
    }
    func endGame() {
        delegate?.endGame(player: player, trueResult: predictedWordsCount)
        navigationController?.popViewController(animated: true)
    }
    func endGameErkus() {
        delegateErkus?.endGameErkus(dic: [player:predictedWordsCount])
        navigationController?.popViewController(animated: true)
    }
    

    
    
    var arrayEnglishWords = ["women", "men", "girl", "boy", "child", "friend", "husband", "wife", "name", "head", "face", "hand", "life", "hour", "week", "day", "night", "month", "year", "time", "world", "sun", "animal", "tree", "water", "food", "fire", "country", "city", "street", "work", "school", "shop", "house", "room", "car", "peper", "pen", "door", "chair", "table", "money", "way", "end", "price", "question", "answer", "number", "be", "have", "do", "get", "can", "feel", "live", "love", "went", "say", "tell", "see", "hear", "to listen to", "believe", "take", "give", "go", "run", "walk", "come", "leave", "sit", "stand", "make", "know", "to understand", "remember", "think", "bring", "find", "lose", "use", "work", "study", "learn", "ask", "answer", "let", "help", "begin", "play", "write", "read", "turn", "meet", "change", "stop", "open", "close", "always", "never", "also", "just", "only", "again", "often", "still", "already", "almost", "enough", "very", "sometimes", "now", "then", "usually", "quickly", "slowly", "well", "especially", "good", "bad", "new", "young", "old", "big", "small", "long", "low", "high", "strong", "free", "open", "easy", "right", "wrong", "hot", "cold", "happy", "ready"]
    
    var arrayArmenianWords = ["կին", "տղանարդ", "աղջիկ", "տղա", "երեխա", "ընկեր", "ամուսին", "կին", "անուն", "գլուխ", "ղեկավար", "դեմք", "ձեռք", "կյանք", "ժամ", "շաբաթ", "օր", "գիշեր", "ամիս", "տարի", "ժամանակ", "աշխարհ", "արև", "կենդանի", "ծառ", "ջուր", "ուտելիք", "կրակ", "հրդեհ", "երկիր", "պետություն", "քաղաք", "փողոց", "աշխատանք", "դպրոց", "խանութ", "տուն", "սենյակ", "ավտոմեքենա", "թուղթ", "գրիչ", "դուռ", "աթոռ", "սեղան", "փող", "ճանապարհ", "միջոց", "վերջում", "գին", "հարց", "պատասխան", "պատասխանել", "թիվ", "համար", "լինել", "ունենալ", "անել", "ստանալ", "դառնալ", "պլաստիկ շիշ",  "կարողանալ", "զգալ", "ապրել", "սիրել", "ուզել", "ասել", "պատմել", "ասել", "տեսնել", "լսել", "ունկնդրել", "լսել", "հավատալ", "վերցնել", "տալ", "գնալ", "վազել", "քայլել", "զբոսնել", "գալ", "հեռանալ", "նստել", "կանգնել", "անել", "իմանալ", "հասկանալ", "հիշել", "մտածել", "կարծել", "բերել", "գտնել", "կորցնել", "պարտվել", "օգտագործել", "աշխատանք", "սովորել", "ուսումնասիրել", "սովորել", "հարցնել", "խնդրել", "պատասխան", "պատասխանել", "թույլատրել", "օգնել", "սկսել", "խաղալ", "գրել", "կարդալ", "շրջվել", "հանդիպել", "փոխել", "կանգնել", "բացել", "փակել", "միշտ", "երբեք", "նույնպես", "պարզապես", "միայն", "նորից", "կրկին", "հաճախ", "դեռ", "արդեն", "գրեթե", "համարյա", "բավական", "շատ", "երբեմն", "հիմա", "հետո", "սովորաբար", "արագ", "դանդաղ", "ջրհոր" , "լավ", "հատկապես", "լավ", "վատ", "նոր", "երիտասարդ", "հին", "ծեր", "մեծ", "փոքր", "երկար", "ցած", "բարձր", "ուժեղ", "ամուր", "ազատ", "անվճար", "բացել", "հեշտ", "ճիշտ", "աջ", "սխալ", "տաք", "շոգ", "ցուրտ", "սառը", "երջանիկ", "ուրախ", "պատրաստ", "դու", "նա", "մենք", "դուք", "նրանք", "այս", "այն", "այստեղ", "այնտեղ", "այո", "ոչ", "կամ", "շատ", "քիչ", "բոլորը", "լավ", "վատ", "մարդ", "Թվականներ", "թիվ", "զրո", "մեկ", "հազար", "միլիոն", "միլիարդ", "Լեզուներ", "լեզու", "հայերեն", "անգլերեն", "իտալերեն", "իսպաներեն", "գերմաներեն", "ֆրանսերեն", "ռուսերեն", "չինարեն", "Ամիսներ", "հունվար", "փետրվար", "մարտ", "ապրիլ", "մայիս", "հունիս", "հուլիս", "օգոստոս", "սեպտեմբեր", "հոկտեմբեր", "նոյեմբեր", "դեկտեմբեր", "Շաբաթվա օրեր", "երկուշաբթի", "երեքշաբթի", "չորեքշաբթի", "հինգշաբթի", "ուրբաթ", "շաբաթ", "կիրակի", "Ժամանակ", "վայրկյան", "րոպե", "ժամ", "օր", "ամիս", "տարի", "դար", "Չափման միավորներ", "չափառություն", "լիտր", "գրամ", "կիլոգրամ", "մետր", "կիլոմետր", "աստիճան", "Գույներ", "գույն", "սև", "սպիտակ", "կապույտ", "կարմիր",  "որդան կարմիր",  "լուրթ", "լազուր", "լաջվարդ", "խաժ", "ալ", "մանուշակագույն", "ծավի", "կանաչ", "դեղին", "վարդագույն", "զմրուխտ", "նարնջագույն", "շագանակագույն", "գորշ", "բաց", "մութ", "Սպորտ", "ֆուտբոլ", "բասկետբոլ",  "վոլեյբոլ", "կրիկետ", "բեյսբոլ", "լող", "ռեգբի", "ամերիկյան ֆուտբոլ", "թենիս", "Բայեր", "լինել", "անել", "մտնել", "գնալ", "տանել", "բերել", "գնել", "վաճառել", "զգալ", "խոսել", "զրուցել", "պատմել", "մոռանալ", "ներել", "ունենալ", "խմել", "ուտել", "քնել", "արթնանալ", "քայլել", "սպասել", "կարդալ", "գրել", "երգել", "գալ", "մոտենալ", "օգնել", "խնդրել", "ցանկանալ", "շնորհավորել", "ներել", "հիշել", "դնել", "հանել", "տեղափոխել", "հրել", "ձգտել", "ստիպել", "նստել", "կանգնել"]
    
    var russianWordsArray = ["август", "автобус", "адрес", "Азия", "алло", "американский", "английский", "апрель", "арабский", "армия", "бабушка", "бегать", "бедный", "бежать", "белый", "берег", "берёт", "бесплатно", "беспокоиться", "бить", "благодарить", "близкий", "богатый", "более", "болезнь", "болеть", "боль", "больной", "большой", "бояться", "брат", "брать", "Британия", "бросить", "будет", "будто", "будущий", "буква", "бумага", "бывать", "бывший", "быстрый", "быть", "важный", "вверх", "вдоль", "вдруг", "ведь", "везде", "великий", "верить", "вернуться", "верный", "верхний", "весёлый", "весна", "вести", "весь", "ветер", "вечер", "вещь", "взрослый", "взять", "видеть", "вижу", "висеть", "включить", "власть", "влюбляться", "вместе", "вместо", "внешний", "вниз", "внизу", "внимание", "вновь", "внутренний", "внутри", "вода", "военный", "возвращаться", "воздух", "возле", "возможный", "возраст", "возьмёт", "война", "войти", "вокруг", "вообще", "вопрос", "восемнадцать", "восемь", "восемьдесят", "воскресенье", "восток", "восьмой", "вошёл", "впервые", "вперёд", "впереди", "вполне", "впрочем", "враг", "врать", "врач", "время", "вроде", "всегда", "всем", "вскоре", "вслух", "вспомнить", "вставить", "встать", "встретить", "встреча", "всюду", "всякое", "вторник", "второй", "входить", "вчера", "выглядеть", "выехать", "выйти", "выключить", "вырезать", "высокий", "высший", "выход", "выходить", "выше", "вышел", "газета", "где-то", "Германия", "главный", "глаз", "глубокий", "глупый", "говорить", "голова", "голодный", "голос", "голубой", "голый", "гора", "гореть", "город", "горький", "горячий", "господин", "гость", "государство", "готовый", "граница", "громко", "группа", "грязный", "гулять", "давать", "давно", "даёт", "даже", "далёкий", "далеко", "даст", "дать", "двадцать", "двенадцать", "дверь", "двести", "двигаться", "движение", "двое", "девочка", "девушка", "девяносто", "девятнадцать", "девять", "девятьсот", "действие", "действовать", "декабрь", "делать", "дело", "день", "деньги", "деревня", "дерево", "держать", "держаться", "десять", "дети", "детский", "дешёвый", "длинный", "длиться", "днём", "до свидания", "добрый", "довольно", "дождь", "документ", "долгий", "долго", "должен", "доллар", "дорога", "дорогой", "достать", "дочь", "друг", "другой", "друзья", "думать", "дурак", "душа", "дядя", "Европа", "едва", "единственный", "ездить", "езжу", "если", "есть", "ехать", "жаркий", "ждать", "желание", "желать", "железный", "жёлтый", "жена", "женщина", "живой", "жизнь", "жить", "забыть", "зависеть", "завод", "завтра", "задний", "заметить", "заниматься", "запад", "запах", "запрещать", "запятая", "заработать", "заранее", "заставлять", "затем", "зато", "зачем", "звать", "звезда", "зверь", "звук", "здание", "здесь", "здоровый", "здравствуй", "зелёный", "земля", "зима", "злой", "знак", "знакомить", "знакомый", "знать", "значить", "зовёт", "золотой", "игра", "играть", "идёт", "идея", "идти", "известный", "изучать", "именно", "иметь", "иметься", "иначе", "инженер", "иногда", "иной", "иностранный", "институт", "интересный", "интернет", "информация", "искать", "испанский", "использовать", "исправить", "история", "исчезнуть", "ищет", "июль", "июнь", "каждый", "казаться", "какой", "как-то", "камень", "касаться", "качество", "квартира", "километр", "кино", "кислый", "китайский", "кладёт", "класс", "книга", "когда", "когда-то", "кого", "колесо", "количество", "команда", "командир", "комната", "компания", "компьютер", "кому", "конец", "конечно", "кончиться", "корабль", "коричневый", "короткий", "коснуться", "который", "край", "красивый", "красный", "крепкий", "крикнуть", "кричать", "кровать", "кроме", "круг", "круглый", "крупный", "крыша", "кстати", "кто-то", "куда", "купить", "кусок", "кухня", "кушать", "ладно", "левый", "лёгкий", "легко", "лежать", "лестница", "летать", "лето", "лечить", "лечь", "либо", "лицо", "личный", "лишь", "ложиться", "ломать", "лучше", "лучший", "любимый", "любить", "любовь", "любой", "люди", "магазин", "маленький", "мало", "малый", "мальчик", "мама", "март", "мать", "машина", "медленный", "между", "мелкий", "менеджер", "менее", "меня", "меняться", "мера", "мёртвый", "местный", "место", "месяц", "металл", "метр", "мешать", "миллион", "милый", "мимо", "минута", "младший", "мнение", "многие", "много", "мной", "мною", "моего", "может", "можно", "молодой", "молчать", "момент", "море", "Москва", "московский", "мочь", "мужчина", "музыка", "мысль", "мягкий", "мясо", "наверное", "наверх", "наверху", "навсегда", "надеяться", "надо", "нажать", "назад", "назвать", "называть", "называться", "наиболее", "наименее", "найти", "наконец", "налево", "написать", "направо", "например", "народ", "настоящий", "наука", "находиться", "начало", "начальник", "начать", "начаться", "начинать", "нашёл", "небо", "небольшой", "невозможно", "него", "недавно", "неделя", "неизвестный", "некий", "некоторый", "нельзя", "немецкий", "немного", "ненавидеть", "необходимый", "неожиданно", "несколько", "нести", "нечего", "нижний", "низкий", "никак", "никакой", "никогда", "никто", "ними", "ничего", "ничто", "новость", "новый", "нога", "номер", "носить", "ночной", "ночь", "ноябрь", "нравиться", "нужный", "нуль", "обещать", "область", "обмануть", "образ", "обратно", "обувь", "общество", "общий", "объяснить", "обычный", "обязательно", "огонь", "огромный", "одевать", "одежда", "одеть", "один", "одиннадцать", "одинокий", "одна", "однажды", "однако", "ожидать", "означать", "оказаться", "океан", "окно", "около", "октябрь", "опыт", "опять", "оранжевый", "оружие", "осень", "основной", "особенно", "особый", "оставаться", "оставить", "остальной", "остановиться", "остаться", "осторожно", "остров", "острый", "ответ", "ответить", "отдать", "отдыхать", "отец", "отключить", "открыть", "откуда", "относиться", "отношение", "отправить", "отсюда", "оттого", "отчего", "офис", "очень", "ошибаться", "ошибка", "падать", "память", "папа", "парень", "парк", "партия", "первый", "перевести", "перед", "передать", "перестать", "песня", "Петербург", "петь", "писать", "письмо", "пить", "пишет", "плакать", "план", "пластмасса", "платить", "плоский", "плохо", "плохой", "площадь", "плыть", "победить", "поверить", "повторить", "погибнуть", "погода", "поднять", "подняться", "подойти", "подруга", "подумать", "подходить", "поезд", "поехать", "пожалуйста", "позади", "позволить", "позвонить", "поздний", "пойти", "пока", "показать", "показаться", "поле", "полезный", "политический", "полный", "половина", "положение", "положить", "полтора", "получать", "получаться", "помнить", "помогать", "помочь", "помощь", "понедельник", "понимать", "понятно", "понять", "попасть", "попробовать", "попросить", "пора", "порядок", "поскольку", "послать", "после", "последний", "посмотреть", "поставить", "посылать", "потерять", "потом", "потому", "потратить", "похожий", "почему", "почему-то", "почти", "почувствовать", "поэтому", "появиться", "правда", "правило", "правильно", "правительство", "право", "правый", "праздник", "предлагать", "предложить", "предмет", "представить", "прежде", "прежний", "прекрасный", "прекратиться", "привет", "привыкать", "приезжать", "приехать", "прийти", "применять", "пример", "принадлежать", "принести", "принять", "природа", "приходить", "причём", "причина", "пришёл", "проблема", "пробовать", "проверить", "программа", "продать", "продолжать", "произнести", "произойти", "происходить", "пройти", "просить", "простить", "просто", "простой", "против", "проходить", "прочее", "прошлый", "прощать", "прыгать", "прямо", "прямой", "прятать", "птица", "пустой", "пусть", "путь", "пытаться", "пьёт", "пятнадцать", "пятница", "пять", "пятьдесят", "пятьсот", "работать", "рабочий", "равный", "радостный", "разве", "развитие", "разговаривать", "разговор", "раздеться", "различный", "разный", "район", "ранний", "рассказ", "рассказать", "расстояние", "расти", "расходовать", "ребёнок", "ребята", "результат", "река", "речь", "решение", "решить", "родился", "родитель", "родной", "родственники", "розовый", "роль", "российский", "Россия", "рубль", "рука", "русский", "рыба", "рыжий", "рынок", "рядом", "садиться", "сайт", "самолёт", "самый", "сверху", "свет", "светлый", "свободный", "свои", "свой", "святой", "сделать", "себе", "себя", "север", "сегодня", "седьмой", "сейчас", "секунда", "семнадцать", "семь", "семьдесят", "семьсот", "семья", "сентябрь", "сердце", "середина", "серый", "серьёзный", "сестра", "сесть", "сзади", "сидеть", "сижу", "сила", "сильный", "синий", "система", "ситуация", "сказать", "сквозь", "сколько", "скопировать", "скоро", "скорость", "скорый", "слабый", "сладкий", "слать", "слегка", "следовать", "следующий", "слишком", "словарь", "словно", "слово", "сложный", "служба", "служить", "случай", "случиться", "слушать", "слышать", "смерть", "сметь", "смех", "смеяться", "смотреть", "смочь", "смысл", "снаружи", "сначала", "снег", "снова", "снять", "собираться", "собраться", "собственный", "событие", "совершенно", "совет", "современный", "совсем", "согласиться", "создать", "солдат", "солёный", "солнце", "сообщить", "сорок", "сосед", "состояние", "сотый", "сохранить", "спасать", "спасибо", "спасти", "спать", "специальный", "спина", "спокойный", "способ", "спрашивать", "спросить", "сразу", "среди", "средний", "ставить", "становиться", "станция", "стараться", "старик", "старуха", "старший", "старый", "стать", "стекло", "стена", "стоить", "стол", "столько", "сторона", "стоять", "страна", "страница", "странный", "страх", "страшный", "стрелять", "строить", "студент", "стул", "суббота", "сутки", "сухой", "существовать", "счастливый", "счастье", "считать", "сюда", "так как", "также", "такой", "твёрдый", "твой", "творить", "тебе", "тебя", "текст", "телефон", "тело", "темнота", "тёмный", "теперь", "тёплый", "терять", "тётя", "тихий", "тихо", "тишина", "то есть", "тобой", "товарищ", "тогда", "тоже", "толкать", "толстый", "только", "тонкий", "точка", "точно", "требовать", "третий", "треть", "тридцать", "тринадцать", "триста", "труд", "трудный", "туда", "тысяча", "тяжёлый", "тянуть", "убежать", "убить", "увеличиться", "уверенный", "увидеть", "увижу", "удалить", "ударить", "удаться", "удивительный", "удивиться", "удовольствие", "уеду", "уезжать", "уехать", "узкий", "узнать", "уйти", "улица", "улыбаться", "улыбка", "уменьшиться", "умереть", "уметь", "умный", "университет", "условие", "услышать", "успеть", "усталый", "устать", "утро", "уходить", "участвовать", "учитель", "учить", "учиться", "ушёл", "файл", "фамилия", "февраль", "фильм", "фиолетовый", "фирма", "форма", "фото", "фраза", "французский", "характер", "хватать", "хлеб", "ходить", "хозяин", "холодный", "хороший", "хорошо", "хотеть", "хоть", "хотя", "Христос", "худой", "худший", "хуже", "цвет", "цветной", "целоваться", "целый", "цель", "цена", "центр", "церковь", "цифра", "часто", "частый", "часть", "чего", "чей-то", "человек", "человеческий", "чему", "через", "чёрный", "черта", "четверг", "четверо", "четвёртый", "четверть", "четыре", "четыреста", "четырнадцать", "число", "чистый", "читать", "чтоб", "чтобы", "что-то", "чувство", "чувствовать", "чужой", "чуть", "чьего", "шестнадцать", "шесть", "шестьдесят", "шестьсот", "широкий", "школа", "штука", "этаж", "этот", "южный", "юноша", "юный", "явиться", "являться", "язык", "январь", "ясно"]
    
}
