
module IArea
  class Mesh
    DIFF_LAT = 300000.0
    DIFF_LNG = 450000.0

    def self.latlng2mesh(lat,lng,deg=7)
      lat *= 3600000
      lng *= 3600000
      m1lat = (lat * 1.5 / 3600000).to_i
      m1lng = ((lng / 3600000) - 100 ).to_i
      e1lat,e1lng =   mesh2latlng("#{m1lat}#{m1lng}")
      m2lat = ( (lat - e1lat ) / DIFF_LAT).to_i
      m2lng = ( (lng - e1lng) /  DIFF_LNG ).to_i
      mesh = "#{m1lat}#{m1lng}#{m2lat}#{m2lng}"
      
      (deg - 2).times do |i|
        e2lat,e2lng = mesh2latlng(mesh)
        diff_lat = DIFF_LAT / (2 * (i + 1)) 
        diff_lng = DIFF_LNG / (2 * (i + 1)) 
        tm = ( (lat - e2lat ) / diff_lat  ).to_i
        tl = ( (lng - e2lng) /  diff_lng ).to_i
        if tl == 0 and tm == 0
          m3 = 0
        elsif tl == 1 and tm == 0
          m3 = 1
        elsif tl == 0 and tm == 1
          m3 = 2
        elsif tl == 1 and tm == 1
          m3 = 3
        end
        mesh += m3.to_s
      end
      mesh
    end

    def self.mesh2latlng(mesh)
      lat =  mesh[0,2].to_i * 2400000
      lng = (mesh[2,2].to_i + 100) * 3600000
      if mesh.size < 5
        return lat,lng
      end
      diff_lat = DIFF_LAT 
      diff_lng = DIFF_LNG

      lat = lat + ( mesh[4,1].to_i * diff_lat )
      lng = lng + ( mesh[5,1].to_i * diff_lng )
      if mesh.size < 7
        return lat,lng
      end
      i = 6
      while mesh.size > i
        diff_lat /= 2.0
        diff_lng /= 2.0
        lat = lat + ( z(mesh[i,1])[0] * diff_lat )
        lng = lng + ( z(mesh[i,1])[1] * diff_lng )
        i += 1
      end
      [lat,lng]
    end

    # return z_lat z_lng
    def self.z(m)
      m = m.to_i
      if m == 0
        [0,0]
      elsif m == 1
        [0,1]
      elsif m == 2
        [1,0]
      else
        [1,1]
      end
    end
  end
end
