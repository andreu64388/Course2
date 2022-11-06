﻿using System.Text.Json.Serialization;
using System.Xml.Serialization;


namespace laba_13;

[Serializable]
public abstract class Testing 
{
    
    #region Fields
    protected  string _name;
    protected int _time;

    
    
    #endregion

    #region Properties
    public virtual string Name
    {
        get=>_name;
        set => _name = value;
    }

    public virtual int Time
    {
        get => _time;
        set => _time = value;
    }

    
    #endregion

    #region Constructors
    public  Testing()
    {
        Name = "Default";
        Time = 0;
        
    }

    public Testing(string name, int time)
    {
        Name = name;
        Time = time;
       
    }
    #endregion

    #region Methods
    
    public override string ToString()
    {
        return $"Name: {Name}, Time: {Time}";
    }

    public virtual void Successfully() => Console.WriteLine("Успешно испытание");

    public abstract void Failed();
    
    #endregion





}





enum Week
{
    
    Monday,
    Tuesday,
    Wendesday,
    Thursday,
    Friday,
    Saturday,
    Sunday



}

// абстрактный класс - это класс, который не может быть создан, но может быть наследован
// абстрактный метод - это метод, который не имеет реализации, но обязан быть переопределен в наследнике
// 

// наследование - это  способность класса наследовать свойства и методы другого класса
// полиморфизм - это способность метода вести себя по-разному в зависимости от контекста
// пример полиморфизма - переопределение метода ToString()
//интерфейсы - это способность класса реализовывать методы, которые не имеют реализации
// операторы is или as. Они позволяют проверить, является ли объект экземпляром определенного класса или интерфейса

//is - возвращает true, если объект является экземпляром указанного типа
//as - возвращает объект указанного типа, если объект является экземпляром указанного типа, иначе возвращает null


//. Для чего используют статические классы?
// статическ  ие классы используются для хранения методов, которые не требуют создания экземпляра класса
//. Что может содержать статический класс?
// статический класс может содержать статические методы, статические свойства, статические поля, статические конструкторы, статические события
// Что такое производный и базовый классы?
// производный класс - это класс, который наследует свойства и методы другого класса
// базовый класс - это класс, который наследует свойства и методы другого класса
//4. Как используют ключевое слово base?
// ключевое слово base используется для вызова конструктора базового класса
// также ключевое слово base используется для вызова метода базового класса
//5. В чем заключена основная задача наследования?
// основная задача наследования - это повторное использование кода
//6. Пусть базовый класс содержит метод basefunc(), а производный класс не имеет
//метода с таким именем.Может ли объект производного класса иметь
//доступ к методу basefunc()? Если да, то при каких условиях?
// да, при условии, что в производном классе не будет определен метод с таким же именем
//Что такое полиморфизм? Приведите пример.
// полиморфизм - это способность метода вести себя по-разному в зависимости от контекста
// пример - перегрузка методов
//Определите назначение виртуальных функций.
// виртуальные функции используются для переопределения методов в производных классах
//10. Кому доступны переменные с модификатором protected?
// переменные с модификатором protected доступны только производным классам
//13. Поддерживает ли C# множественное наследование?
// нет, C# не поддерживает множественное наследование
//. Можно ли запретить наследование от класса?
// можно запретить наследование от класса, если пометить класс как sealed
//Можно ли разрешить наследование класса, но запретить перекрытие метода?
// можно запретить перекрытие метода, если пометить метод как sealed
//. Что может содержать интерфейс?
// интерфейс может содержать только объявления методов и свойств
//Как работать с объектом через унаследованный интерфейс?
// через унаследованный интерфейс можно работать с объектом, если объект реализует этот интерфейс
//Приведите пример явной реализации интерфейса.

// пример явной реализации интерфейса
//public interface IMyInterface
//{
//    void MyMethod();
//}

//Почему нельзя указать модификатор видимости для методов интерфейса?
// нельзя указать модификатор видимости для методов интерфейса, потому что методы интерфейса всегда являются public
//Можно ли наследовать от нескольких интерфейсов?

// можно наследовать от нескольких интерфейсов
//. Назовите отличия между интерфейсом и абстрактным классом
// абстрактный класс может содержать поля и методы, а интерфейс только методы









// что такое virtual 
// это ключевое слово, которое позволяет переопределять методы в производных классах
//Можно ли разрешить наследование класса, но запретить перекрытие метода?
// можно запретить перекрытие метода, если пометить метод как sealed
// enum - это перечисление тип данных ,которое позволяет определить набор именованных констант