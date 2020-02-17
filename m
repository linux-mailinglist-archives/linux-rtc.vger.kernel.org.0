Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE799160943
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Feb 2020 04:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgBQDwK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 16 Feb 2020 22:52:10 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:59106 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726485AbgBQDwK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 16 Feb 2020 22:52:10 -0500
X-UUID: 28a33743ba224fe09de604ac9e3538a8-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=oOYnDTaPt4d2SztN+2gFkz5sbV1QrJ72DYNKiC6jaZ4=;
        b=R/fXvtD9PCZqiPIO2IFbQyxx2v9g9FOLkgDNmgu8qHiOpkbp3KCGFaMAS2EhMgj1pHKcJUguUWl9Kb0F8F5O+kKejcfCoKvPjoy1ZVWu1xnOxT3QENPtEifjz1Jw3eV3RiShl4QLIfGUoPtsnMtI6tllV7S/3SerPL2139WK6ng=;
X-UUID: 28a33743ba224fe09de604ac9e3538a8-20200217
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 488906170; Mon, 17 Feb 2020 11:52:05 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs02n1.mediatek.inc
 (172.21.101.77) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 17 Feb
 2020 11:50:21 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 17 Feb 2020 11:51:25 +0800
Message-ID: <1581911502.20099.13.camel@mhfsdcap03>
Subject: Re: [PATCH v8 4/5] rtc: mt6397: Add support for the MediaTek MT6358
 RTC
From:   Ran Bi <ran.bi@mediatek.com>
To:     Yingjoe Chen <yingjoe.chen@mediatek.com>
CC:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Josef Friedl <josef.friedl@speed.at>,
        <srv_heupstream@mediatek.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sean Wang <sean.wang@mediatek.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fontana <rfontana@redhat.com>,
        <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Eddie Huang <eddie.huang@mediatek.com>,
        <linux-rtc@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
        Josef Friedl <josef.friedl@speed.at>,
        "Frank Wunderlich" <frank-w@public-files.de>
