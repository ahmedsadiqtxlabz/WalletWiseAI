//
//  ImagePickerView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 26/06/2024.
//

import SwiftUI

struct ImagePickerView: View {
    
    @Binding var images: [UIImage]
    @State private var selectedImage: UIImage?
    @State private var isPresented: Bool = false
    var sourceType: UIImagePickerController.SourceType
    
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(Array(images.enumerated()), id: \.offset) { index, image in
                SelectedPickerImageView(image: image, index: index) { index in
                    self.images.remove(at: index)
                }
            }
            Button(action: {
                self.isPresented = true
            }, label: {
                let image = self.images.count > 0 ? Asset.imagePickerAdd.image : Asset.selectImageIcon.image
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
            })
            if self.images.isEmpty {
                Text(L10n.Expenses.Placeholders.picker)
                    .font(Font.SFPro.regular(size: 16))
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .frame(height: 45)
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
        .sheet(isPresented: $isPresented, onDismiss: {
            if let selectedImage = selectedImage {
                images.append(selectedImage)
            }
            self.isPresented = false
        }, content: {
            ImagePicker(image: $selectedImage, sourceType: sourceType)
                .edgesIgnoringSafeArea(.all)
        })
    }
}

#Preview {
    ImagePickerView(images: Binding.constant([]), sourceType: .photoLibrary)
}

fileprivate struct SelectedPickerImageView: View {
    var image: UIImage
    var index: Int
    var cross: ((Int) -> Void)?
    var body: some View {
        ZStack(alignment: .center) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .frame(width: 40, height: 40)
        .cornerRadius(5, corners: .allCorners)
        .overlay(
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.cross?(index)
                    }) {
                        Image(uiImage: Asset.cross.image)
                    }
                }
                .padding(.trailing, -5)
                Spacer()
            }
                .padding(.top, -5)
        )
    }
}
