Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3D711A7C2
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2019 10:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbfLKJoG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 11 Dec 2019 04:44:06 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:24958 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728265AbfLKJoG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 11 Dec 2019 04:44:06 -0500
X-UUID: 5733d7d30ac8430abb75d78637c77e1c-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1VJn5jAqrnLtlvKIMuG2cASmtgyBeVkMvB5FhRuXq5E=;
        b=aewkJkuWxDdxeFE6FUAn++hpPh10VvXD0hXLhDg/QQl6fY94oiSSpVLOuZy+HrvxdtS3cd5yEpcDQaz2A+YhRf4pj4hbzwUA+NcPA3CxWR68sar4MaNXkDlokGskaksxaeLFeYzz9QbKzx/Zl+a3Qus0jAOe8vYviSN7TXDT35M=;
X-UUID: 5733d7d30ac8430abb75d78637c77e1c-20191211
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1714625473; Wed, 11 Dec 2019 17:43:59 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 17:43:35 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Dec 2019 17:43:34 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Tianping Fang <tianping.fang@mediatek.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Josef Friedl <josef.friedl@speed.at>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Ran Bi <ran.bi@mediatek.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>
Subject: [PATCH v7 6/6] rtc: Add support for the MediaTek MT6358 RTC
Date:   Wed, 11 Dec 2019 17:43:55 +0800
Message-ID: <1576057435-3561-7-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1576057435-3561-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1576057435-3561-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

