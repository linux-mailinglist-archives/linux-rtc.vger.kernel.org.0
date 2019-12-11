Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFA711A7D0
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2019 10:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbfLKJoL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 11 Dec 2019 04:44:11 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:32529 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728610AbfLKJoK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 11 Dec 2019 04:44:10 -0500
X-UUID: 6d8190112bd74721b8cb328f0acd6182-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vQNyyDLAOhUx/esjjJKKmBtt5AHvW77SqweS/Ym/Fh8=;
        b=VLSPZqsDKnTVnhmvaZfHOHkOCEu/2zoFJunK3PmaYbVpTGDgVn74WipPf3ycTqelTLF0xkXmuiOp+PB8BHFtu8wxGNZnQzpbacD7Og6LZqFMoM4JKQQUA7bJZ/RbUxWzcEqwOk2w2c0rcSzvp75FV8wtmf5XAilU0lObGf98O3o=;
X-UUID: 6d8190112bd74721b8cb328f0acd6182-20191211
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1621018765; Wed, 11 Dec 2019 17:43:58 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 17:43:33 +0800
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
Subject: [PATCH v7 1/6] mfd: mt6397: modify suspend/resume behavior
Date:   Wed, 11 Dec 2019 17:43:50 +0800
Message-ID: <1576057435-3561-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1576057435-3561-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1576057435-3561-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 3C210F3274EF605D8A096194314ED7147F601C6527E113954096689DCD8CF7542000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

