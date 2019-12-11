Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 990AF11A7BF
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2019 10:44:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728494AbfLKJoE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 11 Dec 2019 04:44:04 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:24958 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728492AbfLKJoD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 11 Dec 2019 04:44:03 -0500
X-UUID: 51e171cc18ad41168840dcf356d416d1-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Dm3mlfxD96MxnkXGJUHjOsMb6SebZYhQjiXuyxfYDOs=;
        b=ff63CxZHTdDQhidjt51kkhecXPHpYK3K+OKzpv83ES4LxyUQGLKBvS+BOb+oR65NyTmvvUBO/LjAA6EIlnY8GV27P7IOyNfPCXa2D/EwcsxSzoWJImPaspZv6UPPsncTO3vOcF+ARgL9i817FcKWesBfNLLkeU3w+0L6vJ/WW0Y=;
X-UUID: 51e171cc18ad41168840dcf356d416d1-20191211
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1264764905; Wed, 11 Dec 2019 17:43:58 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 17:43:42 +0800
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
Subject: [PATCH v7 0/6] Add Support for MediaTek PMIC MT6358
Date:   Wed, 11 Dec 2019 17:43:49 +0800
Message-ID: <1576057435-3561-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

VGhpcyBwYXRjaHNldCBpbmNsdWRpbmcgbW9kaWZ5aW5nIHN1c3BlbmQvcmVzdW1lIGJlaGF2aW9y
IGFkZCBzdXBwb3J0IHRvIE1UNjM1OCBQTUlDLg0KTVQ2MzU4IGlzIHRoZSBwcmltYXJ5IFBNSUMg
Zm9yIE1UODE4MyBwbGF0Zm9ybS4NCg0KY2hhbmdlcyBzaW5jZSB2NjoNCi0gcmViYXNlIHNlcmll
cyBvbiA1LjUtcmMxDQoNCkhzaW4tSHNpdW5nIFdhbmcgKDQpOg0KICBtZmQ6IG10NjM5NzogbW9k
aWZ5IHN1c3BlbmQvcmVzdW1lIGJlaGF2aW9yDQogIGR0LWJpbmRpbmdzOiBtZmQ6IEFkZCBjb21w
YXRpYmxlIGZvciB0aGUgTWVkaWFUZWsgTVQ2MzU4IFBNSUMNCiAgbWZkOiBBZGQgc3VwcG9ydCBm
b3IgdGhlIE1lZGlhVGVrIE1UNjM1OCBQTUlDDQogIGFybTY0OiBkdHM6IG10NjM1ODogYWRkIFBN
SUMgTVQ2MzU4IHJlbGF0ZWQgbm9kZXMNCg0KUmFuIEJpICgyKToNCiAgcnRjOiBtdDYzOTc6IGZp
eCBhbGFybSByZWdpc3RlciBvdmVyd3JpdGUNCiAgcnRjOiBBZGQgc3VwcG9ydCBmb3IgdGhlIE1l
ZGlhVGVrIE1UNjM1OCBSVEMNCg0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZmQvbXQ2Mzk3LnR4dCB8ICAxNCArLQ0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ2
MzU4LmR0c2kgICAgICAgICB8IDM2MSArKysrKysrKysrKysrKysrKysrKysrKw0KIGFyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLWV2Yi5kdHMgICAgICB8ICAgMSArDQogZHJpdmVy
cy9tZmQvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstDQogZHJp
dmVycy9tZmQvbXQ2MzU4LWlycS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjI0ICsrKysr
KysrKysrKysrDQogZHJpdmVycy9tZmQvbXQ2Mzk3LWNvcmUuYyAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDc1ICsrKy0tDQogZHJpdmVycy9tZmQvbXQ2Mzk3LWlycS5jICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDMzICsrKw0KIGRyaXZlcnMvcnRjL3J0Yy1tdDYzOTcuYyAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICA2MyArKy0tDQogaW5jbHVkZS9saW51eC9tZmQvbXQ2MzU4L2NvcmUu
aCAgICAgICAgICAgICAgICAgIHwgMTU4ICsrKysrKysrKysNCiBpbmNsdWRlL2xpbnV4L21mZC9t
dDYzNTgvcmVnaXN0ZXJzLmggICAgICAgICAgICAgfCAyODIgKysrKysrKysrKysrKysrKysrDQog
aW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L2NvcmUuaCAgICAgICAgICAgICAgICAgIHwgICA1ICsN
CiBpbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvcnRjLmggICAgICAgICAgICAgICAgICAgfCAgMjQg
Ky0NCiAxMiBmaWxlcyBjaGFuZ2VkLCAxMTgzIGluc2VydGlvbnMoKyksIDU5IGRlbGV0aW9ucygt
KQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210NjM1
OC5kdHNpDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWZkL210NjM1OC1pcnEuYw0KIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNTgvY29yZS5oDQogY3JlYXRl
IG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWZkL210NjM1OC9yZWdpc3RlcnMuaA0KDQotLSAN
CjIuNi40DQo=

