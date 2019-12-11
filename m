Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3B011A7C5
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2019 10:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728765AbfLKJoJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 11 Dec 2019 04:44:09 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:56767 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728492AbfLKJoI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 11 Dec 2019 04:44:08 -0500
X-UUID: da12c714aa3c465e93d10b22c07ee807-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KCa4WuZtBEy7drSeISibY0DG6RoZ8edaCDVMIrX/w0s=;
        b=G5hzTREPLzNPm80yOutsbkT6XFxqA1qd5JAHOPs16NeNRq+QZtDbg80oXt4FnvStJiWFs/tqGgexLAwYx2M24jr1dDcVe31GanI857mZUCcOvEUMG3oiD/WM0wV35CbPndJp5XseP9FgOszU9zp7hK+1uqox01G1ji32fBY1cD0=;
X-UUID: da12c714aa3c465e93d10b22c07ee807-20191211
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 727656705; Wed, 11 Dec 2019 17:43:58 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 17:43:34 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Dec 2019 17:43:33 +0800
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
Subject: [PATCH v7 5/6] rtc: mt6397: fix alarm register overwrite
Date:   Wed, 11 Dec 2019 17:43:54 +0800
Message-ID: <1576057435-3561-6-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1576057435-3561-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1576057435-3561-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 3ECBA1CF6336FB346A8A28D880DBC03AE986D52D6E5457734021BC0E34E47F992000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

