using System;
using System.IO;
using System.Linq;
using System.Diagnostics;
using System.Text.RegularExpressions;

namespace lab3
{
    class Program
    {
        private static string alpha = "AĄBCĆDEĘFGHIJKLŁMNŃOÓPQRSŚTUVWXYZŹŻ";

        static void Main(string[] args)
        {
            Stopwatch stopwatch = new Stopwatch();
            Stopwatch stopwatchMany = new Stopwatch();
            Console.WriteLine("\t\t--- Маршрутная перестановка зигзагом ---");
            string message = "";
            using (StreamReader reader = new StreamReader(@"D:\BSTU\3\3-2\ISaRIS\Labs\Lab 3\text.txt"))
            {
                message = reader.ReadToEnd().ToUpper();
                //message = Regex.Replace(message, "[^A-Za-z]", "");
            }
            Console.WriteLine(message.Length);
            int s = 39;

            stopwatch.Start();
            ZigzagRoutePermutation(message, s);
            stopwatch.Stop();

            stopwatchMany.Start();
            char[] keyword1 = "danila".ToCharArray();
            char[] keyword2 = "szkabrow".ToCharArray();
            MultiplePermutation(message.Substring(0, 99), keyword1, keyword2);
            stopwatchMany.Stop();

            float route = stopwatch.ElapsedMilliseconds;
            float many = stopwatchMany.ElapsedMilliseconds;
            Console.Write("-----------------------------------------------\n");
            Console.Write("Время Маршрутной перестановки: " + route + "\nВремя Множественной перестановки: " + many + "\n");
            Console.Write("-----------------------------------------------\n");
        }

        static void ZigzagRoutePermutation(string word, int s)
        {
            EntropyPolishAlphabet(word);
            int k = (int)Math.Floor((word.Length - 1) / (double)s) + 1;
            char[,] array = new char[s, k];

            for (int i = 0, t = 0; i < array.GetLength(0); i++)
            {
                for (int j = 0; j < array.GetLength(1); j++, t++)
                {
                    array[i, j] = word[t];
                }
            }

            for (int i = 0; i < array.GetLength(0); i++)
            {
                for (int j = 0; j < array.GetLength(1); j++)
                {
                    Console.Write(array[i, j]);
                }
                Console.WriteLine();
            }

            Console.WriteLine("\n\n------Result:\n");

            char[] cipher = new char[word.Length];

            for (int i = 0, t = 0; i < array.GetLength(1); i++)
            {
                int j;
                j = i % 2 == 0 ? array.GetLength(0) - 1 : 0;
                for (; ; t++)
                {
                    cipher[t] = array[j, i];
                    if (i % 2 == 0)
                    {
                        if (j == 0)
                        {
                            cipher[t] = array[j, i];
                            t++;
                        }
                        j--;
                        if (j < 0)
                            break;
                    }
                    else
                    {
                        if (j == array.GetLength(0) - 1)
                        {
                            cipher[t] = array[j, i];
                            t++;
                        }
                        j++;
                        if (j >= array.GetLength(0))
                            break;
                    }
                }
            }

            string result = "";
            foreach (var item in cipher)
            {
                result += item;
                Console.Write(item);
            }
            Console.WriteLine("\n");
            EntropyPolishAlphabet(result);
        }

