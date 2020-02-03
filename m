Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC74C150569
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Feb 2020 12:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgBCLkx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 3 Feb 2020 06:40:53 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:62616 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726244AbgBCLkx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 3 Feb 2020 06:40:53 -0500
X-UUID: c442c85478d341b7a0f0a1fc080d9060-20200203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6UM/Fs5Z+evR9JsRYIgk3anO7LbuI8vYDKCEBnTyXCQ=;
        b=HvxySMdGC6GBpGk/LSjdlaODVlgoVFg8MIalgbZRP9jPS2LAE3dthh35K3H/R81XRf21BNytvrZZGN+Z1cBldDPhbpn3bnboy1grWESniPWowE+VyNc7FQpPf9sMcCRLYcdHHHftq//NDjzFyJPbRD3Hb+IJvpXagOdkVlMMQb8=;
X-UUID: c442c85478d341b7a0f0a1fc080d9060-20200203
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 105540620; Mon, 03 Feb 2020 19:40:47 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 3 Feb 2020 19:39:48 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 3 Feb 2020 19:40:29 +0800
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
Subject: [PATCH v8 0/5] Add Support for MediaTek PMIC MT6358
Date:   Mon, 3 Feb 2020 19:40:39 +0800
Message-ID: <1580730044-30501-1-git-send-email-hsin-hsiung.wang@mediatek.com>
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
Zm9yIE1UODE4MyBwbGF0Zm9ybS4NCg0KY2hhbmdlcyBzaW5jZSB2NzoNCi0gcmVmaW5lIGZvciBi
ZXR0ZXIgY29kZSBxdWFsaXR5IGluIG1mZCBkcml2ZXIuDQotIHVwZGF0ZSBzb21lIGVycm9yIGxv
ZyBpbiBtZmQgZHJpdmVyLg0KLSB1cGRhdGUgdGhlIHJlZ3VsYXRvci1lbmFibGUtcmFtcC1kZWxh
eSBwcm9wZXJ0eSBvZiB2Y2FtaW8vdmNhbWQvdmNhbWExL3ZjYW1hMi4NCi0gbW9kaWZ5IHRoZSBz
dWJqZWN0IG9mIHJ0YyBwYXRjaC4NCg0KSHNpbi1Ic2l1bmcgV2FuZyAoNCk6DQogIG1mZDogbXQ2
Mzk3OiBtb2RpZnkgc3VzcGVuZC9yZXN1bWUgYmVoYXZpb3INCiAgZHQtYmluZGluZ3M6IG1mZDog
QWRkIGNvbXBhdGlibGUgZm9yIHRoZSBNZWRpYVRlayBNVDYzNTggUE1JQw0KICBtZmQ6IEFkZCBz
dXBwb3J0IGZvciB0aGUgTWVkaWFUZWsgTVQ2MzU4IFBNSUMNCiAgYXJtNjQ6IGR0czogbXQ2MzU4
OiBhZGQgUE1JQyBNVDYzNTggcmVsYXRlZCBub2Rlcw0KDQpSYW4gQmkgKDEpOg0KICBydGM6IG10
NjM5NzogQWRkIHN1cHBvcnQgZm9yIHRoZSBNZWRpYVRlayBNVDYzNTggUlRDDQoNCiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL210NjM5Ny50eHQgfCAgMTQgKy0NCiBhcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210NjM1OC5kdHNpICAgICAgICAgfCAzNjEgKysrKysr
KysrKysrKysrKysrKysrKysNCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My1l
dmIuZHRzICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvbWZkL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMiArLQ0KIGRyaXZlcnMvbWZkL210NjM1OC1pcnEuYyAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDIzMCArKysrKysrKysrKysrKysNCiBkcml2ZXJzL21mZC9tdDYz
OTctY29yZS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgODUgKysrLS0tDQogZHJpdmVycy9t
ZmQvbXQ2Mzk3LWlycS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMzICsrKw0KIGRyaXZl
cnMvcnRjL3J0Yy1tdDYzOTcuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyNSArLQ0KIGlu
Y2x1ZGUvbGludXgvbWZkL210NjM1OC9jb3JlLmggICAgICAgICAgICAgICAgICB8IDE1OCArKysr
KysrKysrDQogaW5jbHVkZS9saW51eC9tZmQvbXQ2MzU4L3JlZ2lzdGVycy5oICAgICAgICAgICAg
IHwgMjgyICsrKysrKysrKysrKysrKysrKw0KIGluY2x1ZGUvbGludXgvbWZkL210NjM5Ny9jb3Jl
LmggICAgICAgICAgICAgICAgICB8ICAgNSArDQogaW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L3J0
Yy5oICAgICAgICAgICAgICAgICAgIHwgIDE2ICstDQogMTIgZmlsZXMgY2hhbmdlZCwgMTE2NCBp
bnNlcnRpb25zKCspLCA0OCBkZWxldGlvbnMoLSkNCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDYzNTguZHRzaQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL21mZC9tdDYzNTgtaXJxLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51
eC9tZmQvbXQ2MzU4L2NvcmUuaA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L21m
ZC9tdDYzNTgvcmVnaXN0ZXJzLmgNCg0KLS0gDQoyLjYuNA0K

