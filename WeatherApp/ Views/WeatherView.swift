//
//  WeatherView.swift
//  WeatherApp
//
//  Created by mak on 23.03.2023.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Сегодня, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            if weather.weather[0].main == "Clouds" {
                                Image(systemName: "cloud")
                                    .font(.system(size: 40))
                                
                                Text("Облачно")
                                                                
                                
                            } else if weather.weather[0].main == "Rain" {
                                
                                Image(systemName: "cloud.rain")
                                    .font(.system(size: 40))
                                
                                Text("Дождь")
                                
                            } else if weather.weather[0].main == "Snow" {
                                
                                Image(systemName: "cloud.snow")
                                    .font(.system(size: 40))
                                
                                Text("Снег")
                                
                            } else if weather.weather[0].main == "Clear" {
                                
                                Image(systemName: "cloud")
                                    .font(.system(size: 40))
                                
                                Text("Ясно")
                                
                            }
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height:  80)
                    
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Погода сейчас")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Мин темп", value: (weather.main.tempMin.roundDouble() + ("°")))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Макс темп", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Скорость ветра", value: (weather.wind.speed.roundDouble() + " m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Влажность", value: "\(weather.main.humidity.roundDouble())%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background{
            switch weather.weather[0].main {
               case "Clouds":
                   Image("cloud")
                       .resizable()
                       .scaledToFill()
                       .ignoresSafeArea()
               case "Rain":
                   Image("rain")
                       .resizable()
                       .scaledToFill()
                       .ignoresSafeArea()
               case "Snow":
                   Image("snow")
                       .resizable()
                       .scaledToFill()
                       .ignoresSafeArea()
            case "Clear":
                Image("clear")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
               default:
                    Color.black
               }
        }
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
