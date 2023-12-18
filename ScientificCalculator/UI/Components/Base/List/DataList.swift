//
//  DataList.swift
//  CalNotes
//
//  Created by Jacky Lam on 2023-08-28.
//

import SwiftUI

struct DataList<Data: RandomAccessCollection, Content: View, SwipeContent: View>: View {
    var data: Data
    var spacing: CGFloat
    var padding: EdgeInsets
    var content: (Data.Element) -> Content
    var swipeContent: Optional<(Foundation.IndexSet) -> SwipeContent>
    var deleteItem: Optional<(Foundation.IndexSet) -> Void>
    var moveItem: Optional<(Foundation.IndexSet, Int) -> Void>

    init(
        data: Data,
        spacing: CGFloat = 0,
        padding: EdgeInsets = EdgeInsets(),
        @ViewBuilder content: @escaping (Data.Element) -> Content,
        swipeContent: Optional<(Foundation.IndexSet) -> SwipeContent> = nil,
        deleteItem: Optional<(Foundation.IndexSet) -> Void> = nil,
        moveItem: Optional<(Foundation.IndexSet, Int) -> Void> = nil
    ) {
        self.data = data
        self.spacing = spacing
        self.padding = padding
        self.content = content
        self.swipeContent = swipeContent
        self.deleteItem = deleteItem
        self.moveItem = moveItem
    }

    init(
        data: Data,
        spacing: CGFloat = 0,
        padding: EdgeInsets = EdgeInsets(),
        @ViewBuilder content: @escaping (Data.Element) -> Content,
        deleteItem: Optional<(Foundation.IndexSet) -> Void> = nil,
        moveItem: Optional<(Foundation.IndexSet, Int) -> Void> = nil
    ) where SwipeContent == EmptyView {
        self.init(
            data: data,
            spacing: spacing,
            padding: padding,
            content: content,
            swipeContent: nil,
            deleteItem: deleteItem,
            moveItem: moveItem
        )
    }

    var body: some View {
        if data.count == 0 {
            DataNoItemView()
        } else {
            DataItemList(
                data: data,
                spacing: spacing,
                padding: padding,
                content: content,
                swipeContent: swipeContent,
                deleteItem: deleteItem,
                moveItem: moveItem
            )
        }
    }
}

struct DataNoItemView: View {
    var body: some View {
        Text("")
    }
}

struct DataItemList<Data: RandomAccessCollection, Content: View, SwipeContent: View>: View {
    var iconWidth: CGFloat = 24.0

    var data: Data
    var spacing: CGFloat
    var padding: EdgeInsets
    var content: (Data.Element) -> Content
    var swipeContent: Optional<(Foundation.IndexSet) -> SwipeContent>
    var deleteItem: Optional<(Foundation.IndexSet) -> Void>
    var moveItem: Optional<(Foundation.IndexSet, Int) -> Void>

    var body: some View {
        List {
            DataItemSpacer(spacing: padding.top)
                .listRowStyle(DataListRowStyle())

            ForEach(0..<data.count, id: \.self) { index in
                content(data[data.index(data.startIndex, offsetBy: index)])
                    .listRowInsets(EdgeInsets(
                        top: index == 0 ? 0 : spacing / 2,
                        leading: padding.leading,
                        bottom: index == data.count - 1 ? 0 : spacing / 2,
                        trailing: padding.trailing
                    ))
                    .listRowStyle(DataListRowStyle())
                    .moveDisabled(moveItem == nil)
                    .onDrag { // mean drag a row container
                        return NSItemProvider()
                    }
                    .swipeActions(allowsFullSwipe: deleteItem != nil) {
                        let indexSet = Foundation.IndexSet(arrayLiteral: index)
                        if let deleteItem = deleteItem {
                            Button(action: { deleteItem(indexSet) }) {
                                Image("trash")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(.white)
                                    .frame(width: iconWidth, height: iconWidth)
                            }
                            .tint(.red)
                            .accessibilityIdentifier("listRowDeleteButton")
                        }
                        if let swipeContent = swipeContent {
                            swipeContent(indexSet)
                        }
                    }
                    .accessibilityElement(children: .contain)
                    .accessibilityIdentifier("listRow")
            }.onMove { from, to in
                moveItem?(from, to)
            }

            DataItemSpacer(spacing: padding.bottom)
                .listRowStyle(DataListRowStyle())
        }
        .listStyle(DataListStyle())
        .environment(\.editMode, .constant(.inactive))
        .environment(\.defaultMinListRowHeight, 1)
        .accessibilityElement(children: .combine)
    }
}

struct DataItemSpacer: View {
    var spacing: CGFloat

    var body: some View {
        Spacer().frame(height: spacing)
    }
}

fileprivate struct DataListStyle: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden)
                .scrollIndicators(.hidden)
        } else {
            content
                .listStyle(PlainListStyle())
                .onAppear {
                    UITableView.appearance().separatorColor = .clear
                    UITableView.appearance().separatorStyle = .none
                    UITableView.appearance().backgroundColor = UIColor.clear
                    UITableView.appearance().showsVerticalScrollIndicator = false
                }
                .onDisappear(perform: {
                    UITableView.appearance().separatorStyle = .singleLine
                })
        }
    }
}

fileprivate extension View {
    func dataListRowStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

fileprivate extension Spacer {
    func dataListRowStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

struct DataListRowStyle: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .listRowInsets(EdgeInsets(top: -0.5, leading: 0, bottom: -0.5, trailing: 0))  // top inset for topmost separator line
//                .padding(EdgeInsets(top: 1.5, leading: 0, bottom: 1.5, trailing: 0))  // padding top for cancelling inset
                .listRowBackground(Color.clear)
                .background(Color.clear)
                .listRowSeparator(.hidden)
        } else {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .listRowInsets(EdgeInsets(top: -0.5, leading: 0, bottom: -0.5, trailing: 0))  // top inset for topmost separator line
                .padding(EdgeInsets(top: 0.1, leading: 0, bottom: 0, trailing: 0))  // padding top for cancelling inset
                .listRowBackground(Color.clear)
                .background(Color.clear)
        }
    }
}


struct DataList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DataList(
                data: (1...50).map { "Item \($0)" },
                spacing: 10,
                padding: EdgeInsets(top: 15, leading: 15, bottom: 50, trailing: 15),
                content: { text in
                    Text(text)
                }
            )

            DataList(
                data: [String](),
                spacing: 10,
                content: { text in
                    Text(text)
                }
            )
            .previewDisplayName("No Item")

            DataList(
                data: (1...50).map { "Item \($0)" },
                spacing: 0,
                content: { text in
                    Text(text)
                }
            )
            .previewDisplayName("No Spacing")
        }
    }
}
