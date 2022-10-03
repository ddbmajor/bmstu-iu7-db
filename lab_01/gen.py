from datetime import date, datetime
from multiprocessing.dummy import Array
from faker import Faker
import random
import csv
from wonderwords import RandomWord

CARD_COUNT = 1000
READER_COUNT = CARD_COUNT
AUTHOR_COUNT = 1000
PUBLISHER_COUNT = 50
BOOK_COUNT = 1200

# fake = Faker('ru_RU')
# print(fake.first_name())
# print(fake.middle_name())
# print(fake.last_name())
# print(fake.past_date())


def fillTable(columnNames: list, tableEntities: list, csvFileName: str):
    outputCsv = open(csvFileName, "w", newline='')
    csvWriter = csv.writer(outputCsv)
    csvWriter.writerow(columnNames)
    csvWriter.writerows(tableEntities)


def generateReader(faker: Faker, currentId: int):
    userSample = []
    userSample.append(currentId)
    userSample.append(faker.last_name())
    userSample.append(faker.first_name())
    userSample.append(faker.middle_name())
    userSample.append(faker.unique.date_of_birth())
    userSample.append(currentId)
    return userSample


def generateCard(faker: Faker, currentId: int):
    cardSample = []
    cardSample.append(currentId)
    cardSample.append(faker.past_date())
    cardSample.append(faker.future_date())
    return cardSample


def generateWriter(faker: Faker, currentId: int):
    writerSample = []
    writerSample.append(currentId)
    writerSample.append(faker.last_name())
    writerSample.append(faker.first_name())
    writerSample.append(faker.middle_name())
    writerSample.append(faker.date_of_birth())
    writerSample.append(faker.country())
    return writerSample


def generatePublisher(faker: Faker, currentId: int):
    publisherSample = []

    publisherSample.append(currentId)
    publisherSample.append(faker.unique.word())
    publisherSample.append(faker.country())
    publisherSample.append(faker.city())

    return publisherSample


def generateCsvWithReaders(count: int):
    columnNames = ['id', 'lastname', 'firstname',
                   'middlename', 'birthday', 'country']
    allReaders = []
    faker = Faker('ru_RU')
    for i in range(1, count + 1):
        allReaders.append(generateReader(faker, i))

    fillTable(columnNames, allReaders, "csv/readers.csv")


def generateCsvWithCards(count: int):
    columnNames = ['id', 'reg_date', 'expire_date']
    allCards = []
    faker = Faker()
    for i in range(1, count + 1):
        allCards.append(generateCard(faker, i))

    fillTable(columnNames, allCards, "csv/cards.csv")


def generateCsvWithWriters(count: int):
    columnNames = ['id', 'lastname', 'firstname',
                   'middlename', 'birthday', 'card_id']
    allWriters = []
    faker = Faker('ru_RU')
    for i in range(1, count + 1):
        allWriters.append(generateWriter(faker, i))

    fillTable(columnNames, allWriters, "csv/writers.csv")


def generateCsvWithPublishers(count: int):
    columnNames = ['id', 'name', 'country', 'city']
    allPublishers = []
    faker = Faker('ru_RU')
    for i in range(1, count + 1):
        allPublishers.append(generatePublisher(faker, i))

    fillTable(columnNames, allPublishers, "csv/publishers.csv")


def generateCsvWithTypes():
    columnNames = ['name']
    allTypes = []
    allTypes.append(['Техническая'])
    allTypes.append(['Художественная'])
    allTypes.append(['Научная'])
    allTypes.append(['Учебная'])
    fillTable(columnNames, allTypes, "csv/types.csv")


def generateCsvWithGenres():
    columnNames = ['type', 'name', 'description']
    allGenres = []
    allGenres.append(['Техническая', 'Математическая',
                     'О математике приментиельно'])
    allGenres.append(['Техническая', 'Физическая', 'О физике применительно'])
    allGenres.append(['Техническая', 'Компьютерная',
                     'О програмировании, раюоту с компьютером и прочем'])

    allGenres.append(['Художественная', 'Детективы', 'Это вымышленные истории, в которых, непременно, действующими лицами являются следователь, расследующий сложное запутанное дело, и подозреваемый. В сюжете обязательно присутствует интрига, и развязка запутанной истории становится ясной лишь в самом её конце.'])
    allGenres.append(['Художественная', 'Фантастика', 'Особый вид художественной литературы. Автор, как бы заглядывает в будущее и предвосхищает некоторые земные события в своем воображении. Часто фантастика, так и остается фантастикой, но иногда автор очень точно угадывает ход истории или технического прогресса. Книги Жюль Верна — хороший тому пример.'])
    allGenres.append(['Художественная', 'Детская',
                     'Книги для детей. Сюда относятся сказки, притчи, поучительные истории, комиксы и раскраски и т.д.'])
    allGenres.append(['Художественная', 'Классика', 'Книги авторов, стиль письма которых, признан образцом для подражания. Среди русских авторов — это Достоевский, Пушкин, Бунин, Гоголь и другие. Среди зарубежных: Шекспир, Оскар Уайльд, Ирвинг Шоу, Стендаль...'])
    allGenres.append(['Художественная', 'Поэзия',
                     'Особый вид литературы, когда с помощью ассоциативных образов автор, говорит о глубокий своих переживаниях и чувствах.'])
    allGenres.append(['Художественная', 'Фэнтези', 'Произведения жанра фэнтези основываются на мифологических и сказочных мотивах, переосмысленных или переработанных авторами. Жанр сформировался примерно в начале XV века. В середине XX века наиболее значительное влияние на формирование современного облика классического фэнтези оказали английские писатели Джон Рональд Руэл Толкин, автор романа «Властелин колец», и Клайв Стейплз Льюис, автор «Хроник Нарнии».'])

    allGenres.append(
        ['Научная', 'Математика', 'Фундаментальные знания о математике'])
    allGenres.append(['Научная', 'Философия', 'Особая форма познания и система знаний об общих характеристиках, понятиях и принципах реальности (бытия), а также бытия человека, об отношении человека и окружающего его мира'])

    allGenres.append(['Учебная', 'Школьная', 'Для школьников'])
    allGenres.append(['Учебная', 'Вузовская', 'Для студентов'])

    fillTable(columnNames, allGenres, "csv/genres.csv")


def generateCsvWithBooks(faker: Faker, count: int):
    columnNames = ['id', 'name', 'author', 'year', 'genre', 'publisher', 'reader']
    allBooks = []
    for i in range(1, count + 1):
        allBooks.append([i, faker.word(), random.randint(1, AUTHOR_COUNT), faker.year(), random.randint(1, 13), random.randint(1, PUBLISHER_COUNT), random.randint(1, READER_COUNT)])

    fillTable(columnNames, allBooks, "csv/books.csv")


ruFake = Faker('ru_RU')
fake = Faker()
generateCsvWithBooks(ruFake, BOOK_COUNT)
generateCsvWithCards(CARD_COUNT)
generateCsvWithGenres()
generateCsvWithPublishers(PUBLISHER_COUNT)
generateCsvWithReaders(READER_COUNT)
generateCsvWithTypes()
generateCsvWithWriters(AUTHOR_COUNT)
