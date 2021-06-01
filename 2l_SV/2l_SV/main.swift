// Homework 2
print("Домашнее задание 1")
print("Написать функцию, которая определяет, четное число или нет.")
    //Исходные данные
let number: Int = 12
//Функция определения четности числа
func evenNumber(num: Int) -> Bool {
    if (num % 2 == 0) {
        return true
    } else {
        return false
    }
}
let answer: String = evenNumber(num: number) ? "четное" : "нечетное"
print("Ответ:")
print("Число \(number) является \(answer)")

print("\nДомашнее задание 2")
print("Написать функцию, которая определяет, делится ли число без остатка на 3.")
func divisionWithoutRemainder(num: Int) -> Bool {
    if (num % 3 == 0) {
        return true
    } else {
        return false
    }
}
print("Ответ:")
print("Число \(number) делится на 3 \(divisionWithoutRemainder(num: number) ? "без остатка" : "с остатком")")

print("\nДомашнее задание 3")
print("Создать возрастающий массив из 100 чисел.")
var arr = [Int]()
for i in 1 ... 100 {
    arr.append(i)
}
print("Ответ:")
print(arr)

print("\nДомашнее задание 4")
print("Удалить из этого массива все четные числа и все числа, которые не делятся на 3.")
for value in arr {
    if (evenNumber(num: value)) || (!divisionWithoutRemainder(num: value)) {
        arr.remove(at: arr.firstIndex(of: value)!)
    }
}
print("Ответ:")
print(arr)

print("\nДомашнее задание 5")
print("Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.")
var array = [Int]()
func fibo(_ array: inout [Int]) {
    let fn: Int
    let count = array.count
    if (count == 1) {
        fn = 1
    } else if (count < 1) {
        fn = 0
    } else {
        fn = array[count-1] + array[count-2]
    }
    array.append(fn)
}
for _ in array.count+1...50 {
    fibo(&array)
}
print("Ответ:")
print(array)

print("\nДомашнее задание 6")
print("Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.")
let final: Int = 1000
var arr2 = [Int]()
var arr3 = [Int]()
var p: Int = 2
for i in p...final {
    arr2.append(i)
}
for i in 1...100 {
    for i in stride(from: p+p, to: final, by: p) {
        if let index = arr2.firstIndex(of: i) {
            arr2.remove(at: index)
        }
    }
    p = arr2[i]
    arr3.append(arr2[i])
}
print("Ответ:")
print(arr3)
