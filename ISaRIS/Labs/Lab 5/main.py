import pyDes
import secrets
import time

if __name__ == '__main__':
    start1 = time.time()
    #key_16 = secrets.token_bytes(16)
    des_EDE2 = pyDes.triple_des(b"01FE01FE01FE01FE", pyDes.CBC, b"\0\0\0\0\0\0\0\0", pad=None, padmode=pyDes.PAD_PKCS5)
    file = open("input.txt", "r")
    input = file.read()
    encripted = des_EDE2.encrypt(str.encode(input))
    file1 = open("output.txt", "w", encoding='UTF-16')
    file1.write(encripted.decode('UTF-16'))
    file1.close()
    end1 = time.time() - start1
    start2 = time.time()
    decripted = des_EDE2.decrypt(encripted)
    file2 = open("output2.txt", "w")
    file2.write(decripted.decode('UTF-8'))
    file2.close()
    end2 = time.time() - start2
    print("Время шифрования: ")
    print(end1)
    print("-------------------------")
    print("Время расшифровки:")
    print(end2)