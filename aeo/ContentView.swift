import SwiftUI

struct ContentView: View {
    @ObservedObject var datas = ReadData()
    @State private var selectedCategory: String = "All"
    
    var body: some View {
        VStack {
            Menu {
                  ForEach(datas.categories, id: \.self) { category in
                      Button(action: {
                          selectedCategory = category
                      }) {
                          Text(category)
                      }
                  }
              } label: {
                  HStack {
                      VStack(alignment: .leading) {
                          Text("Category")
                              .font(.system(size: 10))
                              .foregroundColor(.black)
                          Text(selectedCategory)
                              .font(.system(size: 14))
                              .bold()
                              .foregroundColor(.black)
                      }
                      Spacer()
                      Image(systemName: "chevron.down")
                  }
                  .padding()
                  .frame(maxWidth: .infinity)
                  .background(Color.white)
                  .cornerRadius(5)
                  .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
              }
              .padding()
            HStack {
                Spacer()
                Text("\(filteredProducts.count) Items")
                    .font(.system(size: 10))
                    .padding()
            }
            
            
            let columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(filteredProducts, id: \.id) { product in
                        VStack {
                            AsyncImage(url: URL(string: product.productImage))
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width/2.4, height: UIScreen.main.bounds.width/1.5)
                                .clipped()
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(product.productName)
                                        .font(.system(size: 12))
                                    Text("$" + product.productPrice)
                                        .font(.system(size: 10))
                                }
                                Spacer()
                            }

                        }
                    }
                }
                .padding()
            }
        }
    }
    
    private var filteredProducts: [Product] {
        if selectedCategory == "All" {
            return datas.products
        } else {
            return datas.products.filter { $0.productCategory == selectedCategory }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