        static void MultiplePermutation(string message, char[] keyword1, char[] keyword2)
        {
            EntropyPolishAlphabet(message);
            char[,] array = new char[keyword2.Length, keyword1.Length];
            for (int i = 0, k = 0; i < keyword2.Length; i++)
            {
                for (int j = 0; j < keyword1.Length; j++, k++)
                {
                    array[i, j] = message[k];
                }
            }

            Console.WriteLine("\t\t--- Начальная таблица множественной перестановки ---");
            Console.Write("\t");
            for (int i = 0; i < keyword1.Length; i++)
            {
                Console.Write(keyword1[i] + "\t");
            }
            Console.WriteLine();
            for (int i = 0, k = 0; i < keyword2.Length; i++)
            {
                bool ooo = true;
                for (int j = 0; j < keyword1.Length; j++, k++)
                {
                    if (ooo)
                        Console.Write(keyword2[i] + "\t");
                    Console.Write(array[i, j] + "\t");
                    ooo = false;
                }
                Console.WriteLine();
            }

            for (int y = 0; y < keyword1.Length; y++)
            {
                for (int i = 0; i < keyword2.Length - 1; i++)
                {
                    if (keyword2[i] > keyword2[i + 1])
                    {
                        char save;
                        for (int j = 0; j < keyword1.Length; j++)
                        {
                            save = array[i, j];
                            array[i, j] = array[i + 1, j];
                            array[i + 1, j] = save;
                        }
                        save = keyword2[i];
                        keyword2[i] = keyword2[i + 1];
                        keyword2[i + 1] = save;
                    }
                }
            }

            Console.WriteLine("\n");

            Console.WriteLine("\t\t--- Таблица после сортировки по строкам ---");
            Console.Write("\t");
            for (int i = 0; i < keyword1.Length; i++)
            {
                Console.Write(keyword1[i] + "\t");
            }
            Console.WriteLine();
            for (int i = 0, k = 0; i < keyword2.Length; i++)
            {
                bool ooo = true;
                for (int j = 0; j < keyword1.Length; j++, k++)
                {
                    if (ooo)
                        Console.Write(keyword2[i] + "\t");
                    Console.Write(array[i, j] + "\t");
                    ooo = false;
                }
                Console.WriteLine();
            }


            for (int y = 0; y < keyword2.Length; y++)
            {
                for (int i = 0; i < keyword1.Length - 1; i++)
                {
                    if (keyword1[i] > keyword1[i + 1])
                    {
                        char save;
                        for (int j = 0; j < keyword2.Length; j++)
                        {
                            save = array[j, i];
                            array[j, i] = array[j, i + 1];
                            array[j, i + 1] = save;
                        }
                        save = keyword1[i];
                        keyword1[i] = keyword1[i + 1];
                        keyword1[i + 1] = save;
                    }
                }
            }
            Console.WriteLine("\n");
            Console.WriteLine("\t\t--- Итоговая отсортированная таблица ---");
            Console.Write("\t");
            for (int i = 0; i < keyword1.Length; i++)
            {
                Console.Write(keyword1[i] + "\t");
            }
            Console.WriteLine();
            for (int i = 0, k = 0; i < keyword2.Length; i++)
            {
                bool ooo = true;
                for (int j = 0; j < keyword1.Length; j++, k++)
                {
                    if (ooo)
                        Console.Write(keyword2[i] + "\t");
                    Console.Write(array[i, j] + "\t");
                    ooo = false;
                }
                Console.WriteLine();
            }

            string result = "";
            for (int i = 0; i < keyword2.Length; i++)
            {
                for (int j = 0; j < keyword1.Length; j++)
                {
                    result += array[i, j];
                }
            }
            Console.WriteLine("\n\n ---Result:\n" + result);
            EntropyPolishAlphabet(result);
        }

        public static void EntropyPolishAlphabet(string text)
        {
            int[] countLetter = new int[35];
            int countLettersInFile = 0;
            double[] probabilityLetters = new double[35];
            text = text.ToUpper();
            countLettersInFile = text.Count();

            Console.WriteLine();
            Console.WriteLine($"Количество символов в файле: {countLettersInFile}");
            Console.WriteLine();
            Console.WriteLine("Количество вхождений каждой буквы:");

            for (int j = 0; j < 35; j++)
            {
                countLetter[j] = text.Count(x => x == alpha[j]);
                Console.WriteLine($"{ alpha[j]}: { countLetter[j]}");

                probabilityLetters[j] = (double)countLetter[j] / countLettersInFile;
                Console.WriteLine($"P({alpha[j]}): {Math.Round(probabilityLetters[j], 5)}");
                Console.WriteLine();
            }
        }
    }
}
