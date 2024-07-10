//
//  BudgetPieChartView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 09/07/2024.
//

import SwiftUI

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

struct PieData: Identifiable, Hashable {
    var id: String {
        name
    }

    let color: Color
    let value: Double
    let name: String
    let allowedValue: String

    var angleValue: Double {
        (value / 100) * 360
    }
}

struct PieShape: Shape {
    let center: CGPoint
    let radius: CGFloat
    let startAngle: Angle
    let endAngle: Angle
    let lineWidth: CGFloat = 12

    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        return p.strokedPath(.init(lineWidth: lineWidth, lineCap: .round))
    }
}

struct BudgetPieChartView: View {
    // sum of all the values should be 100
    let chartData: [PieData] = [PieData(color: .orange, value: 60, name: "Food", allowedValue: "$100-60%"),
                           PieData(color: .pink, value: 20, name: "Shopping", allowedValue: "$60-20%"),
                           PieData(color: .purple, value: 10, name: "Entertainment", allowedValue: "$40-10%"),
                           PieData(color: .blue, value: 10, name: "Fuel", allowedValue: "$15-10%")]

    func previousSum(till index: Int) -> Double {
        var sum: Double = 0
        for (i, data) in chartData.enumerated() {
            if i < index {
                sum += data.angleValue
            }
        }

        return sum
    }

    var body: some View {
        VStack {
            HStack {
                Text("Categories")
                    .font(Font.SFPro.medium(size: 16))
                    .padding(10)
                Spacer()
            }
            ZStack(alignment: .center) {
                chartView
                    .frame(height: 150)
                Text("04\nTotal Categories")
                    .font(.caption)
                    .font(Font.SFPro.medium(size: 16))
                    .multilineTextAlignment(.center)
            }
            Divider()
                .padding(.vertical, 8)
            informationView
        }
        .padding(10)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8, height: 8)))
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
    }

    var chartView: some View {
        GeometryReader { proxy in
            ForEach(Array(chartData.enumerated()), id: \.element) { index, element in
                PieShape(center: CGPoint(x: proxy.size.width / 2, y: 75),
                         radius: 65,
                         startAngle: .degrees(previousSum(till: index)),
                         endAngle: .degrees(element.angleValue + previousSum(till: index)))
                .fill(element.color)
            }
        }
    }

    var informationView: some View {
        VStack(spacing: 8) {
            ForEach(chartData) { data in
                description(for: data)
            }
        }
    }

    func description(for data: PieData) -> some View {
        HStack {
            RoundedRectangle(cornerSize: CGSize(width: 2, height: 2))
                .fill(data.color)
                .frame(width: 12, height: 12)
            Text(data.name)
                .font(Font.SFPro.regular(size: 14))
            Spacer()
            Text(data.allowedValue)
                .font(Font.SFPro.regular(size: 14))
        }
    }
}

#Preview {
    BudgetPieChartView()
}
