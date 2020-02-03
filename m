Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA3EB150E33
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Feb 2020 17:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbgBCQwO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 3 Feb 2020 11:52:14 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:46432 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727946AbgBCQuP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 3 Feb 2020 11:50:15 -0500
X-UUID: c814e9ac7ff541c2b03bc6b7734cb5f1-20200204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=H9GMx9DnwGDgodla7Vg+jUBwtFlHLpaLo8S7jY2l5XU=;
        b=Zue/IOlNDbjjIhCQSoLUzz07QVmuwh4FejS979v1jf76XShrTaNvPXnPGTnrvQl+1pvYnQKgcNlKQvXnOU3hUjzK0BhQR4RGGMoO4jl84yPmrnpPWqbVV/CXBXZaZYFbtLGFMrLrGazlNbADNV98R0csRVj5ODcyjQu1oNuUZPI=;
X-UUID: c814e9ac7ff541c2b03bc6b7734cb5f1-20200204
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1437683526; Tue, 04 Feb 2020 00:50:09 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 4 Feb 2020 00:47:30 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Feb 2020 00:50:22 +0800
Message-ID: <1580748607.31376.3.camel@mtksdaap41>
Subject: Re: [PATCH v8 4/5] rtc: mt6397: Add support for the MediaTek MT6358
 RTC
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
CC:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "Alessandro Zummo" <a.zummo@towertech.it>,
        Josef Friedl <josef.friedl@speed.at>,
        <srv_heupstream@mediatek.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ran Bi <ran.bi@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fontana <rfontana@redhat.com>,
        <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Eddie Huang <eddie.huang@mediatek.com>,
        <linux-rtc@vger.kernel.org>
