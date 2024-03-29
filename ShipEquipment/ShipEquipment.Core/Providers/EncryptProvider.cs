﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using ShipEquipment.Core.Extensions;

namespace ShipEquipment.Core.Providers
{
    public static class EncryptProvider
    {
        public static string GenerateSalt()
        {
            byte[] data = new byte[16];
            new RNGCryptoServiceProvider().GetBytes(data);
            return Convert.ToBase64String(data);
        }

        public static string EncryptPassword(string pass, string salt)
        {
            try
            {
                byte[] bytes = Encoding.Unicode.GetBytes(pass);
                byte[] src = Convert.FromBase64String(salt);
                byte[] inArray = null;


                KeyedHashAlgorithm algorithm = KeyedHashAlgorithm.Create();
                algorithm.Key = new byte[64]; //compatible with mono
                if (algorithm.Key.Length == src.Length)
                {
                    algorithm.Key = src;
                }
                else if (algorithm.Key.Length < src.Length)
                {
                    byte[] dst = new byte[algorithm.Key.Length];
                    Buffer.BlockCopy(src, 0, dst, 0, dst.Length);
                    algorithm.Key = dst;
                }
                else
                {
                    int num2;
                    byte[] buffer5 = new byte[algorithm.Key.Length];
                    for (int i = 0; i < buffer5.Length; i += num2)
                    {
                        num2 = Math.Min(src.Length, buffer5.Length - i);
                        Buffer.BlockCopy(src, 0, buffer5, i, num2);
                    }
                    algorithm.Key = buffer5;
                }
                inArray = algorithm.ComputeHash(bytes);

                return Convert.ToBase64String(inArray);
            }
            catch (Exception exp)
            {
                exp.Log("Error encrypt password.");
            }

            return salt;
        }
    }
}
