using System.Diagnostics;

public class Programm
{
    public class VigenereCipher
    {
        const string defaultAlphabet = "AĄBCĆDEĘFGHIJKLŁMNŃOÓPQRSŚTUVWXYZŹŻ";
        readonly string letters;

        public VigenereCipher(string alphabet = null)
        {
            letters = string.IsNullOrEmpty(alphabet) ? defaultAlphabet : alphabet;
        }

        //генерация повторяющегося пароля
        private string GetRepeatKey(string s, int n)
        {
            var p = s;
            while (p.Length < n)
            {
                p += p;
            }

            return p.Substring(0, n);
        }

        private string Vigenere(string text, string password, bool encrypting = true)
        {

            var gamma = GetRepeatKey(password, text.Length);
            var retValue = "";
            var q = letters.Length;

            for (int i = 0; i < text.Length; i++)
            {
                var letterIndex = letters.IndexOf(text[i]);
                var codeIndex = letters.IndexOf(gamma[i]);
                if (letterIndex < 0)
                {
                    //если буква не найдена, добавляем её в исходном виде
                    retValue += text[i].ToString();
                }
                else
                {
                    retValue += letters[(q + letterIndex + ((encrypting ? 1 : -1) * codeIndex)) % q].ToString();
                }
            }

            return retValue;
        }

        //шифрование текста
        public string Encrypt(string plainMessage, string password)
            => Vigenere(plainMessage, password);

        //дешифрование текста
        public string Decrypt(string encryptedMessage, string password)
            => Vigenere(encryptedMessage, password, false);
    }
    public class CaesarCipher
    {
        const string defaultAlphabet = "AĄBCĆDEĘFGHIJKLŁMNŃOÓPQRSŚTUVWXYZŹŻ";
        private string CodeEncode(string text, int k)
        {
            //добавляем в алфавит маленькие буквы
            var fullAlfabet = defaultAlphabet;
            var letterQty = fullAlfabet.Length;
            var retVal = "";
            for (int i = 0; i < text.Length; i++)
            {
                var c = text[i];
                var index = fullAlfabet.IndexOf(c);
                if (index < 0)
                {
                    //если символ не найден, то добавляем его в неизменном виде
                    retVal += c.ToString();
                }
                else
                {
                    var codeIndex = (letterQty + index + k) % letterQty;
                    retVal += fullAlfabet[codeIndex];
                }
            }

            return retVal;
        }

        //шифрование текста
        public string Encrypt(string plainMessage, int key) => CodeEncode(plainMessage, key);

        //дешифрование текста
        public string Decrypt(string encryptedMessage, int key) => CodeEncode(encryptedMessage, -key);
    }


    class Program
    {
        static void Main(string[] args)
        {
            Stopwatch stopwatch = new Stopwatch();
            Stopwatch stopwatchCes = new Stopwatch();
            var cipher = new Programm.VigenereCipher("AĄBCĆDEĘFGHIJKLŁMNŃOÓPQRSŚTUVWXYZŹŻ");
            var cipherCes = new Programm.CaesarCipher();
            var password = "BEZPIECZEŃSTWO";
            Console.Write("Шифр Виженера\n\n");
            Console.Write("Ключ: " + password + "\n");
            Console.Write("Введите текст: ");
            var inputText = Console.ReadLine().ToUpper();
            stopwatch.Start();
            var encryptedText = cipher.Encrypt(inputText, password);
            Console.WriteLine("Зашифрованное сообщение: {0}", encryptedText);
            Console.WriteLine("Расшифрованное сообщение: {0}", cipher.Decrypt(encryptedText, password), "\n");
            stopwatch.Stop();
            float vij = stopwatch.ElapsedMilliseconds;
            Console.Write("-----------------------------------------------\n");
            Console.Write("Шифр на основе соотношений (Цезаря, k = 20)\n\n");
            Console.Write("Введите текст: ");
            var message = Console.ReadLine().ToUpper();
            int secretKey = 20;
            stopwatchCes.Start();
            var encryptedText2 = cipherCes.Encrypt(message, secretKey);
            Console.WriteLine("Зашифрованное сообщение: {0}", encryptedText2);
            Console.WriteLine("Расшифрованное сообщение: {0}", cipherCes.Decrypt(encryptedText2, secretKey), "\n");
            stopwatchCes.Stop();
            float ces = stopwatchCes.ElapsedMilliseconds;
            Console.Write("-----------------------------------------------\n");
            Console.Write("Время Виженера: " + vij + "\nВремя Цезаря: " + ces + "\n");
            Console.Write("-----------------------------------------------\n");
        }
    }
}