Date:   Tue, 4 Feb 2020 00:50:07 +0800
In-Reply-To: <1580730044-30501-5-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1580730044-30501-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1580730044-30501-5-git-send-email-hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 37D3D0CDB433DAF44B511CA24F2337DFE40A7492358ED61E79F74C61A38C3D7A2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gTW9uLCAyMDIwLTAyLTAzIGF0IDE5OjQwICswODAwLCBIc2luLUhzaXVuZyBXYW5nIHdyb3Rl
Og0KPiBGcm9tOiBSYW4gQmkgPHJhbi5iaUBtZWRpYXRlay5jb20+DQo+IA0KPiBUaGlzIGFkZCBz
dXBwb3J0IGZvciB0aGUgTWVkaWFUZWsgTVQ2MzU4IFJUQy4gRHJpdmVyIHVzaW5nDQo+IGNvbXBh
dGlibGUgZGF0YSB0byBzdG9yZSBkaWZmZXJlbnQgUlRDX1dSVEdSIGFkZHJlc3Mgb2Zmc2V0Lg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogUmFuIEJpIDxyYW4uYmlAbWVkaWF0ZWsuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBIc2luLUhzaXVuZyBXYW5nIDxoc2luLWhzaXVuZy53YW5nQG1lZGlhdGVrLmNv
bT4NCj4gLS0tDQo+ICBkcml2ZXJzL3J0Yy9ydGMtbXQ2Mzk3LmMgICAgICAgfCAyNSArKysrKysr
KysrKysrKysrKy0tLS0tLS0tDQo+ICBpbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvcnRjLmggfCAx
NiArKysrKysrKysrKysrKystDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLW10NjM5
Ny5jIGIvZHJpdmVycy9ydGMvcnRjLW10NjM5Ny5jDQo+IGluZGV4IDUyNDlmYzkuLmE5MDczNWUx
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3J0Yy9ydGMtbXQ2Mzk3LmMNCj4gKysrIGIvZHJpdmVy
cy9ydGMvcnRjLW10NjM5Ny5jDQo+IEBAIC05LDE4ICs5LDMxIEBADQo+ICAjaW5jbHVkZSA8bGlu
dXgvbWZkL210NjM5Ny9jb3JlLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICAj
aW5jbHVkZSA8bGludXgvbXV0ZXguaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4N
Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gICNpbmNsdWRlIDxsaW51
eC9yZWdtYXAuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9ydGMuaD4NCj4gICNpbmNsdWRlIDxsaW51
eC9tZmQvbXQ2Mzk3L3J0Yy5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5o
Pg0KPiAgDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdDYzOTdfcnRjX29m
X21hdGNoW10gPSB7DQo+ICsJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDYzMjMtcnRjIiwN
Cj4gKwkJLmRhdGEgPSAodm9pZCAqKSZtdDYzOTdfcnRjX2RhdGEsIH0sDQo+ICsJeyAuY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDYzNTgtcnRjIiwNCj4gKwkJLmRhdGEgPSAodm9pZCAqKSZtdDYz
NThfcnRjX2RhdGEsIH0sDQo+ICsJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDYzOTctcnRj
IiwNCj4gKwkJLmRhdGEgPSAodm9pZCAqKSZtdDYzOTdfcnRjX2RhdGEsIH0sDQo+ICsJe30NCj4g
K307DQo+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtdDYzOTdfcnRjX29mX21hdGNoKTsNCj4g
Kw0KPiAgc3RhdGljIGludCBtdGtfcnRjX3dyaXRlX3RyaWdnZXIoc3RydWN0IG10NjM5N19ydGMg
KnJ0YykNCj4gIHsNCj4gIAlpbnQgcmV0Ow0KPiAgCXUzMiBkYXRhOw0KPiAgDQo+IC0JcmV0ID0g
cmVnbWFwX3dyaXRlKHJ0Yy0+cmVnbWFwLCBydGMtPmFkZHJfYmFzZSArIFJUQ19XUlRHUiwgMSk7
DQo+ICsJcmV0ID0gcmVnbWFwX3dyaXRlKHJ0Yy0+cmVnbWFwLA0KPiArCQkJICAgcnRjLT5hZGRy
X2Jhc2UgKyBydGMtPmRhdGEtPndydGdyLCAxKTsNCg0Kbml0OiBmaXQgaW4gb25lIGxpbmUuDQoN
CjwuLi4+DQoNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWZkL210NjM5Ny9ydGMuaCBi
L2luY2x1ZGUvbGludXgvbWZkL210NjM5Ny9ydGMuaA0KPiBpbmRleCBmODRiOTE2Li5mZmZlMzRh
IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvcnRjLmgNCj4gKysrIGIv
aW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L3J0Yy5oDQo+IEBAIC0xOCw3ICsxOCw4IEBADQo+ICAj
ZGVmaW5lIFJUQ19CQlBVX0NCVVNZICAgICAgICAgQklUKDYpDQo+ICAjZGVmaW5lIFJUQ19CQlBV
X0tFWSAgICAgICAgICAgICgweDQzIDw8IDgpDQo+ICANCj4gLSNkZWZpbmUgUlRDX1dSVEdSICAg
ICAgICAgICAgICAweDAwM2MNCj4gKyNkZWZpbmUgUlRDX1dSVEdSX01UNjM1OCAgICAgICAweDNh
DQo+ICsjZGVmaW5lIFJUQ19XUlRHUl9NVDYzOTcgICAgICAgMHgzYw0KPiAgDQo+ICAjZGVmaW5l
IFJUQ19JUlFfU1RBICAgICAgICAgICAgMHgwMDAyDQo+ICAjZGVmaW5lIFJUQ19JUlFfU1RBX0FM
ICAgICAgICAgQklUKDApDQo+IEBAIC01Nyw2ICs1OCwxMCBAQA0KPiAgI2RlZmluZSBNVEtfUlRD
X1BPTExfREVMQVlfVVMgIDEwDQo+ICAjZGVmaW5lIE1US19SVENfUE9MTF9USU1FT1VUICAgKGpp
ZmZpZXNfdG9fdXNlY3MoSFopKQ0KPiAgDQo+ICtzdHJ1Y3QgbXRrX3J0Y19kYXRhIHsNCj4gKwl1
MzIJCQl3cnRncjsNCj4gK307DQo+ICsNCj4gIHN0cnVjdCBtdDYzOTdfcnRjIHsNCj4gIAlzdHJ1
Y3QgZGV2aWNlICAgICAgICAgICAqZGV2Ow0KPiAgCXN0cnVjdCBydGNfZGV2aWNlICAgICAgICpy
dGNfZGV2Ow0KPiBAQCAtNjYsNiArNzEsMTUgQEAgc3RydWN0IG10NjM5N19ydGMgew0KPiAgCXN0
cnVjdCByZWdtYXAgICAgICAgICAgICpyZWdtYXA7DQo+ICAJaW50ICAgICAgICAgICAgICAgICAg
ICAgaXJxOw0KPiAgCXUzMiAgICAgICAgICAgICAgICAgICAgIGFkZHJfYmFzZTsNCj4gKwljb25z
dCBzdHJ1Y3QgbXRrX3J0Y19kYXRhICpkYXRhOw0KPiArfTsNCj4gKw0KPiArc3RhdGljIGNvbnN0
IHN0cnVjdCBtdGtfcnRjX2RhdGEgbXQ2MzU4X3J0Y19kYXRhID0gew0KPiArCS53cnRnciA9IFJU
Q19XUlRHUl9NVDYzNTgsDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19y
dGNfZGF0YSBtdDYzOTdfcnRjX2RhdGEgPSB7DQo+ICsJLndydGdyID0gUlRDX1dSVEdSX01UNjM5
NywNCj4gIH07DQoNCkhpLA0KDQpQdXR0aW5nIHRoZXNlIGluIGhlYWRlciBmaWxlIGRvZXNuJ3Qg
bG9va3MgcmlnaHQgdG8gbWUuDQpXaG8gbmVlZCB0aGlzPyBjYW4geW91IG1vdmUgdGhlbSBiYWNr
IHRvIHJ0Yy1tdDYzOTcuYz8NCg0KSm9lLkMNCg0KDQo=

