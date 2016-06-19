package org.goshop.common.utils;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;

import java.security.InvalidParameterException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 创 建 人：gugu
 * 创建日期：2015-05-25
 * 修 改 人：
 * 修改日 期：
 * 描   述：时间日期工具类。  
 */
public class DateTimeUtils
{
  public static final int YEAR = 1;
  public static final int MONTH = 2;
  public static final int DAY = 5;
  public static final int HOUR = 10;
  public static final int HOUR_OF_DAY = 11;
  public static final int MINUTE = 12;
  public static final int SECOND = 13;
  public static final String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
  public static final String DATE_TIMESTAMP_FORMAT = "yyyy-MM-dd HH:mm:ss.SSS";
  public static final String DATE_FORMAT = "yyyy-MM-dd";
  public static final String TIME_FORMAT = "HH:mm:ss";

  public static Date addYears(Date date, int amount)
  {
    return DateUtils.addYears(date, amount);
  }

  public static Date addMonths(Date date, int amount)
  {
    return DateUtils.addMonths(date, amount);
  }

  public static Date addWeeks(Date date, int amount)
  {
    return DateUtils.addWeeks(date, amount);
  }

  public static Date addDays(Date date, int amount)
  {
    return DateUtils.addDays(date, amount);
  }

  public static Date addHours(Date date, int amount)
  {
    return DateUtils.addHours(date, amount);
  }

  public static Date addMinutes(Date date, int amount)
  {
    return DateUtils.addMinutes(date, amount);
  }

  public static Date addSeconds(Date date, int amount)
  {
    return DateUtils.addSeconds(date, amount);
  }

  public static Date addMilliseconds(Date date, int amount)
  {
    return DateUtils.addMilliseconds(date, amount);
  }

  public static Date truncate(Date date, int field)
  {
    return DateUtils.truncate(date, field);
  }

  public static int intervalYears(Date beginDate, Date endDate)
  {
    if (beginDate.after(endDate)) {
      Date tmp = endDate;
      endDate = beginDate;
      beginDate = tmp;
    }

    int endDateYear = getYear(endDate);
    int beginDateYear = getYear(beginDate);

    int interval = endDateYear - beginDateYear;

    return interval;
  }

  public static int intervalMonths(Date beginDate, Date endDate)
  {
    if (beginDate.after(endDate)) {
      Date tmp = endDate;
      endDate = beginDate;
      beginDate = tmp;
    }

    int endDateYear = getYear(endDate);
    int beginDateYear = getYear(beginDate);

    int intervalYear = endDateYear - beginDateYear;

    int endDateMonth = getMonth(endDate);
    int beginDateMonth = getMonth(beginDate);

    int intervalMonth = 0;
    if (endDateMonth < beginDateMonth) {
      --intervalYear;
      intervalMonth = endDateMonth + 12 - beginDateMonth;
    } else {
      intervalMonth = endDateMonth - beginDateMonth;
    }

    return (intervalYear * 12 + intervalMonth);
  }

  public static int intervalDays(Date beginDate, Date endDate)
  {
    if (beginDate.after(endDate)) {
      Date tmp = endDate;
      endDate = beginDate;
      beginDate = tmp;
    }

    beginDate = truncate(beginDate, 5);
    endDate = truncate(endDate, 5);

    long interval = endDate.getTime() - beginDate.getTime();

    return (int)(interval / 86400000L);
  }

  public static int intervalHours(Date beginDate, Date endDate)
  {
    if (beginDate.after(endDate)) {
      Date tmp = endDate;
      endDate = beginDate;
      beginDate = tmp;
    }

    beginDate = truncate(beginDate, 10);
    endDate = truncate(endDate, 10);

    long interval = endDate.getTime() - beginDate.getTime();

    return (int)(interval / 3600000L);
  }

  public static int intervalMinutes(Date beginDate, Date endDate)
  {
    if (beginDate.after(endDate)) {
      Date tmp = endDate;
      endDate = beginDate;
      beginDate = tmp;
    }
    return getIntervalMinutes(beginDate, endDate);
  }

  public static int getIntervalMinutes(Date beginDate, Date endDate)
  {
    beginDate = truncate(beginDate, 12);
    endDate = truncate(endDate, 12);

    long interval = endDate.getTime() - beginDate.getTime();

    return (int)(interval / 60000L);
  }

  public static long intervalSeconds(Date beginDate, Date endDate)
  {
    if (beginDate.after(endDate)) {
      Date tmp = endDate;
      endDate = beginDate;
      beginDate = tmp;
    }

    long interval = endDate.getTime() - beginDate.getTime();

    return (int)(interval / 1000L);
  }

  public static int getYear(Date date)
  {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(date);

    return calendar.get(1);
  }

  public static int getMonth(Date date)
  {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(date);

    return (calendar.get(2) + 1);
  }

  public static int getDay(Date date)
  {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(date);

    return calendar.get(5);
  }

  public static int getHour(Date date)
  {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(date);

    return calendar.get(10);
  }

  public static int getHourOfDay(Date date)
  {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(date);
    int day = calendar.get(11);
    return day;
  }

  public static Date setHourOfDay(Date date, int amount)
  {
    return DateUtils.setHours(date, amount);
  }

  public static int getMinute(Date date)
  {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(date);
    return calendar.get(12);
  }

  public static Date setMinute(Date date, int amount)
  {
    return DateUtils.setMinutes(date, amount);
  }

  public static int getSecond(Date date)
  {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(date);

    return calendar.get(13);
  }

  public static Date setSecond(Date date, int amount)
  {
    return DateUtils.setSeconds(date, amount);
  }

  public static String format(Date date, String pattern)
  {
    if (StringUtils.isEmpty(pattern))
      pattern = "yyyy-MM-dd HH:mm:ss";

    return DateFormatUtils.format(date, pattern);
  }

  public static String format(String dateString, String pattern, String desPattern)
    throws ParseException
  {
    if (StringUtils.isEmpty(pattern))
      pattern = "yyyy-MM-dd HH:mm:ss";

    Date date = DateUtils.parseDate(dateString, new String[] { pattern });

    return format(date, desPattern);
  }

  public static Date convert(String date, String pattern)
    throws ParseException
  {
    if (StringUtils.isEmpty(pattern))
      pattern = "yyyy-MM-dd HH:mm:ss";

    SimpleDateFormat sdf = new SimpleDateFormat(pattern);

    return sdf.parse(date);
  }

  public static Date parseDate(String dateString)
  {
    try
    {
      return DateUtils.parseDate(dateString, new String[] { "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd", "HH:mm:ss", "yyyy-MM-dd HH:mm:ss.SSS" });
    }
    catch (ParseException e) {
      throw new InvalidParameterException(dateString + "不是一个正确格式的日期。");
    }
  }

  public static boolean isTimeBetween(Date startTime, Date endTime, Date dateTime)
  {
    return ((((dateTime.equals(startTime)) || (dateTime.after(startTime)))) && (dateTime.before(endTime)));
  }
}