//
//  TransactionsFilterView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 12/06/2024.
//

import SwiftUI

struct Filter: Identifiable {
    let id = UUID()
    let name: String
}

struct TransactionsFilterView: View {
    
    @State var filters: [Filter] = [
        
    ]
    
    @Binding var selectedFilters: Set<UUID>
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(filters) { filter in
                    FilterSelectionView(filter: filter, isSelected: selectedFilters.contains(filter.id))
                        .onTapGesture {
                            toggleSelection(for: filter)
                        }
                }
            }
            .padding()
        }
    }
    
    private func toggleSelection(for filter: Filter) {
            if selectedFilters.contains(filter.id) {
                selectedFilters.remove(filter.id)
            } else {
                selectedFilters.insert(filter.id)
            }
        }
}

fileprivate struct FilterSelectionView: View {
    let filter: Filter
    let isSelected: Bool
    
    var body: some View {
        Text(filter.name)
            .padding()
            .font(Font.SFPro.medium(size: 15))
            .background(isSelected ? Color(Asset.Colors.primaryBlue.color) : Color(red: 236/255, green: 236/255, blue: 236/255))
            .foregroundColor(isSelected ? Color(Asset.Colors.primaryWhite.color) : Color.gray)
            .frame(height: 30)
            .cornerRadius(15, corners: .allCorners)
    }
}
