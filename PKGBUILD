# Maintainer: nemphorous <https://github.com/nemphorous>
pkgname=zpwarch
pkgver=0.1.0
pkgrel=1
pkgdesc="Zen PWA Suite - Self-contained web apps via Zen Browser"
arch=('any')
url="https://github.com/uchoa/zpwa"
license=('GPL3')
depends=('zen-browser' 'gum' 'curl' 'sed' 'grep' 'socat' 'jq' 'perl')
provides=('zpwa')
conflicts=('zpwa-git')
install=zpwa.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')


package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -dm755 "$pkgdir/usr/share/zpwa"

    cp -r * "$pkgdir/usr/share/zpwa/"

    mv "$pkgdir/usr/share/zpwa/cli/zpwa" "$pkgdir/usr/share/zpwa/zpwa"
    rmdir "$pkgdir/usr/share/zpwa/cli"

    rm -rf "$pkgdir/usr/share/zpwa/docs"
    rm -f "$pkgdir/usr/share/zpwa/PKGBUILD"
    rm -f "$pkgdir/usr/share/zpwa/zpwa.install"
    rm -f "$pkgdir/usr/share/zpwa/README.md"
    rm -f "$pkgdir/usr/share/zpwa/.gitignore"

    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/share/zpwa/zpwa" "$pkgdir/usr/bin/zpwa"

    chmod +x "$pkgdir/usr/share/zpwa/zpwa"
    find "$pkgdir/usr/share/zpwa" -name "*.sh" -exec chmod +x {} + 2>/dev/null
}
