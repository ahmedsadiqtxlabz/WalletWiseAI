//
//  TransactionsHistoryView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 12/06/2024.
//

import SwiftUI

struct TransactionsHistoryView: View {
    
    let filters: [Filter] = [
        Filter(name: L10n.Transactions.Filters._1),
        Filter(name: L10n.Transactions.Filters._2),
        Filter(name: L10n.Transactions.Filters._3),
        Filter(name: L10n.Transactions.Filters._4)
    ]
    
    @Environment(\.presentationMode) var presentationMode
    @State var selectedFilters: Set<UUID> = []
    @State var isShowingFilters: Bool = false
    @State var showFromDatePicker: Bool = false
    @State var showToDatePicker: Bool = false
    @State var toDate = Date()
    @State var fromDate = Date()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                headerView
                filtersView
                transactionsView
            }
            .padding(.top, 60)
            .background(Color(Asset.Colors.primaryLightGray.color).edgesIgnoringSafeArea(.all))
            
            if isShowingFilters {
                Color.black.opacity(0.7)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        self.isShowingFilters = false
                    }
                FilterView(isPresented: $isShowingFilters, fromDate: $fromDate, toDate: $toDate, showFromDatePicker: $showFromDatePicker, showToDatePicker: $showToDatePicker)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut)
            }
            
            if showFromDatePicker || showToDatePicker {
                showFromDatePickerView
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

extension TransactionsHistoryView {
    var headerView: some View {
        ZStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(uiImage: Asset.backArrow.image)
                        .frame(width: 20, height: 20)
                })
                Spacer()
                Button(action: {
                    self.isShowingFilters = true
                }, label: {
                    Image(uiImage: Asset.filterIcon.image)
                })
            }
            .padding(.horizontal, 15)
            
            Text(L10n.Accounts.Options.history)
                .font(Font.SFPro.semiBold(size: 18))
        }
    }
    
    var filtersView: some View {
        TransactionsFilterView(
            filters: filters,
            selectedFilters: $selectedFilters)
    }
    
    var transactionsView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Section {
                LazyVStack(alignment: .leading) {
                    ForEach(0..<10, id: \.self) { _ in
                        TransactionRow()
                    }
                }
                .padding(.horizontal, 10)
            } header: {
                listHeader
            }
        }
        .padding(.bottom, 35)
    }
    
    var listHeader: some View {
        HStack {
            Text("Today")
                .foregroundColor(.gray)
                .font(Font.SFPro.medium(size: 16))
            Spacer()
            Text("-$60")
                .font(Font.SFPro.medium(size: 16))
        }
        .padding(.horizontal, 20)
        .padding(.top, 5)
    }
    
    var showFromDatePickerView: some View {
        ZStack(alignment: .center) {
            Color.black.opacity(0.7)
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(Asset.Colors.primaryWhite.color))
                .cornerRadius(10)
            VStack {
                Spacer()
                HStack(alignment: .center) {
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Text("Done")
                            .font(Font.SFPro.semiBold(size: 16))
                            .foregroundColor(Color(Asset.Colors.primaryBlue.color))
                            .padding()
                    })
                }
                DatePicker("", selection: $fromDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                    .labelsHidden()
                Spacer()
            }
            .frame(height: 300)
            .padding()
        }
    }
}

#Preview {
    TransactionsHistoryView()
}

