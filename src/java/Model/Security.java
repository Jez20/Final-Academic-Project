/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.*;

/**
 *
 * @author FV
 */
public class Security {

//Default Key if not is given
    private static byte[] key = {'a', '1', '3', '^', 'e', 'R', 'z', 'x', '/', '*', '+', ']', '>', '#', 'L', 'l'};
    public Security() {
    }

    public Security(String key) {
        this.key = key.trim().getBytes();
    }

    public String encrypt(String strToEncrypt) {
        String encryptedString = null;
        try {
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            final SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            encryptedString = Base64.encodeBase64String(cipher.doFinal(strToEncrypt.getBytes()));
        }
        catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return encryptedString;
    }

    public String decrypt(String codeDecrypt) {
        String decryptedString = null;
        try {
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
            final SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            decryptedString = new String(cipher.doFinal(Base64.decodeBase64(codeDecrypt)));
        }
        catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return decryptedString;
    }

}