U29tZSBwbWljcyBkb24ndCBuZWVkIGJhY2t1cCBpbnRlcnJ1cHQgc2V0dGluZ3MsIHNvIHdlIGNo
YW5nZSB0byB1c2UNCnBtIG5vdGlmaWVyIGZvciB0aGUgcG1pY3Mgd2hpY2ggYXJlIG5lY2Vzc2Fy
eSB0byBzdG9yZSBzZXR0aW5ncy4NCg0KU2lnbmVkLW9mZi1ieTogSHNpbi1Ic2l1bmcgV2FuZyA8
aHNpbi1oc2l1bmcud2FuZ0BtZWRpYXRlay5jb20+DQotLS0NCiBkcml2ZXJzL21mZC9tdDYzOTct
Y29yZS5jICAgICAgIHwgMzAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQogZHJpdmVy
cy9tZmQvbXQ2Mzk3LWlycS5jICAgICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KIGluY2x1ZGUvbGludXgvbWZkL210NjM5Ny9jb3JlLmggfCAgMiArKw0KIDMgZmls
ZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL21mZC9tdDYzOTctY29yZS5jIGIvZHJpdmVycy9tZmQvbXQ2Mzk3LWNvcmUu
Yw0KaW5kZXggMDQzN2M4NS4uZDJlNzBkOCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWZkL210NjM5
Ny1jb3JlLmMNCisrKyBiL2RyaXZlcnMvbWZkL210NjM5Ny1jb3JlLmMNCkBAIC0xMDAsMzUgKzEw
MCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWZkX2NlbGwgbXQ2Mzk3X2RldnNbXSA9IHsNCiAJ
fQ0KIH07DQogDQotI2lmZGVmIENPTkZJR19QTV9TTEVFUA0KLXN0YXRpYyBpbnQgbXQ2Mzk3X2ly
cV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCi17DQotCXN0cnVjdCBtdDYzOTdfY2hpcCAq
Y2hpcCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KLQ0KLQlyZWdtYXBfd3JpdGUoY2hpcC0+cmVn
bWFwLCBjaGlwLT5pbnRfY29uWzBdLCBjaGlwLT53YWtlX21hc2tbMF0pOw0KLQlyZWdtYXBfd3Jp
dGUoY2hpcC0+cmVnbWFwLCBjaGlwLT5pbnRfY29uWzFdLCBjaGlwLT53YWtlX21hc2tbMV0pOw0K
LQ0KLQllbmFibGVfaXJxX3dha2UoY2hpcC0+aXJxKTsNCi0NCi0JcmV0dXJuIDA7DQotfQ0KLQ0K
LXN0YXRpYyBpbnQgbXQ2Mzk3X2lycV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KLXsNCi0J
c3RydWN0IG10NjM5N19jaGlwICpjaGlwID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQotDQotCXJl
Z21hcF93cml0ZShjaGlwLT5yZWdtYXAsIGNoaXAtPmludF9jb25bMF0sIGNoaXAtPmlycV9tYXNr
c19jdXJbMF0pOw0KLQlyZWdtYXBfd3JpdGUoY2hpcC0+cmVnbWFwLCBjaGlwLT5pbnRfY29uWzFd
LCBjaGlwLT5pcnFfbWFza3NfY3VyWzFdKTsNCi0NCi0JZGlzYWJsZV9pcnFfd2FrZShjaGlwLT5p
cnEpOw0KLQ0KLQlyZXR1cm4gMDsNCi19DQotI2VuZGlmDQotDQotc3RhdGljIFNJTVBMRV9ERVZf
UE1fT1BTKG10NjM5N19wbV9vcHMsIG10NjM5N19pcnFfc3VzcGVuZCwNCi0JCQltdDYzOTdfaXJx
X3Jlc3VtZSk7DQotDQogc3RydWN0IGNoaXBfZGF0YSB7DQogCXUzMiBjaWRfYWRkcjsNCiAJdTMy
IGNpZF9zaGlmdDsNCkBAIC0yMzgsNyArMjA5LDYgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9k
cml2ZXIgbXQ2Mzk3X2RyaXZlciA9IHsNCiAJLmRyaXZlciA9IHsNCiAJCS5uYW1lID0gIm10NjM5
NyIsDQogCQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIobXQ2Mzk3X29mX21hdGNoKSwN
Ci0JCS5wbSA9ICZtdDYzOTdfcG1fb3BzLA0KIAl9LA0KIAkuaWRfdGFibGUgPSBtdDYzOTdfaWQs
DQogfTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9tdDYzOTctaXJxLmMgYi9kcml2ZXJzL21m
ZC9tdDYzOTctaXJxLmMNCmluZGV4IGIyZDNjZTEuLjY2OWU5M2QgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL21mZC9tdDYzOTctaXJxLmMNCisrKyBiL2RyaXZlcnMvbWZkL210NjM5Ny1pcnEuYw0KQEAg
LTksNiArOSw3IEBADQogI2luY2x1ZGUgPGxpbnV4L29mX2lycS5oPg0KICNpbmNsdWRlIDxsaW51
eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCiAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+DQorI2luY2x1
ZGUgPGxpbnV4L3N1c3BlbmQuaD4NCiAjaW5jbHVkZSA8bGludXgvbWZkL210NjMyMy9jb3JlLmg+
DQogI2luY2x1ZGUgPGxpbnV4L21mZC9tdDYzMjMvcmVnaXN0ZXJzLmg+DQogI2luY2x1ZGUgPGxp
bnV4L21mZC9tdDYzOTcvY29yZS5oPg0KQEAgLTEyOCw2ICsxMjksMzYgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBpcnFfZG9tYWluX29wcyBtdDYzOTdfaXJxX2RvbWFpbl9vcHMgPSB7DQogCS5tYXAg
PSBtdDYzOTdfaXJxX2RvbWFpbl9tYXAsDQogfTsNCiANCitzdGF0aWMgaW50IG10NjM5N19pcnFf
cG1fbm90aWZpZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpub3RpZmllciwNCisJCQkJICB1bnNp
Z25lZCBsb25nIHBtX2V2ZW50LCB2b2lkICp1bnVzZWQpDQorew0KKwlzdHJ1Y3QgbXQ2Mzk3X2No
aXAgKmNoaXAgPQ0KKwkJY29udGFpbmVyX29mKG5vdGlmaWVyLCBzdHJ1Y3QgbXQ2Mzk3X2NoaXAs
IHBtX25iKTsNCisNCisJc3dpdGNoIChwbV9ldmVudCkgew0KKwljYXNlIFBNX1NVU1BFTkRfUFJF
UEFSRToNCisJCXJlZ21hcF93cml0ZShjaGlwLT5yZWdtYXAsDQorCQkJICAgICBjaGlwLT5pbnRf
Y29uWzBdLCBjaGlwLT53YWtlX21hc2tbMF0pOw0KKwkJcmVnbWFwX3dyaXRlKGNoaXAtPnJlZ21h
cCwNCisJCQkgICAgIGNoaXAtPmludF9jb25bMV0sIGNoaXAtPndha2VfbWFza1sxXSk7DQorCQll
bmFibGVfaXJxX3dha2UoY2hpcC0+aXJxKTsNCisJCWJyZWFrOw0KKw0KKwljYXNlIFBNX1BPU1Rf
U1VTUEVORDoNCisJCXJlZ21hcF93cml0ZShjaGlwLT5yZWdtYXAsDQorCQkJICAgICBjaGlwLT5p
bnRfY29uWzBdLCBjaGlwLT5pcnFfbWFza3NfY3VyWzBdKTsNCisJCXJlZ21hcF93cml0ZShjaGlw
LT5yZWdtYXAsDQorCQkJICAgICBjaGlwLT5pbnRfY29uWzFdLCBjaGlwLT5pcnFfbWFza3NfY3Vy
WzFdKTsNCisJCWRpc2FibGVfaXJxX3dha2UoY2hpcC0+aXJxKTsNCisJCWJyZWFrOw0KKw0KKwlk
ZWZhdWx0Og0KKwkJYnJlYWs7DQorCX0NCisNCisJcmV0dXJuIE5PVElGWV9ET05FOw0KK30NCisN
CiBpbnQgbXQ2Mzk3X2lycV9pbml0KHN0cnVjdCBtdDYzOTdfY2hpcCAqY2hpcCkNCiB7DQogCWlu
dCByZXQ7DQpAQCAtMTU5LDYgKzE5MCw3IEBAIGludCBtdDYzOTdfaXJxX2luaXQoc3RydWN0IG10
NjM5N19jaGlwICpjaGlwKQ0KIAlyZWdtYXBfd3JpdGUoY2hpcC0+cmVnbWFwLCBjaGlwLT5pbnRf
Y29uWzBdLCAweDApOw0KIAlyZWdtYXBfd3JpdGUoY2hpcC0+cmVnbWFwLCBjaGlwLT5pbnRfY29u
WzFdLCAweDApOw0KIA0KKwljaGlwLT5wbV9uYi5ub3RpZmllcl9jYWxsID0gbXQ2Mzk3X2lycV9w
bV9ub3RpZmllcjsNCiAJY2hpcC0+aXJxX2RvbWFpbiA9IGlycV9kb21haW5fYWRkX2xpbmVhcihj
aGlwLT5kZXYtPm9mX25vZGUsDQogCQkJCQkJIE1UNjM5N19JUlFfTlIsDQogCQkJCQkJICZtdDYz
OTdfaXJxX2RvbWFpbl9vcHMsDQpAQCAtMTc3LDUgKzIwOSw2IEBAIGludCBtdDYzOTdfaXJxX2lu
aXQoc3RydWN0IG10NjM5N19jaGlwICpjaGlwKQ0KIAkJcmV0dXJuIHJldDsNCiAJfQ0KIA0KKwly
ZWdpc3Rlcl9wbV9ub3RpZmllcigmY2hpcC0+cG1fbmIpOw0KIAlyZXR1cm4gMDsNCiB9DQpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L2NvcmUuaCBiL2luY2x1ZGUvbGludXgv
bWZkL210NjM5Ny9jb3JlLmgNCmluZGV4IGZjODhkMzEuLmI4MWQzMzMgMTAwNjQ0DQotLS0gYS9p
bmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvY29yZS5oDQorKysgYi9pbmNsdWRlL2xpbnV4L21mZC9t
dDYzOTcvY29yZS5oDQpAQCAtOCw2ICs4LDcgQEANCiAjZGVmaW5lIF9fTUZEX01UNjM5N19DT1JF
X0hfXw0KIA0KICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPg0KKyNpbmNsdWRlIDxsaW51eC9ub3Rp
Zmllci5oPg0KIA0KIGVudW0gY2hpcF9pZCB7DQogCU1UNjMyM19DSElQX0lEID0gMHgyMywNCkBA
IC01NCw2ICs1NSw3IEBAIGVudW0gbXQ2Mzk3X2lycV9udW1iZXJzIHsNCiBzdHJ1Y3QgbXQ2Mzk3
X2NoaXAgew0KIAlzdHJ1Y3QgZGV2aWNlICpkZXY7DQogCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsN
CisJc3RydWN0IG5vdGlmaWVyX2Jsb2NrIHBtX25iOw0KIAlpbnQgaXJxOw0KIAlzdHJ1Y3QgaXJx
X2RvbWFpbiAqaXJxX2RvbWFpbjsNCiAJc3RydWN0IG11dGV4IGlycWxvY2s7DQotLSANCjIuNi40
DQo=

