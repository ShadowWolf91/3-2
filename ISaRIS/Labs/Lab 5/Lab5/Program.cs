using System;
using System.Diagnostics;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace L5
{
    internal class Program
    {
        private const string Key = "asdasddf";
        private const string FileNameSource = "SourceText.txt";
        private const string FileNameCipher = "CipherText.txt";

        private static void Main()
        {
            try
            {
                var des = DES.Create();
                var watch = new Stopwatch();

                using (var inputFileStream = File.OpenRead(FileNameSource))
                {
                    var streamReader = new StreamReader(inputFileStream);
                    var data = streamReader.ReadLine();
                    Console.WriteLine($"Input string: {data}");

                    using var memoryStream = new MemoryStream();
                    watch.Start();
                    using var cryptoStream = new CryptoStream(memoryStream,
                        des.CreateEncryptor(Encoding.ASCII.GetBytes(Key), des.IV),
                        CryptoStreamMode.Write);
                    cryptoStream.Write(Encoding.ASCII.GetBytes(data ?? string.Empty));
                    cryptoStream.FlushFinalBlock();
                    watch.Stop();
                    Console.WriteLine($"Encoded string: {Encoding.ASCII.GetString(memoryStream.ToArray())}\n" +
                                      $"\tElapsed time: {watch.ElapsedMilliseconds}ms");
                    using var outputFileStream = File.Open(FileNameCipher, FileMode.OpenOrCreate);
                    outputFileStream.Write(memoryStream.ToArray());
                }

                using (var inputFileStream = File.Open(FileNameCipher, FileMode.OpenOrCreate))
                {
                    watch.Restart();
                    using var cryptoStream = new CryptoStream(inputFileStream,
                        des.CreateDecryptor(Encoding.ASCII.GetBytes(Key), des.IV),
                        CryptoStreamMode.Read);
                    using var sReader = new StreamReader(cryptoStream);
                    var data = sReader.ReadLine();
                    watch.Stop();
                    Console.WriteLine($"Decoded string: {data}\n" +
                                      $"\tElapsed time: {watch.ElapsedMilliseconds}ms");
                }
            }
            catch (CryptographicException e)
            {
                Console.WriteLine("A Cryptographic error occurred: {0}", e.Message);
            }
            catch (UnauthorizedAccessException e)
            {
                Console.WriteLine("A file error occurred: {0}", e.Message);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
}