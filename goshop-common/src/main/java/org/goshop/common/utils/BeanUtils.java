package org.goshop.common.utils;


import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.Field;
import java.util.Iterator;
import java.util.Map;

/**
 * 创 建 人：Wesley
 * 创建日期：2015-05-25
 * 修 改 人：
 * 修改日 期：
 * 描   述：扩展org.apache.commons.beanutils.BeanUtils。  
 */
public class BeanUtils {
    /** 
     * 将源对象中的值覆盖到目标对象中，仅覆盖源对象中不为NULL值的属性 
     *  
     * @param dest 
     *            目标对象，标准的JavaBean 
     * @param orig 
     *            源对象，可为Map、标准的JavaBean
     */  
    @SuppressWarnings("rawtypes")  
    public static void applyIf(Object dest, Object orig) throws Exception {  
        try {  
            if (orig instanceof Map) {  
                Iterator names = ((Map) orig).keySet().iterator();  
                while (names.hasNext()) {  
                    String name = (String) names.next();  
                    if (PropertyUtils.isWriteable(dest, name)) {
                        Object value = ((Map) orig).get(name);  
                        if (value != null) {  
                            PropertyUtils.setSimpleProperty(dest, name, value);  
                        }  
                    }  
                }  
            } else {  
                Field[] fields = orig.getClass().getDeclaredFields();
                for (int i = 0; i < fields.length; i++) {  
                    String name = fields[i].getName();
                    Field destField= ReflectionUtils.findField(dest.getClass(), name);
                    if(destField==null){
                        continue;
                    }
                    if (PropertyUtils.isReadable(orig, name) && PropertyUtils.isWriteable(dest, name)) {  
                        Object value = PropertyUtils.getSimpleProperty(orig, name);  
                        if (value != null) {  
                            PropertyUtils.setSimpleProperty(dest, name, value);  
                        }  
                    }  
                }  
            }  
        } catch (Exception e) {  
            throw new Exception("将源对象中的值覆盖到目标对象中，仅覆盖源对象中不为NULL值的属性", e);  
        }  
    }  
  

    public static boolean checkObjProperty(Object orig, Map dest) throws Exception {  
        try {  
            Field[] fields = orig.getClass().getDeclaredFields();
            for (int i = 0; i < fields.length; i++) {  
                String name = fields[i].getName();  
                if (!dest.containsKey(name)) {  
                    if (PropertyUtils.isReadable(orig, name)) {  
                        Object value = PropertyUtils.getSimpleProperty(orig, name);  
                        if (value == null) {  
                            return true;  
                        }  
                    }  
                }  
            }  
            return false;  
        } catch (Exception e) {  
            throw new Exception("将源对象中的值覆盖到目标对象中，仅覆盖源对象中不为NULL值的属性", e);  
        }  
    }  
}  