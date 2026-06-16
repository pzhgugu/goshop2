package org.goshop.common.utils;

/**
 * 它的作用就是把对象转化为byte数组，或把byte数组转化为对象。
 */

import java.io.*;

public class SerializeUtils {

    public static byte[] serialize(Object o) {
        if(o==null){
            return null;
        }
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        ObjectOutputStream outo = null;
        try {
            outo = new ObjectOutputStream(out);
            outo.writeObject(o);
            outo.flush();
            return out.toByteArray();
        } catch (IOException e) {
            return null;
        } finally {
            closeQuietly(outo);
            closeQuietly(out);
        }
    }

    public static Object deserialize(byte[] b) {
        if(b==null){
            return null;
        }
        ObjectInputStream oin = null;
        try {
            oin = new ObjectInputStream(new ByteArrayInputStream(b));
            return oin.readObject();
        } catch (IOException e) {
            return null;
        } catch (ClassNotFoundException e) {
            return null;
        } finally {
            closeQuietly(oin);
        }
    }

    private static void closeQuietly(Closeable closeable) {
        if (closeable == null) {
            return;
        }
        try {
            closeable.close();
        } catch (IOException ignored) {
        }
    }
}
