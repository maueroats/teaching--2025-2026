/*
 * "trip_id","start_time","end_time","bikeid","tripduration","from_station_id",
 * "from_station_name","to_station_id","to_station_name","usertype","gender","birthyear"
 **/


public class BikeInfo
{
  public String[] fields;
  private int tripDuration = -1;

  // field numbers for duration and birth year
  public final int TRIP_DURATION=4, BIRTH_YEAR = 12;
  
  public BikeInfo (String data) {
    fields = data.split(",");
  }
  public boolean hasBirthYear() {
    return ! "".equals(fields[BIRTH_YEAR]);
  }
  public int getBirthYear() {
    return Integer.parseInt(fields[BIRTH_YEAR]);
  }
  public int getTripDuration() {
    if (tripDuration == -1) {
      tripDuration = Integer.parseInt(fields[TRIP_DURATION]);
    }
    return tripDuration;
  }
  
}

