Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDB311511E
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2019 14:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbfLFNio (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Dec 2019 08:38:44 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:13867 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726278AbfLFNin (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Dec 2019 08:38:43 -0500
X-UUID: 94cdfed95c71419bb6b46d5c36f43dab-20191206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GVZ0B2sMB/nWdDIRaI/U+UFt5vMwysqN11cKqP9zBWM=;
        b=Zn+od972AOnezD7ReTL/oR5VVEkvFiKKt0OG8i4k+ULSL3SCCTDF+S3vS8VTzA67f6swI4rmou4Gf9Ar6rDhx2TgAbzbBvWEruAlBwVooIZD6uGkuB8u/+8a7N1mqI+fADNyBh4rzZxfib5vI+vCccf6DHniS+DmUzbfwTzANAM=;
X-UUID: 94cdfed95c71419bb6b46d5c36f43dab-20191206
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 582020955; Fri, 06 Dec 2019 21:38:39 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Dec 2019 21:38:21 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 6 Dec 2019 21:38:00 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Ran Bi <ran.bi@mediatek.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: [PATCH v6 5/6] rtc: mt6397: fix alarm register overwrite
Date:   Fri, 6 Dec 2019 21:33:02 +0800
Message-ID: <1575639183-17606-6-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1575639183-17606-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1575639183-17606-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Yy9ydGMtbXQ2Mzk3LmMgfCA0NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlv
bnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1tdDYzOTcuYyBiL2RyaXZlcnMv
cnRjL3J0Yy1tdDYzOTcuYw0KaW5kZXggNzA0MjI5ZS4uYjIxNmJkYyAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvcnRjL3J0Yy1tdDYzOTcuYw0KKysrIGIvZHJpdmVycy9ydGMvcnRjLW10NjM5Ny5jDQpA
QCAtNDcsNiArNDcsMTQgQEANCiANCiAjZGVmaW5lIFJUQ19BTF9TRUMJCTB4MDAxOA0KIA0KKyNk
ZWZpbmUgUlRDX0FMX1NFQ19NQVNLCQkweDAwM2YNCisjZGVmaW5lIFJUQ19BTF9NSU5fTUFTSwkJ
MHgwMDNmDQorI2RlZmluZSBSVENfQUxfSE9VX01BU0sJCTB4MDAxZg0KKyNkZWZpbmUgUlRDX0FM
X0RPTV9NQVNLCQkweDAwMWYNCisjZGVmaW5lIFJUQ19BTF9ET1dfTUFTSwkJMHgwMDA3DQorI2Rl
ZmluZSBSVENfQUxfTVRIX01BU0sJCTB4MDAwZg0KKyNkZWZpbmUgUlRDX0FMX1lFQV9NQVNLCQkw
eDAwN2YNCisNCiAjZGVmaW5lIFJUQ19QRE4yCQkweDAwMmUNCiAjZGVmaW5lIFJUQ19QRE4yX1BX
Uk9OX0FMQVJNCUJJVCg0KQ0KIA0KQEAgLTEwMyw3ICsxMTEsNyBAQCBzdGF0aWMgaXJxcmV0dXJu
X3QgbXRrX3J0Y19pcnFfaGFuZGxlcl90aHJlYWQoaW50IGlycSwgdm9pZCAqZGF0YSkNCiAJCWly
cWVuID0gaXJxc3RhICYgflJUQ19JUlFfRU5fQUw7DQogCQltdXRleF9sb2NrKCZydGMtPmxvY2sp
Ow0KIAkJaWYgKHJlZ21hcF93cml0ZShydGMtPnJlZ21hcCwgcnRjLT5hZGRyX2Jhc2UgKyBSVENf
SVJRX0VOLA0KLQkJCQkgaXJxZW4pIDwgMCkNCisJCQkJIGlycWVuKSA9PSAwKQ0KIAkJCW10a19y
dGNfd3JpdGVfdHJpZ2dlcihydGMpOw0KIAkJbXV0ZXhfdW5sb2NrKCZydGMtPmxvY2spOw0KIA0K
QEAgLTIyNSwxMiArMjMzLDEyIEBAIHN0YXRpYyBpbnQgbXRrX3J0Y19yZWFkX2FsYXJtKHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IHJ0Y193a2Fscm0gKmFsbSkNCiAJYWxtLT5wZW5kaW5nID0g
ISEocGRuMiAmIFJUQ19QRE4yX1BXUk9OX0FMQVJNKTsNCiAJbXV0ZXhfdW5sb2NrKCZydGMtPmxv
Y2spOw0KIA0KLQl0bS0+dG1fc2VjID0gZGF0YVtSVENfT0ZGU0VUX1NFQ107DQotCXRtLT50bV9t
aW4gPSBkYXRhW1JUQ19PRkZTRVRfTUlOXTsNCi0JdG0tPnRtX2hvdXIgPSBkYXRhW1JUQ19PRkZT
RVRfSE9VUl07DQotCXRtLT50bV9tZGF5ID0gZGF0YVtSVENfT0ZGU0VUX0RPTV07DQotCXRtLT50
bV9tb24gPSBkYXRhW1JUQ19PRkZTRVRfTVRIXTsNCi0JdG0tPnRtX3llYXIgPSBkYXRhW1JUQ19P
RkZTRVRfWUVBUl07DQorCXRtLT50bV9zZWMgPSBkYXRhW1JUQ19PRkZTRVRfU0VDXSAmIFJUQ19B
TF9TRUNfTUFTSzsNCisJdG0tPnRtX21pbiA9IGRhdGFbUlRDX09GRlNFVF9NSU5dICYgUlRDX0FM
X01JTl9NQVNLOw0KKwl0bS0+dG1faG91ciA9IGRhdGFbUlRDX09GRlNFVF9IT1VSXSAmIFJUQ19B
TF9IT1VfTUFTSzsNCisJdG0tPnRtX21kYXkgPSBkYXRhW1JUQ19PRkZTRVRfRE9NXSAmIFJUQ19B
TF9ET01fTUFTSzsNCisJdG0tPnRtX21vbiA9IGRhdGFbUlRDX09GRlNFVF9NVEhdICYgUlRDX0FM
X01USF9NQVNLOw0KKwl0bS0+dG1feWVhciA9IGRhdGFbUlRDX09GRlNFVF9ZRUFSXSAmIFJUQ19B
TF9ZRUFfTUFTSzsNCiANCiAJdG0tPnRtX3llYXIgKz0gUlRDX01JTl9ZRUFSX09GRlNFVDsNCiAJ
dG0tPnRtX21vbi0tOw0KQEAgLTI1MSwxNCArMjU5LDI1IEBAIHN0YXRpYyBpbnQgbXRrX3J0Y19z
ZXRfYWxhcm0oc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcnRjX3drYWxybSAqYWxtKQ0KIAl0
bS0+dG1feWVhciAtPSBSVENfTUlOX1lFQVJfT0ZGU0VUOw0KIAl0bS0+dG1fbW9uKys7DQogDQot
CWRhdGFbUlRDX09GRlNFVF9TRUNdID0gdG0tPnRtX3NlYzsNCi0JZGF0YVtSVENfT0ZGU0VUX01J
Tl0gPSB0bS0+dG1fbWluOw0KLQlkYXRhW1JUQ19PRkZTRVRfSE9VUl0gPSB0bS0+dG1faG91cjsN
Ci0JZGF0YVtSVENfT0ZGU0VUX0RPTV0gPSB0bS0+dG1fbWRheTsNCi0JZGF0YVtSVENfT0ZGU0VU
X01USF0gPSB0bS0+dG1fbW9uOw0KLQlkYXRhW1JUQ19PRkZTRVRfWUVBUl0gPSB0bS0+dG1feWVh
cjsNCi0NCiAJbXV0ZXhfbG9jaygmcnRjLT5sb2NrKTsNCisJcmV0ID0gcmVnbWFwX2J1bGtfcmVh
ZChydGMtPnJlZ21hcCwgcnRjLT5hZGRyX2Jhc2UgKyBSVENfQUxfU0VDLA0KKwkJCSAgICAgICBk
YXRhLCBSVENfT0ZGU0VUX0NPVU5UKTsNCisJaWYgKHJldCA8IDApDQorCQlnb3RvIGV4aXQ7DQor
DQorCWRhdGFbUlRDX09GRlNFVF9TRUNdID0gKChkYXRhW1JUQ19PRkZTRVRfU0VDXSAmIH4oUlRD
X0FMX1NFQ19NQVNLKSkgfA0KKwkJCQkodG0tPnRtX3NlYyAmIFJUQ19BTF9TRUNfTUFTSykpOw0K
KwlkYXRhW1JUQ19PRkZTRVRfTUlOXSA9ICgoZGF0YVtSVENfT0ZGU0VUX01JTl0gJiB+KFJUQ19B
TF9NSU5fTUFTSykpIHwNCisJCQkJKHRtLT50bV9taW4gJiBSVENfQUxfTUlOX01BU0spKTsNCisJ
ZGF0YVtSVENfT0ZGU0VUX0hPVVJdID0gKChkYXRhW1JUQ19PRkZTRVRfSE9VUl0gJiB+KFJUQ19B
TF9IT1VfTUFTSykpIHwNCisJCQkJKHRtLT50bV9ob3VyICYgUlRDX0FMX0hPVV9NQVNLKSk7DQor
CWRhdGFbUlRDX09GRlNFVF9ET01dID0gKChkYXRhW1JUQ19PRkZTRVRfRE9NXSAmIH4oUlRDX0FM
X0RPTV9NQVNLKSkgfA0KKwkJCQkodG0tPnRtX21kYXkgJiBSVENfQUxfRE9NX01BU0spKTsNCisJ
ZGF0YVtSVENfT0ZGU0VUX01USF0gPSAoKGRhdGFbUlRDX09GRlNFVF9NVEhdICYgfihSVENfQUxf
TVRIX01BU0spKSB8DQorCQkJCSh0bS0+dG1fbW9uICYgUlRDX0FMX01USF9NQVNLKSk7DQorCWRh
dGFbUlRDX09GRlNFVF9ZRUFSXSA9ICgoZGF0YVtSVENfT0ZGU0VUX1lFQVJdICYgfihSVENfQUxf
WUVBX01BU0spKSB8DQorCQkJCSh0bS0+dG1feWVhciAmIFJUQ19BTF9ZRUFfTUFTSykpOw0KKw0K
IAlpZiAoYWxtLT5lbmFibGVkKSB7DQogCQlyZXQgPSByZWdtYXBfYnVsa193cml0ZShydGMtPnJl
Z21hcCwNCiAJCQkJCXJ0Yy0+YWRkcl9iYXNlICsgUlRDX0FMX1NFQywNCi0tIA0KMi42LjQNCg==

