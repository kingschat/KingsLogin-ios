// Copyright (c) 2018 Kinging LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import UIKit

/**
 * Preconfigured button for KingsChat login
 */
public class KCLoginButton: UIButton {

    public override var intrinsicContentSize: CGSize {
        return Constants.Size.intrinsicContentSize
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height/2
    }

    @objc private func loginAction() {
        LoginManager.makeAuthorizationRequest()
    }
}

// MARK: - Setup methods

private extension KCLoginButton {
    private func setup() {
        setupButton()
        setupImageView()
        setupLayer()
        setupInsets()
        frame.size = intrinsicContentSize
    }

    private func setupButton() {
        adjustsImageWhenHighlighted = false
        setTitle(Localization.loginWithKingsChat, for: .normal)
        setTitleColor(.kcWhite, for: .normal)
        addTarget(nil, action: #selector(loginAction), for: .touchUpInside)
    }

    private func setupImageView() {
        let image = UIImage(named: "kc-logo-button", in: Bundle(for: KCLoginButton.self), compatibleWith: nil)
        setImage(image, for: .normal)
        imageView?.contentMode = .scaleAspectFit
        imageView?.tintColor = .kcWhite
        imageView?.clipsToBounds = true
    }

    private func setupLayer() {
        layer.backgroundColor = UIColor.kcBlue.cgColor
        layer.borderColor = UIColor.kcWhite.cgColor

        layer.borderWidth = Constants.Layer.borderWidth
    }

    private func setupInsets() {
        imageEdgeInsets = UIEdgeInsets(top: Constants.Insets.default,
                                       left: Constants.Insets.default,
                                       bottom: Constants.Insets.default,
                                       right: Constants.Insets.Image.right)

        titleEdgeInsets = UIEdgeInsets(top: Constants.Insets.default,
                                       left: Constants.Insets.Title.left,
                                       bottom: Constants.Insets.default,
                                       right: Constants.Insets.default)
    }
}

// MARK: - Layout constats

private extension KCLoginButton {
    private struct Constants {

        struct Layer {
            static let borderWidth: CGFloat = 1.0
        }

        struct Size {
            static let intrinsicContentSize: CGSize = CGSize(width: 269, height: 55)
            static let widthExtension: CGFloat = 32
            static let heightExtension: CGFloat = 8
        }

        struct Insets {
            static let `default`: CGFloat = 0

            struct Image {
                static let right: CGFloat = 8.0
            }

            struct Title {
                static let left: CGFloat = 8.0
            }
        }
    }
}