RnJvbTogUmFuIEJpIDxyYW4uYmlAbWVkaWF0ZWsuY29tPg0KDQpBbGFybSByZWdpc3RlcnMgaGln
aCBieXRlIHdhcyByZXNlcnZlZCBmb3Igb3RoZXIgZnVuY3Rpb25zLg0KVGhpcyBhZGQgbWFzayBp
biBhbGFybSByZWdpc3RlcnMgb3BlcmF0aW9uIGZ1bmN0aW9ucy4NClRoaXMgYWxzbyBmaXggZXJy
b3IgY29uZGl0aW9uIGluIGludGVycnVwdCBoYW5kbGVyLg0KDQpGaXhlczogZmMyOTc5MTE4ZjNm
ICgicnRjOiBtZWRpYXRlazogQWRkIE1UNjM5NyBSVEMgZHJpdmVyIikNCg0KU2lnbmVkLW9mZi1i
eTogUmFuIEJpIDxyYW4uYmlAbWVkaWF0ZWsuY29tPg0KU2lnbmVkLW9mZi1ieTogSHNpbi1Ic2l1
bmcgV2FuZyA8aHNpbi1oc2l1bmcud2FuZ0BtZWRpYXRlay5jb20+DQotLS0NCiBkcml2ZXJzL3J0
Yy9ydGMtbXQ2Mzk3LmMgICAgICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0NCiBpbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvcnRjLmggfCAgOCArKysrKysrKw0K
IDIgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtbXQ2Mzk3LmMgYi9kcml2ZXJzL3J0Yy9ydGMtbXQ2
Mzk3LmMNCmluZGV4IDUyNDlmYzkuLjkxMzVlMjEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3J0Yy9y
dGMtbXQ2Mzk3LmMNCisrKyBiL2RyaXZlcnMvcnRjL3J0Yy1tdDYzOTcuYw0KQEAgLTQ3LDcgKzQ3
LDcgQEAgc3RhdGljIGlycXJldHVybl90IG10a19ydGNfaXJxX2hhbmRsZXJfdGhyZWFkKGludCBp
cnEsIHZvaWQgKmRhdGEpDQogCQlpcnFlbiA9IGlycXN0YSAmIH5SVENfSVJRX0VOX0FMOw0KIAkJ
bXV0ZXhfbG9jaygmcnRjLT5sb2NrKTsNCiAJCWlmIChyZWdtYXBfd3JpdGUocnRjLT5yZWdtYXAs
IHJ0Yy0+YWRkcl9iYXNlICsgUlRDX0lSUV9FTiwNCi0JCQkJIGlycWVuKSA8IDApDQorCQkJCSBp
cnFlbikgPT0gMCkNCiAJCQltdGtfcnRjX3dyaXRlX3RyaWdnZXIocnRjKTsNCiAJCW11dGV4X3Vu
bG9jaygmcnRjLT5sb2NrKTsNCiANCkBAIC0xNjksMTIgKzE2OSwxMiBAQCBzdGF0aWMgaW50IG10
a19ydGNfcmVhZF9hbGFybShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBydGNfd2thbHJtICph
bG0pDQogCWFsbS0+cGVuZGluZyA9ICEhKHBkbjIgJiBSVENfUEROMl9QV1JPTl9BTEFSTSk7DQog
CW11dGV4X3VubG9jaygmcnRjLT5sb2NrKTsNCiANCi0JdG0tPnRtX3NlYyA9IGRhdGFbUlRDX09G
RlNFVF9TRUNdOw0KLQl0bS0+dG1fbWluID0gZGF0YVtSVENfT0ZGU0VUX01JTl07DQotCXRtLT50
bV9ob3VyID0gZGF0YVtSVENfT0ZGU0VUX0hPVVJdOw0KLQl0bS0+dG1fbWRheSA9IGRhdGFbUlRD
X09GRlNFVF9ET01dOw0KLQl0bS0+dG1fbW9uID0gZGF0YVtSVENfT0ZGU0VUX01USF07DQotCXRt
LT50bV95ZWFyID0gZGF0YVtSVENfT0ZGU0VUX1lFQVJdOw0KKwl0bS0+dG1fc2VjID0gZGF0YVtS
VENfT0ZGU0VUX1NFQ10gJiBSVENfQUxfU0VDX01BU0s7DQorCXRtLT50bV9taW4gPSBkYXRhW1JU
Q19PRkZTRVRfTUlOXSAmIFJUQ19BTF9NSU5fTUFTSzsNCisJdG0tPnRtX2hvdXIgPSBkYXRhW1JU
Q19PRkZTRVRfSE9VUl0gJiBSVENfQUxfSE9VX01BU0s7DQorCXRtLT50bV9tZGF5ID0gZGF0YVtS
VENfT0ZGU0VUX0RPTV0gJiBSVENfQUxfRE9NX01BU0s7DQorCXRtLT50bV9tb24gPSBkYXRhW1JU
Q19PRkZTRVRfTVRIXSAmIFJUQ19BTF9NVEhfTUFTSzsNCisJdG0tPnRtX3llYXIgPSBkYXRhW1JU
Q19PRkZTRVRfWUVBUl0gJiBSVENfQUxfWUVBX01BU0s7DQogDQogCXRtLT50bV95ZWFyICs9IFJU
Q19NSU5fWUVBUl9PRkZTRVQ7DQogCXRtLT50bV9tb24tLTsNCkBAIC0xOTUsMTQgKzE5NSwyNSBA
QCBzdGF0aWMgaW50IG10a19ydGNfc2V0X2FsYXJtKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0
IHJ0Y193a2Fscm0gKmFsbSkNCiAJdG0tPnRtX3llYXIgLT0gUlRDX01JTl9ZRUFSX09GRlNFVDsN
CiAJdG0tPnRtX21vbisrOw0KIA0KLQlkYXRhW1JUQ19PRkZTRVRfU0VDXSA9IHRtLT50bV9zZWM7
DQotCWRhdGFbUlRDX09GRlNFVF9NSU5dID0gdG0tPnRtX21pbjsNCi0JZGF0YVtSVENfT0ZGU0VU
X0hPVVJdID0gdG0tPnRtX2hvdXI7DQotCWRhdGFbUlRDX09GRlNFVF9ET01dID0gdG0tPnRtX21k
YXk7DQotCWRhdGFbUlRDX09GRlNFVF9NVEhdID0gdG0tPnRtX21vbjsNCi0JZGF0YVtSVENfT0ZG
U0VUX1lFQVJdID0gdG0tPnRtX3llYXI7DQotDQogCW11dGV4X2xvY2soJnJ0Yy0+bG9jayk7DQor
CXJldCA9IHJlZ21hcF9idWxrX3JlYWQocnRjLT5yZWdtYXAsIHJ0Yy0+YWRkcl9iYXNlICsgUlRD
X0FMX1NFQywNCisJCQkgICAgICAgZGF0YSwgUlRDX09GRlNFVF9DT1VOVCk7DQorCWlmIChyZXQg
PCAwKQ0KKwkJZ290byBleGl0Ow0KKw0KKwlkYXRhW1JUQ19PRkZTRVRfU0VDXSA9ICgoZGF0YVtS
VENfT0ZGU0VUX1NFQ10gJiB+KFJUQ19BTF9TRUNfTUFTSykpIHwNCisJCQkJKHRtLT50bV9zZWMg
JiBSVENfQUxfU0VDX01BU0spKTsNCisJZGF0YVtSVENfT0ZGU0VUX01JTl0gPSAoKGRhdGFbUlRD
X09GRlNFVF9NSU5dICYgfihSVENfQUxfTUlOX01BU0spKSB8DQorCQkJCSh0bS0+dG1fbWluICYg
UlRDX0FMX01JTl9NQVNLKSk7DQorCWRhdGFbUlRDX09GRlNFVF9IT1VSXSA9ICgoZGF0YVtSVENf
T0ZGU0VUX0hPVVJdICYgfihSVENfQUxfSE9VX01BU0spKSB8DQorCQkJCSh0bS0+dG1faG91ciAm
IFJUQ19BTF9IT1VfTUFTSykpOw0KKwlkYXRhW1JUQ19PRkZTRVRfRE9NXSA9ICgoZGF0YVtSVENf
T0ZGU0VUX0RPTV0gJiB+KFJUQ19BTF9ET01fTUFTSykpIHwNCisJCQkJKHRtLT50bV9tZGF5ICYg
UlRDX0FMX0RPTV9NQVNLKSk7DQorCWRhdGFbUlRDX09GRlNFVF9NVEhdID0gKChkYXRhW1JUQ19P
RkZTRVRfTVRIXSAmIH4oUlRDX0FMX01USF9NQVNLKSkgfA0KKwkJCQkodG0tPnRtX21vbiAmIFJU
Q19BTF9NVEhfTUFTSykpOw0KKwlkYXRhW1JUQ19PRkZTRVRfWUVBUl0gPSAoKGRhdGFbUlRDX09G
RlNFVF9ZRUFSXSAmIH4oUlRDX0FMX1lFQV9NQVNLKSkgfA0KKwkJCQkodG0tPnRtX3llYXIgJiBS
VENfQUxfWUVBX01BU0spKTsNCisNCiAJaWYgKGFsbS0+ZW5hYmxlZCkgew0KIAkJcmV0ID0gcmVn
bWFwX2J1bGtfd3JpdGUocnRjLT5yZWdtYXAsDQogCQkJCQlydGMtPmFkZHJfYmFzZSArIFJUQ19B
TF9TRUMsDQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L3J0Yy5oIGIvaW5j
bHVkZS9saW51eC9tZmQvbXQ2Mzk3L3J0Yy5oDQppbmRleCBmODRiOTE2Li43ZGZiNjNiIDEwMDY0
NA0KLS0tIGEvaW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L3J0Yy5oDQorKysgYi9pbmNsdWRlL2xp
bnV4L21mZC9tdDYzOTcvcnRjLmgNCkBAIC00Niw2ICs0NiwxNCBAQA0KIA0KICNkZWZpbmUgUlRD
X0FMX1NFQyAgICAgICAgICAgICAweDAwMTgNCiANCisjZGVmaW5lIFJUQ19BTF9TRUNfTUFTSyAg
ICAgICAgMHgwMDNmDQorI2RlZmluZSBSVENfQUxfTUlOX01BU0sgICAgICAgIDB4MDAzZg0KKyNk
ZWZpbmUgUlRDX0FMX0hPVV9NQVNLICAgICAgICAweDAwMWYNCisjZGVmaW5lIFJUQ19BTF9ET01f
TUFTSyAgICAgICAgMHgwMDFmDQorI2RlZmluZSBSVENfQUxfRE9XX01BU0sgICAgICAgIDB4MDAw
Nw0KKyNkZWZpbmUgUlRDX0FMX01USF9NQVNLICAgICAgICAweDAwMGYNCisjZGVmaW5lIFJUQ19B
TF9ZRUFfTUFTSyAgICAgICAgMHgwMDdmDQorDQogI2RlZmluZSBSVENfUEROMiAgICAgICAgICAg
ICAgIDB4MDAyZQ0KICNkZWZpbmUgUlRDX1BETjJfUFdST05fQUxBUk0gICBCSVQoNCkNCiANCi0t
IA0KMi42LjQNCg==