Date:   Mon, 17 Feb 2020 11:51:42 +0800
In-Reply-To: <1580748607.31376.3.camel@mtksdaap41>
References: <1580730044-30501-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1580730044-30501-5-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1580748607.31376.3.camel@mtksdaap41>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gVHVlLCAyMDIwLTAyLTA0IGF0IDAwOjUwICswODAwLCBZaW5nam9lIENoZW4gd3JvdGU6DQo+
ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWZkL210NjM5Ny9ydGMuaCBiL2luY2x1ZGUv
bGludXgvbWZkL210NjM5Ny9ydGMuaA0KPiA+IGluZGV4IGY4NGI5MTYuLmZmZmUzNGEgMTAwNjQ0
DQo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L3J0Yy5oDQo+ID4gKysrIGIvaW5j
bHVkZS9saW51eC9tZmQvbXQ2Mzk3L3J0Yy5oDQo+ID4gQEAgLTE4LDcgKzE4LDggQEANCj4gPiAg
I2RlZmluZSBSVENfQkJQVV9DQlVTWSAgICAgICAgIEJJVCg2KQ0KPiA+ICAjZGVmaW5lIFJUQ19C
QlBVX0tFWSAgICAgICAgICAgICgweDQzIDw8IDgpDQo+ID4gIA0KPiA+IC0jZGVmaW5lIFJUQ19X
UlRHUiAgICAgICAgICAgICAgMHgwMDNjDQo+ID4gKyNkZWZpbmUgUlRDX1dSVEdSX01UNjM1OCAg
ICAgICAweDNhDQo+ID4gKyNkZWZpbmUgUlRDX1dSVEdSX01UNjM5NyAgICAgICAweDNjDQo+ID4g
IA0KPiA+ICAjZGVmaW5lIFJUQ19JUlFfU1RBICAgICAgICAgICAgMHgwMDAyDQo+ID4gICNkZWZp
bmUgUlRDX0lSUV9TVEFfQUwgICAgICAgICBCSVQoMCkNCj4gPiBAQCAtNTcsNiArNTgsMTAgQEAN
Cj4gPiAgI2RlZmluZSBNVEtfUlRDX1BPTExfREVMQVlfVVMgIDEwDQo+ID4gICNkZWZpbmUgTVRL
X1JUQ19QT0xMX1RJTUVPVVQgICAoamlmZmllc190b191c2VjcyhIWikpDQo+ID4gIA0KPiA+ICtz
dHJ1Y3QgbXRrX3J0Y19kYXRhIHsNCj4gPiArCXUzMgkJCXdydGdyOw0KPiA+ICt9Ow0KPiA+ICsN
Cj4gPiAgc3RydWN0IG10NjM5N19ydGMgew0KPiA+ICAJc3RydWN0IGRldmljZSAgICAgICAgICAg
KmRldjsNCj4gPiAgCXN0cnVjdCBydGNfZGV2aWNlICAgICAgICpydGNfZGV2Ow0KPiA+IEBAIC02
Niw2ICs3MSwxNSBAQCBzdHJ1Y3QgbXQ2Mzk3X3J0YyB7DQo+ID4gIAlzdHJ1Y3QgcmVnbWFwICAg
ICAgICAgICAqcmVnbWFwOw0KPiA+ICAJaW50ICAgICAgICAgICAgICAgICAgICAgaXJxOw0KPiA+
ICAJdTMyICAgICAgICAgICAgICAgICAgICAgYWRkcl9iYXNlOw0KPiA+ICsJY29uc3Qgc3RydWN0
IG10a19ydGNfZGF0YSAqZGF0YTsNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgbXRrX3J0Y19kYXRhIG10NjM1OF9ydGNfZGF0YSA9IHsNCj4gPiArCS53cnRnciA9IFJU
Q19XUlRHUl9NVDYzNTgsDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IG10a19ydGNfZGF0YSBtdDYzOTdfcnRjX2RhdGEgPSB7DQo+ID4gKwkud3J0Z3IgPSBSVENfV1JU
R1JfTVQ2Mzk3LA0KPiA+ICB9Ow0KPiANCj4gSGksDQo+IA0KPiBQdXR0aW5nIHRoZXNlIGluIGhl
YWRlciBmaWxlIGRvZXNuJ3QgbG9va3MgcmlnaHQgdG8gbWUuDQo+IFdobyBuZWVkIHRoaXM/IGNh
biB5b3UgbW92ZSB0aGVtIGJhY2sgdG8gcnRjLW10NjM5Ny5jPw0KPiANCj4gSm9lLkMNCj4gDQoN
ClRoaXMgY291bGQgYWxzbyBlZmZlY3Qga2VybmVsL2RyaXZlcnMvcG93ZXIvcmVzZXQvbXQ2MzIz
LXBvd2Vyb2ZmLmMNCndoaWNoIHVzaW5nIHNhbWUgcmVnaW9uIG9mIFJUQyByZWdpc3RlcnMuDQpU
aGVyZSBhcmUgMiB3YXlzIG9mIG1vZGlmaWNhdGlvbjoNCjEuIGtlcm5lbC9kcml2ZXJzL3J0Yy9y
dGMtbXQ2Mzk3LmMgaW1wbGVtZW50IGRvX3B3cm9mZiBmdW5jdGlvbiBhbmQNCmV4cG9ydCB0byBt
dDYzMjMtcG93ZXJvZmYuYw0KMi4gSnVzdCBtb2RpZnkgbXQ2MzIzLXBvd2Vyb2ZmLmMgZmlsZSB0
byBjb21wYXRpYmxlIHRoaXMgcGF0Y2guIEkgbWVhbg0KdXNpbmcgUlRDX1dSVEdSX01UNjM5NyB0
byByZXBsYWNlIFJUQ19XUlRHUi4gT3IgbW9kaWZ5IG10NjMyMy1wb3dlcm9mZi5jDQpsaWtlIHJ0
Yy1tdDYzOTcuYw0KDQo=

