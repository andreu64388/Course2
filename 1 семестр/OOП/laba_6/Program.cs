﻿
namespace laba_6;
/*1) Создайте иерархию классов исключений (собственных) – 3 типа и более.
Сделайте наследование пользовательских типов исключений от
стандартных классов .Net (например, Exception, IndexOutofRange).
*/
/*2) Смоделируйте и обработайте как минимум пять различных
исключительных ситуаций на основе своих и стандартных исключений.
Например, не позволять при инициализации объектов передавать
неверные данные, обрабатывать ошибки при работе с памятью и ошибки
работы с файлами, деление на ноль, неверный индекс, нулевой указатель
и т. д*/

public class Program
{
    public static void Main(string[] args)
    {
        Logger log = new Logger();


        try
        {
           
            User user = new();
            user.CreateUser();
           user.AssertTest();
            log.LogWrite("Test");

        }
        catch (Exceptions ex)
        {

            log.WriteError(ex.Message);
            Console.WriteLine(ex.Message);
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        finally
        {
            Console.WriteLine("Finally");
        }

        // деление на 0 
        try
        {
            int a = 5;
            int b = 0;
            int c = a / b;
        }
        catch (DivideByZeroException ex)
        {
            Console.WriteLine(ex.Message);
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        finally
        {
            Console.WriteLine("Finally");

        }
    }
}




/*
 Добавьте код в одной из функций макрос Assert. Объясните что он
проверяет, как будет выполняться программа в случае не выполнения
условия. Объясните назначение Assert*/

//Assert проверяет условие, если оно не выполняется, то программа завершается с ошибкой
// все про исключение в этом блоке не будет выполняться



//1. Расскажите как генерируется исключение.
// Исключение генерируется при помощи оператора throw и объекта исключения. 
//2. Расскажите методику обработки исключений.
// Обработка исключений происходит при помощи блоков try, catch, finally.
//3. Какое ключевое слово служит для обозначения блока кода, в котором можно генерировать исключение
// throw
//. Какие ключевые слова используются для обработки и генерации исключений? Расскажите об механизме обработке исключения?
// try, catch, finally, throw
//5. Что будет, если в программе нет предложения catch, способного обработать исключение?
// Программа завершится с ошибкой
//6. Что такое фильтры исключения? Приведите пример
// Фильтры исключения позволяют обрабатывать исключения по определенным условиям.
//. Могут ли исключения быть вложенными?
// Да, исключения могут быть вложенными.
//. Какой синтаксис нужно использовать в C# для отлова любого возможного исключения?
// catch (Exception ex)
//9. Чем следует руководствоваться при размещении обработчиков исключения?
// Руководствоваться следует порядком от наиболее специфичных исключений к наименее специфичным.
//1.Как повторно сгенерировать то же самое исключение в блоке обработчике catch
// throw
//.Какие методы содержаться в классе Exception? Где и как их можно использовать?
// Message, Source, StackTrace, HelpLink, TargetSite, Data, InnerException, GetObjectData, ToString, GetType, Equals, GetHashCode, Finalize, MemberwiseClone
//исключение это объект, поэтому можно использовать все методы объекта и класса Exception