RnJvbTogUmFuIEJpIDxyYW4uYmlAbWVkaWF0ZWsuY29tPg0KDQpUaGlzIGFkZCBzdXBwb3J0IGZv
ciB0aGUgTWVkaWFUZWsgTVQ2MzU4IFJUQy4gRHJpdmVyIHVzaW5nDQpjb21wYXRpYmxlIGRhdGEg
dG8gc3RvcmUgZGlmZmVyZW50IFJUQ19XUlRHUiBhZGRyZXNzIG9mZnNldC4NCg0KU2lnbmVkLW9m
Zi1ieTogUmFuIEJpIDxyYW4uYmlAbWVkaWF0ZWsuY29tPg0KU2lnbmVkLW9mZi1ieTogSHNpbi1I
c2l1bmcgV2FuZyA8aHNpbi1oc2l1bmcud2FuZ0BtZWRpYXRlay5jb20+DQpBY2tlZC1ieTogQWxl
eGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPg0KLS0tDQogZHJp
dmVycy9ydGMvcnRjLW10NjM5Ny5jICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKy0tLS0tLS0t
DQogaW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L3J0Yy5oIHwgMTYgKysrKysrKysrKysrKysrLQ0K
IDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1tdDYzOTcuYyBiL2RyaXZlcnMvcnRjL3J0Yy1tdDYz
OTcuYw0KaW5kZXggOTEzNWUyMS4uNmNhNTRmOSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvcnRjL3J0
Yy1tdDYzOTcuYw0KKysrIGIvZHJpdmVycy9ydGMvcnRjLW10NjM5Ny5jDQpAQCAtMTUsMTIgKzE1
LDI0IEBADQogI2luY2x1ZGUgPGxpbnV4L21mZC9tdDYzOTcvcnRjLmg+DQogI2luY2x1ZGUgPGxp
bnV4L21vZF9kZXZpY2V0YWJsZS5oPg0KIA0KK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIG10NjM5N19ydGNfb2ZfbWF0Y2hbXSA9IHsNCisJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDYzMjMtcnRjIiwNCisJCS5kYXRhID0gKHZvaWQgKikmbXQ2Mzk3X3J0Y19kYXRhLCB9LA0K
Kwl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10NjM1OC1ydGMiLA0KKwkJLmRhdGEgPSAodm9p
ZCAqKSZtdDYzNThfcnRjX2RhdGEsIH0sDQorCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2
Mzk3LXJ0YyIsDQorCQkuZGF0YSA9ICh2b2lkICopJm10NjM5N19ydGNfZGF0YSwgfSwNCisJe30N
Cit9Ow0KK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG10NjM5N19ydGNfb2ZfbWF0Y2gpOw0KKw0K
IHN0YXRpYyBpbnQgbXRrX3J0Y193cml0ZV90cmlnZ2VyKHN0cnVjdCBtdDYzOTdfcnRjICpydGMp
DQogew0KIAlpbnQgcmV0Ow0KIAl1MzIgZGF0YTsNCiANCi0JcmV0ID0gcmVnbWFwX3dyaXRlKHJ0
Yy0+cmVnbWFwLCBydGMtPmFkZHJfYmFzZSArIFJUQ19XUlRHUiwgMSk7DQorCXJldCA9IHJlZ21h
cF93cml0ZShydGMtPnJlZ21hcCwNCisJCQkgICBydGMtPmFkZHJfYmFzZSArIHJ0Yy0+ZGF0YS0+
d3J0Z3IsIDEpOw0KIAlpZiAocmV0IDwgMCkNCiAJCXJldHVybiByZXQ7DQogDQpAQCAtMjY5LDYg
KzI4MSw5IEBAIHN0YXRpYyBpbnQgbXRrX3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KIAlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9N
RU0sIDApOw0KIAlydGMtPmFkZHJfYmFzZSA9IHJlcy0+c3RhcnQ7DQogDQorCXJ0Yy0+ZGF0YSA9
IChzdHJ1Y3QgbXRrX3J0Y19kYXRhICopDQorCQkJb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZw
ZGV2LT5kZXYpOw0KKw0KIAlydGMtPmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7DQog
CWlmIChydGMtPmlycSA8IDApDQogCQlyZXR1cm4gcnRjLT5pcnE7DQpAQCAtMzMzLDEzICszNDgs
NiBAQCBzdGF0aWMgaW50IG10NjM5N19ydGNfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCiBz
dGF0aWMgU0lNUExFX0RFVl9QTV9PUFMobXQ2Mzk3X3BtX29wcywgbXQ2Mzk3X3J0Y19zdXNwZW5k
LA0KIAkJCW10NjM5N19ydGNfcmVzdW1lKTsNCiANCi1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBtdDYzOTdfcnRjX29mX21hdGNoW10gPSB7DQotCXsgLmNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQ2MzIzLXJ0YyIsIH0sDQotCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2Mzk3
LXJ0YyIsIH0sDQotCXsgfQ0KLX07DQotTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbXQ2Mzk3X3J0
Y19vZl9tYXRjaCk7DQotDQogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXRrX3J0Y19k
cml2ZXIgPSB7DQogCS5kcml2ZXIgPSB7DQogCQkubmFtZSA9ICJtdDYzOTctcnRjIiwNCmRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvcnRjLmggYi9pbmNsdWRlL2xpbnV4L21m
ZC9tdDYzOTcvcnRjLmgNCmluZGV4IDdkZmI2M2IuLjg4MTBlNmYgMTAwNjQ0DQotLS0gYS9pbmNs
dWRlL2xpbnV4L21mZC9tdDYzOTcvcnRjLmgNCisrKyBiL2luY2x1ZGUvbGludXgvbWZkL210NjM5
Ny9ydGMuaA0KQEAgLTE4LDcgKzE4LDggQEANCiAjZGVmaW5lIFJUQ19CQlBVX0NCVVNZICAgICAg
ICAgQklUKDYpDQogI2RlZmluZSBSVENfQkJQVV9LRVkgICAgICAgICAgICAoMHg0MyA8PCA4KQ0K
IA0KLSNkZWZpbmUgUlRDX1dSVEdSICAgICAgICAgICAgICAweDAwM2MNCisjZGVmaW5lIFJUQ19X
UlRHUl9NVDYzNTggICAgICAgMHgzYQ0KKyNkZWZpbmUgUlRDX1dSVEdSX01UNjM5NyAgICAgICAw
eDNjDQogDQogI2RlZmluZSBSVENfSVJRX1NUQSAgICAgICAgICAgIDB4MDAwMg0KICNkZWZpbmUg
UlRDX0lSUV9TVEFfQUwgICAgICAgICBCSVQoMCkNCkBAIC02NSw2ICs2NiwxMCBAQA0KICNkZWZp
bmUgTVRLX1JUQ19QT0xMX0RFTEFZX1VTICAxMA0KICNkZWZpbmUgTVRLX1JUQ19QT0xMX1RJTUVP
VVQgICAoamlmZmllc190b191c2VjcyhIWikpDQogDQorc3RydWN0IG10a19ydGNfZGF0YSB7DQor
CXUzMgkJCXdydGdyOw0KK307DQorDQogc3RydWN0IG10NjM5N19ydGMgew0KIAlzdHJ1Y3QgZGV2
aWNlICAgICAgICAgICAqZGV2Ow0KIAlzdHJ1Y3QgcnRjX2RldmljZSAgICAgICAqcnRjX2RldjsN
CkBAIC03NCw2ICs3OSwxNSBAQCBzdHJ1Y3QgbXQ2Mzk3X3J0YyB7DQogCXN0cnVjdCByZWdtYXAg
ICAgICAgICAgICpyZWdtYXA7DQogCWludCAgICAgICAgICAgICAgICAgICAgIGlycTsNCiAJdTMy
ICAgICAgICAgICAgICAgICAgICAgYWRkcl9iYXNlOw0KKwljb25zdCBzdHJ1Y3QgbXRrX3J0Y19k
YXRhICpkYXRhOw0KK307DQorDQorc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfcnRjX2RhdGEgbXQ2
MzU4X3J0Y19kYXRhID0gew0KKwkud3J0Z3IgPSBSVENfV1JUR1JfTVQ2MzU4LA0KK307DQorDQor
c3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfcnRjX2RhdGEgbXQ2Mzk3X3J0Y19kYXRhID0gew0KKwku
d3J0Z3IgPSBSVENfV1JUR1JfTVQ2Mzk3LA0KIH07DQogDQogI2VuZGlmIC8qIF9MSU5VWF9NRkRf
TVQ2Mzk3X1JUQ19IXyAqLw0KLS0gDQoyLjYuNA0K

