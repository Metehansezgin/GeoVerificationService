using GeoVerificationService.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GeoVerificationService
{
    class DbConnetion
    {
         
        String cs = @"Data Source=METEHANPC\SQLEXPRESS;Initial Catalog=GeoVerificationServiceDB;Integrated Security=True";
        public DbConnetion()
        {

        }

 
        public List<REQUEST_GEO_01> GET_REQUEST_GEO_01()
        {
            List<REQUEST_GEO_01> DataList = DataList = new List<REQUEST_GEO_01>();

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("sp_REQUEST_GEO_01_GET", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;             
                    con.Open();

                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                       
                        while (dr.Read())
                        {
                            DataList.Add(new REQUEST_GEO_01
                            {
                                id=dr.GetInt32(0),
                                Latitude = dr.GetString(1),
                                Longitude=dr.GetString(2)
                            }) ;
                        }
                        return DataList;
                    }
                    else
                    {
                        return null;
                    }                    

                }
            }

        }


        public List<REQUEST_GEO_02> GET_REQUEST_GEO_02()
        {
            List<REQUEST_GEO_02> DataList = DataList = new List<REQUEST_GEO_02>();

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("sp_REQUEST_GEO_02_GET", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();

                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {

                        while (dr.Read())
                        {
                            DataList.Add(new REQUEST_GEO_02
                            {
                                id = dr.GetInt32(0),
                                Latitude = dr.GetString(1),
                                Longitude = dr.GetString(2)
                            });
                        }
                        return DataList;
                    }
                    else
                    {
                        return null;
                    }

                }
            }

        }


        public void ADD_REQUEST_GEO_DONE(string Latitude, string Longitude, string Address)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("sp_REQUEST_GEO_DONE_ADD", con))
                { 

                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Latitude",50).Value = Latitude;
                    cmd.Parameters.AddWithValue("@Longitude",50).Value = Longitude;
                    cmd.Parameters.AddWithValue("@Address", 1000).Value = Address;
                     
                    con.Open();
                    cmd.ExecuteNonQuery();

                }
            }

        }


        public void DELETE_REQUEST_GEO_01(int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("sp_REQUEST_GEO_01_DELETE", con))
                {

                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@id", SqlDbType.Int).Value = id;
                   

                    con.Open();
                    cmd.ExecuteNonQuery();

                }
            }

        }

        public void DELETE_REQUEST_GEO_02(int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("sp_REQUEST_GEO_02_DELETE", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@id", SqlDbType.Int).Value = id;


                    con.Open();
                    cmd.ExecuteNonQuery();

                }
            }

        }
    }
}
