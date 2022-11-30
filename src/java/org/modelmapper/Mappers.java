/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.modelmapper;

import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Date;

/**
 *
 * @author FNZABALETAA
 */
public class Mappers {

    public static void Configure(ModelMapper modelMapper) {
        if (modelMapper.getTypeMap(String.class, java.util.Date.class) == null) {
            modelMapper.createTypeMap(String.class, java.util.Date.class);
            modelMapper.addConverter(ConvertStringDate());
            modelMapper.getTypeMap(String.class, java.util.Date.class).setProvider(providerDate());
        }
    }

    private static Converter<String, Date> ConvertStringDate() {
        Converter<String, Date> ToStringDate = new AbstractConverter<String, java.util.Date>() {
            @Override
            protected Date convert(String source) {
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                try {
                    Date date = sdf.parse(source);
                    return date;
                } catch (ParseException e) {
                }
                return null;
            }
        };
        return ToStringDate;
    }

    private static Provider<Date> providerDate() {
        Provider<Date> javaDateProvider = new AbstractProvider<Date>() {
            @Override
            public java.util.Date get() {
                return new java.util.Date();
            }
        };
        return javaDateProvider;
    }
}
