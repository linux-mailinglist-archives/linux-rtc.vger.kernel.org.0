Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67264115124
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2019 14:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfLFNim (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Dec 2019 08:38:42 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:13867 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726171AbfLFNil (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Dec 2019 08:38:41 -0500
X-UUID: 6c4c820fee6649d695c97504d2b3bbeb-20191206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=l3AyP0772iGyqIMwjjQJ92YVDpBT4cXNYlHsqaJrWq8=;
        b=Ent4iCvIjwjY9RaJ8Ny+plgdS/o80t8O7WpuiU4VvqN0+qVHSWe89TJma/NI0q2dcXWCr0lozkYwjoRK9Q4QJwzxKwyBFdKqzY25salxpc05KRnDKR59trdbRWGK9fpU3cnjwAsg2Aprm6AvmbhizemfE8denxHromzZv3AV0oc=;
X-UUID: 6c4c820fee6649d695c97504d2b3bbeb-20191206
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 405452737; Fri, 06 Dec 2019 21:38:37 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Dec 2019 21:38:19 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 6 Dec 2019 21:37:59 +0800
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
        <srv_heupstream@mediatek.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: [PATCH v6 0/6] Add Support for MediaTek PMIC MT6358
Date:   Fri, 6 Dec 2019 21:32:57 +0800
Message-ID: <1575639183-17606-1-git-send-email-hsin-hsiung.wang@mediatek.com>
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
Zm9yIE1UODE4MyBwbGF0Zm9ybS4NCg0KY2hhbmdlcyBzaW5jZSB2NToNCi0gcmV3cml0ZSBzdXNw
ZW5kL3Jlc3VtZSBiZWhhdmlvciBmb3IgbWZkIGRyaXZlci4NCi0gcmVtb3ZlIHVudXNlZCBlcnJv
ciBoYW5kbGUgZm9yIG1mZCBkcml2ZXIuDQotIHJlZmluZSBmb3IgYmV0dGVyIGNvZGUgcXVhbGl0
eSBpbiBtZmQgZHJpdmVyLg0KLSBhZGQgTVQ2MzU4IFBNSUMgc3VwcG9ydCB0byBNVDgxODMgZXZi
Lg0KLSBhZGQgc2lnbmVkLW9mZi1ieSBmb3IgcnRjIHBhdGNoZXMuDQoNCkhzaW4tSHNpdW5nIFdh
bmcgKDQpOg0KICBtZmQ6IG10NjM5NzogbW9kaWZ5IHN1c3BlbmQvcmVzdW1lIGJlaGF2aW9yDQog
IGR0LWJpbmRpbmdzOiBtZmQ6IEFkZCBjb21wYXRpYmxlIGZvciB0aGUgTWVkaWFUZWsgTVQ2MzU4
IFBNSUMNCiAgbWZkOiBBZGQgc3VwcG9ydCBmb3IgdGhlIE1lZGlhVGVrIE1UNjM1OCBQTUlDDQog
IGFybTY0OiBkdHM6IG10NjM1ODogYWRkIFBNSUMgTVQ2MzU4IHJlbGF0ZWQgbm9kZXMNCg0KUmFu
IEJpICgyKToNCiAgcnRjOiBtdDYzOTc6IGZpeCBhbGFybSByZWdpc3RlciBvdmVyd3JpdGUNCiAg
cnRjOiBBZGQgc3VwcG9ydCBmb3IgdGhlIE1lZGlhVGVrIE1UNjM1OCBSVEMNCg0KIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvbXQ2Mzk3LnR4dCB8ICAxNCArLQ0KIGFyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ2MzU4LmR0c2kgICAgICAgICB8IDM2MSArKysrKysr
KysrKysrKysrKysrKysrKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLWV2
Yi5kdHMgICAgICB8ICAgMSArDQogZHJpdmVycy9tZmQvTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAyICstDQogZHJpdmVycy9tZmQvbXQ2MzU4LWlycS5jICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMjI0ICsrKysrKysrKysrKysrDQogZHJpdmVycy9tZmQvbXQ2Mzk3
LWNvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDc1ICsrKy0tDQogZHJpdmVycy9tZmQv
bXQ2Mzk3LWlycS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMzICsrKw0KIGRyaXZlcnMv
cnRjL3J0Yy1tdDYzOTcuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICA4NSArKysrLS0NCiBp
bmNsdWRlL2xpbnV4L21mZC9tdDYzNTgvY29yZS5oICAgICAgICAgICAgICAgICAgfCAxNTggKysr
KysrKysrKw0KIGluY2x1ZGUvbGludXgvbWZkL210NjM1OC9yZWdpc3RlcnMuaCAgICAgICAgICAg
ICB8IDI4MiArKysrKysrKysrKysrKysrKysNCiBpbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvY29y
ZS5oICAgICAgICAgICAgICAgICAgfCAgIDUgKw0KIDExIGZpbGVzIGNoYW5nZWQsIDExODIgaW5z
ZXJ0aW9ucygrKSwgNTggZGVsZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ2MzU4LmR0c2kNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9tZmQvbXQ2MzU4LWlycS5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgv
bWZkL210NjM1OC9jb3JlLmgNCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQv
bXQ2MzU4L3JlZ2lzdGVycy5oDQoNCi0tIA0KMi42LjQNCg==

