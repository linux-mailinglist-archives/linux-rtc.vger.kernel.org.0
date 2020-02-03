Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A14015056C
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Feb 2020 12:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbgBCLk4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 3 Feb 2020 06:40:56 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:54147 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727999AbgBCLky (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 3 Feb 2020 06:40:54 -0500
X-UUID: 4cf3cf16e04a4cb7b29aced3b8fe21c7-20200203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uHq9fhw7QNVJhklhNpOI/KW9hh/uLCqY6eBhnwNF2yI=;
        b=odfOm9jP1R0A0Mfx93Jb9G20p1nQNn7wCBpYiD5/ks814DMxJuB4IcJVZs78g4ApNe1C24k0oOdui29096JMZSCIYdhnD7XWEexj2N58fslZDJCHv6Q+/N12GsBetROokam0Y3SBa+gTQD2SGC9MF5FbQR1gABjl88D3lMBq9AE=;
X-UUID: 4cf3cf16e04a4cb7b29aced3b8fe21c7-20200203
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2115809011; Mon, 03 Feb 2020 19:40:47 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 3 Feb 2020 19:40:01 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 3 Feb 2020 19:40:30 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Richard Fontana <rfontana@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Josef Friedl <josef.friedl@speed.at>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ran Bi <ran.bi@mediatek.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>
Subject: [PATCH v8 4/5] rtc: mt6397: Add support for the MediaTek MT6358 RTC
Date:   Mon, 3 Feb 2020 19:40:43 +0800
Message-ID: <1580730044-30501-5-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1580730044-30501-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1580730044-30501-1-git-send-email-hsin-hsiung.wang@mediatek.com>
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
c2l1bmcgV2FuZyA8aHNpbi1oc2l1bmcud2FuZ0BtZWRpYXRlay5jb20+DQotLS0NCiBkcml2ZXJz
L3J0Yy9ydGMtbXQ2Mzk3LmMgICAgICAgfCAyNSArKysrKysrKysrKysrKysrKy0tLS0tLS0tDQog
aW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L3J0Yy5oIHwgMTYgKysrKysrKysrKysrKysrLQ0KIDIg
ZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1tdDYzOTcuYyBiL2RyaXZlcnMvcnRjL3J0Yy1tdDYzOTcu
Yw0KaW5kZXggNTI0OWZjOS4uYTkwNzM1ZTEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3J0Yy9ydGMt
bXQ2Mzk3LmMNCisrKyBiL2RyaXZlcnMvcnRjL3J0Yy1tdDYzOTcuYw0KQEAgLTksMTggKzksMzEg
QEANCiAjaW5jbHVkZSA8bGludXgvbWZkL210NjM5Ny9jb3JlLmg+DQogI2luY2x1ZGUgPGxpbnV4
L21vZHVsZS5oPg0KICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPg0KKyNpbmNsdWRlIDxsaW51eC9v
Zl9kZXZpY2UuaD4NCiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQogI2luY2x1
ZGUgPGxpbnV4L3JlZ21hcC5oPg0KICNpbmNsdWRlIDxsaW51eC9ydGMuaD4NCiAjaW5jbHVkZSA8
bGludXgvbWZkL210NjM5Ny9ydGMuaD4NCiAjaW5jbHVkZSA8bGludXgvbW9kX2RldmljZXRhYmxl
Lmg+DQogDQorc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXQ2Mzk3X3J0Y19vZl9t
YXRjaFtdID0gew0KKwl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10NjMyMy1ydGMiLA0KKwkJ
LmRhdGEgPSAodm9pZCAqKSZtdDYzOTdfcnRjX2RhdGEsIH0sDQorCXsgLmNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ2MzU4LXJ0YyIsDQorCQkuZGF0YSA9ICh2b2lkICopJm10NjM1OF9ydGNfZGF0
YSwgfSwNCisJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDYzOTctcnRjIiwNCisJCS5kYXRh
ID0gKHZvaWQgKikmbXQ2Mzk3X3J0Y19kYXRhLCB9LA0KKwl7fQ0KK307DQorTU9EVUxFX0RFVklD
RV9UQUJMRShvZiwgbXQ2Mzk3X3J0Y19vZl9tYXRjaCk7DQorDQogc3RhdGljIGludCBtdGtfcnRj
X3dyaXRlX3RyaWdnZXIoc3RydWN0IG10NjM5N19ydGMgKnJ0YykNCiB7DQogCWludCByZXQ7DQog
CXUzMiBkYXRhOw0KIA0KLQlyZXQgPSByZWdtYXBfd3JpdGUocnRjLT5yZWdtYXAsIHJ0Yy0+YWRk
cl9iYXNlICsgUlRDX1dSVEdSLCAxKTsNCisJcmV0ID0gcmVnbWFwX3dyaXRlKHJ0Yy0+cmVnbWFw
LA0KKwkJCSAgIHJ0Yy0+YWRkcl9iYXNlICsgcnRjLT5kYXRhLT53cnRnciwgMSk7DQogCWlmIChy
ZXQgPCAwKQ0KIAkJcmV0dXJuIHJldDsNCiANCkBAIC0yNTgsNiArMjcxLDkgQEAgc3RhdGljIGlu
dCBtdGtfcnRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQogCXJlcyA9IHBs
YXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQogCXJ0Yy0+YWRk
cl9iYXNlID0gcmVzLT5zdGFydDsNCiANCisJcnRjLT5kYXRhID0gKHN0cnVjdCBtdGtfcnRjX2Rh
dGEgKikNCisJCQlvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYtPmRldik7DQorDQogCXJ0
Yy0+aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsNCiAJaWYgKHJ0Yy0+aXJxIDwgMCkN
CiAJCXJldHVybiBydGMtPmlycTsNCkBAIC0zMjIsMTMgKzMzOCw2IEBAIHN0YXRpYyBpbnQgbXQ2
Mzk3X3J0Y19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KIHN0YXRpYyBTSU1QTEVfREVWX1BN
X09QUyhtdDYzOTdfcG1fb3BzLCBtdDYzOTdfcnRjX3N1c3BlbmQsDQogCQkJbXQ2Mzk3X3J0Y19y
ZXN1bWUpOw0KIA0KLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10NjM5N19ydGNf
b2ZfbWF0Y2hbXSA9IHsNCi0JeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDYzMjMtcnRjIiwg
fSwNCi0JeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDYzOTctcnRjIiwgfSwNCi0JeyB9DQot
fTsNCi1NT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtdDYzOTdfcnRjX29mX21hdGNoKTsNCi0NCiBz
dGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtdGtfcnRjX2RyaXZlciA9IHsNCiAJLmRyaXZl
ciA9IHsNCiAJCS5uYW1lID0gIm10NjM5Ny1ydGMiLA0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvbWZkL210NjM5Ny9ydGMuaCBiL2luY2x1ZGUvbGludXgvbWZkL210NjM5Ny9ydGMuaA0KaW5k
ZXggZjg0YjkxNi4uZmZmZTM0YSAxMDA2NDQNCi0tLSBhL2luY2x1ZGUvbGludXgvbWZkL210NjM5
Ny9ydGMuaA0KKysrIGIvaW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L3J0Yy5oDQpAQCAtMTgsNyAr
MTgsOCBAQA0KICNkZWZpbmUgUlRDX0JCUFVfQ0JVU1kgICAgICAgICBCSVQoNikNCiAjZGVmaW5l
IFJUQ19CQlBVX0tFWSAgICAgICAgICAgICgweDQzIDw8IDgpDQogDQotI2RlZmluZSBSVENfV1JU
R1IgICAgICAgICAgICAgIDB4MDAzYw0KKyNkZWZpbmUgUlRDX1dSVEdSX01UNjM1OCAgICAgICAw
eDNhDQorI2RlZmluZSBSVENfV1JUR1JfTVQ2Mzk3ICAgICAgIDB4M2MNCiANCiAjZGVmaW5lIFJU
Q19JUlFfU1RBICAgICAgICAgICAgMHgwMDAyDQogI2RlZmluZSBSVENfSVJRX1NUQV9BTCAgICAg
ICAgIEJJVCgwKQ0KQEAgLTU3LDYgKzU4LDEwIEBADQogI2RlZmluZSBNVEtfUlRDX1BPTExfREVM
QVlfVVMgIDEwDQogI2RlZmluZSBNVEtfUlRDX1BPTExfVElNRU9VVCAgIChqaWZmaWVzX3RvX3Vz
ZWNzKEhaKSkNCiANCitzdHJ1Y3QgbXRrX3J0Y19kYXRhIHsNCisJdTMyCQkJd3J0Z3I7DQorfTsN
CisNCiBzdHJ1Y3QgbXQ2Mzk3X3J0YyB7DQogCXN0cnVjdCBkZXZpY2UgICAgICAgICAgICpkZXY7
DQogCXN0cnVjdCBydGNfZGV2aWNlICAgICAgICpydGNfZGV2Ow0KQEAgLTY2LDYgKzcxLDE1IEBA
IHN0cnVjdCBtdDYzOTdfcnRjIHsNCiAJc3RydWN0IHJlZ21hcCAgICAgICAgICAgKnJlZ21hcDsN
CiAJaW50ICAgICAgICAgICAgICAgICAgICAgaXJxOw0KIAl1MzIgICAgICAgICAgICAgICAgICAg
ICBhZGRyX2Jhc2U7DQorCWNvbnN0IHN0cnVjdCBtdGtfcnRjX2RhdGEgKmRhdGE7DQorfTsNCisN
CitzdGF0aWMgY29uc3Qgc3RydWN0IG10a19ydGNfZGF0YSBtdDYzNThfcnRjX2RhdGEgPSB7DQor
CS53cnRnciA9IFJUQ19XUlRHUl9NVDYzNTgsDQorfTsNCisNCitzdGF0aWMgY29uc3Qgc3RydWN0
IG10a19ydGNfZGF0YSBtdDYzOTdfcnRjX2RhdGEgPSB7DQorCS53cnRnciA9IFJUQ19XUlRHUl9N
VDYzOTcsDQogfTsNCiANCiAjZW5kaWYgLyogX0xJTlVYX01GRF9NVDYzOTdfUlRDX0hfICovDQot
LSANCjIuNi40DQo=

