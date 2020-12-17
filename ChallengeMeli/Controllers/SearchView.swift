//
//  SearchView.swift
//  ChallengeMeli
//
//  Created by Graciela Gabriela Ardiles on 16/12/2020.
//

import Foundation
import UIKit

class SearchView: UIView {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      
      configureView()
    }
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)
      
      configureView()
    }
    
    override func draw(_ rect: CGRect) {
      label.frame = bounds
    }
    
    func setNotFiltering() {
      label.text = ""
      hideFooter()
    }
    
    func setIsFilteringToShow(filteredItemCount: Int, of totalItemCount: Int) {
      if (filteredItemCount == totalItemCount) {
        setNotFiltering()
      } else if (filteredItemCount == 0) {
        label.text = "No items match your query"
        showFooter()
      } else {
        label.text = "Filtering \(filteredItemCount) of \(totalItemCount)"
        showFooter()
      }
    }
    
    func hideFooter() {
      UIView.animate(withDuration: 0.7) {
        self.alpha = 0.0
      }
    }
    
    func showFooter() {
      UIView.animate(withDuration: 0.7) {
        self.alpha = 1.0
      }
    }
    
    func configureView() {
      backgroundColor = UIColor.globalTheme
      alpha = 0.0
      
      label.textAlignment = .center
      label.textColor = UIColor.white
      addSubview(label)
    }
}
