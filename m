Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D856F17A094
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Mar 2020 08:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgCEHiV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Mar 2020 02:38:21 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:63558 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725844AbgCEHiV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Mar 2020 02:38:21 -0500
X-UUID: 269bfd075dd7464d91ef9b33cf3a5616-20200305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=UzudwNhVDUcthlnPvlM184xOjHlnmrBmdjwOXd3Z/P0=;
        b=XIuAmSG7Ph1VJxD0l2I7ChitABpbQ/Z7T99BCoxAhQz7CxA9COYfCEwsB4Tv43Rvz9cFzzcybO2pLvCOoonUoIXcLAWKVK/t8666FibChV19oNGj5eT2UT+i1puY9hCf30+YFmO+8z2vRPzn+2k8mBgq/x45jcf43zkB80iKph8=;
X-UUID: 269bfd075dd7464d91ef9b33cf3a5616-20200305
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1521207152; Thu, 05 Mar 2020 15:38:13 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs02n2.mediatek.inc
 (172.21.101.101) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 5 Mar
 2020 15:35:30 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Mar 2020 15:37:00 +0800
Message-ID: <1583393876.8521.15.camel@mhfsdcap03>
Subject: Re: [PATCH v8 4/5] rtc: mt6397: Add support for the MediaTek MT6358
 RTC
From:   Ran Bi <ran.bi@mediatek.com>
To:     Nicolas Boichat <drinkcat@chromium.org>
CC:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Lee Jones <lee.jones@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "Alessandro Zummo" <a.zummo@towertech.it>,
        Josef Friedl <josef.friedl@speed.at>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sean Wang <sean.wang@mediatek.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Richard Fontana <rfontana@redhat.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Eddie Huang <eddie.huang@mediatek.com>,
        <linux-rtc@vger.kernel.org>
Date:   Thu, 5 Mar 2020 15:37:56 +0800
In-Reply-To: <CANMq1KDTHcFV8Gue1PuOWkWXL20z_-j58u8JpwbBm_wUvLeqSg@mail.gmail.com>
References: <1580730044-30501-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1580730044-30501-5-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1580748607.31376.3.camel@mtksdaap41>
         <1581911502.20099.13.camel@mhfsdcap03>
         <CANMq1KDTHcFV8Gue1PuOWkWXL20z_-j58u8JpwbBm_wUvLeqSg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F43A3E10FD4B782182AA4645396F770C2D8067640B573F7D3D741AB006ECAD6B2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGksDQoNCk9uIFdlZCwgMjAyMC0wMy0wNCBhdCAyMDo1OSArMDgwMCwgTmljb2xhcyBCb2ljaGF0
IHdyb3RlOg0KPiBIaSwNCj4gDQo+IE9uIE1vbiwgRmViIDE3LCAyMDIwIGF0IDExOjUyIEFNIFJh
biBCaSA8cmFuLmJpQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBPbiBUdWUsIDIwMjAt
MDItMDQgYXQgMDA6NTAgKzA4MDAsIFlpbmdqb2UgQ2hlbiB3cm90ZToNCj4gPiA+ID4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvbWZkL210NjM5Ny9ydGMuaCBiL2luY2x1ZGUvbGludXgvbWZk
L210NjM5Ny9ydGMuaA0KPiA+ID4gPiBpbmRleCBmODRiOTE2Li5mZmZlMzRhIDEwMDY0NA0KPiA+
ID4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvcnRjLmgNCj4gPiA+ID4gKysrIGIv
aW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L3J0Yy5oDQo+ID4gPiA+IEBAIC0xOCw3ICsxOCw4IEBA
DQo+ID4gPiA+ICAjZGVmaW5lIFJUQ19CQlBVX0NCVVNZICAgICAgICAgQklUKDYpDQo+ID4gPiA+
ICAjZGVmaW5lIFJUQ19CQlBVX0tFWSAgICAgICAgICAgICgweDQzIDw8IDgpDQo+ID4gPiA+DQo+
ID4gPiA+IC0jZGVmaW5lIFJUQ19XUlRHUiAgICAgICAgICAgICAgMHgwMDNjDQo+ID4gPiA+ICsj
ZGVmaW5lIFJUQ19XUlRHUl9NVDYzNTggICAgICAgMHgzYQ0KPiA+ID4gPiArI2RlZmluZSBSVENf
V1JUR1JfTVQ2Mzk3ICAgICAgIDB4M2MNCj4gPiA+ID4NCj4gPiA+ID4gICNkZWZpbmUgUlRDX0lS
UV9TVEEgICAgICAgICAgICAweDAwMDINCj4gPiA+ID4gICNkZWZpbmUgUlRDX0lSUV9TVEFfQUwg
ICAgICAgICBCSVQoMCkNCj4gPiA+ID4gQEAgLTU3LDYgKzU4LDEwIEBADQo+ID4gPiA+ICAjZGVm
aW5lIE1US19SVENfUE9MTF9ERUxBWV9VUyAgMTANCj4gPiA+ID4gICNkZWZpbmUgTVRLX1JUQ19Q
T0xMX1RJTUVPVVQgICAoamlmZmllc190b191c2VjcyhIWikpDQo+ID4gPiA+DQo+ID4gPiA+ICtz
dHJ1Y3QgbXRrX3J0Y19kYXRhIHsNCj4gPiA+ID4gKyAgIHUzMiAgICAgICAgICAgICAgICAgICAg
IHdydGdyOw0KPiA+ID4gPiArfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiAgc3RydWN0IG10NjM5N19y
dGMgew0KPiA+ID4gPiAgICAgc3RydWN0IGRldmljZSAgICAgICAgICAgKmRldjsNCj4gPiA+ID4g
ICAgIHN0cnVjdCBydGNfZGV2aWNlICAgICAgICpydGNfZGV2Ow0KPiA+ID4gPiBAQCAtNjYsNiAr
NzEsMTUgQEAgc3RydWN0IG10NjM5N19ydGMgew0KPiA+ID4gPiAgICAgc3RydWN0IHJlZ21hcCAg
ICAgICAgICAgKnJlZ21hcDsNCj4gPiA+ID4gICAgIGludCAgICAgICAgICAgICAgICAgICAgIGly
cTsNCj4gPiA+ID4gICAgIHUzMiAgICAgICAgICAgICAgICAgICAgIGFkZHJfYmFzZTsNCj4gPiA+
ID4gKyAgIGNvbnN0IHN0cnVjdCBtdGtfcnRjX2RhdGEgKmRhdGE7DQo+ID4gPiA+ICt9Ow0KPiA+
ID4gPiArDQo+ID4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19ydGNfZGF0YSBtdDYzNThf
cnRjX2RhdGEgPSB7DQo+ID4gPiA+ICsgICAud3J0Z3IgPSBSVENfV1JUR1JfTVQ2MzU4LA0KPiA+
ID4gPiArfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfcnRj
X2RhdGEgbXQ2Mzk3X3J0Y19kYXRhID0gew0KPiA+ID4gPiArICAgLndydGdyID0gUlRDX1dSVEdS
X01UNjM5NywNCj4gPiA+ID4gIH07DQo+ID4gPg0KPiA+ID4gSGksDQo+ID4gPg0KPiA+ID4gUHV0
dGluZyB0aGVzZSBpbiBoZWFkZXIgZmlsZSBkb2Vzbid0IGxvb2tzIHJpZ2h0IHRvIG1lLg0KPiA+
ID4gV2hvIG5lZWQgdGhpcz8gY2FuIHlvdSBtb3ZlIHRoZW0gYmFjayB0byBydGMtbXQ2Mzk3LmM/
DQo+ID4gPiBKb2UuQw0KPiA+ID4NCj4gPg0KPiA+IFRoaXMgY291bGQgYWxzbyBlZmZlY3Qga2Vy
bmVsL2RyaXZlcnMvcG93ZXIvcmVzZXQvbXQ2MzIzLXBvd2Vyb2ZmLmMNCj4gPiB3aGljaCB1c2lu
ZyBzYW1lIHJlZ2lvbiBvZiBSVEMgcmVnaXN0ZXJzLg0KPiA+IFRoZXJlIGFyZSAyIHdheXMgb2Yg
bW9kaWZpY2F0aW9uOg0KPiA+IDEuIGtlcm5lbC9kcml2ZXJzL3J0Yy9ydGMtbXQ2Mzk3LmMgaW1w
bGVtZW50IGRvX3B3cm9mZiBmdW5jdGlvbiBhbmQNCj4gPiBleHBvcnQgdG8gbXQ2MzIzLXBvd2Vy
b2ZmLmMNCj4gPiAyLiBKdXN0IG1vZGlmeSBtdDYzMjMtcG93ZXJvZmYuYyBmaWxlIHRvIGNvbXBh
dGlibGUgdGhpcyBwYXRjaC4gSSBtZWFuDQo+ID4gdXNpbmcgUlRDX1dSVEdSX01UNjM5NyB0byBy
ZXBsYWNlIFJUQ19XUlRHUi4gT3IgbW9kaWZ5IG10NjMyMy1wb3dlcm9mZi5jDQo+ID4gbGlrZSBy
dGMtbXQ2Mzk3LmMNCj4gDQo+IE9oLCBJIHNlZSwgc28gYmFzaWNhbGx5IGJvdGggcnRjLW10NjM5
Ny5jIGFuZCBtdDYzMjMtcG93ZXJvZmYuYyBuZWVkDQo+IHRvIGtub3cgYXQgd2hhdCBvZmZzZXQg
UlRDX1dSVEdSIGFjdHVhbGx5IGlzLiBDb3JyZWN0Pw0KPiANCg0KWWVzLCB5b3UgYXJlIHJpZ2h0
IGJvdGggZHJpdmVycyBuZWVkIHRvIGtub3cgUlRDX1dSVEdSIG9mZnNldC4gT2Zmc2V0cw0Kb2Yg
b3RoZXIgcmVnaXN0ZXJzIGFyZSB0aGUgc2FtZS4NCg0KPiBJcyB0aGVyZSBhbnkgcGxhbiB0byBo
YXZlIG10NjMyMy1wb3dlcm9mZi5jIHN1cHBvcnQgYW55IG9mIHRoZSBvdGhlcg0KPiBQTUlDcyAo
bm90IGp1c3QgTVQ2MzIzPyk/DQo+IA0KDQpDdXJyZW50bHksIHdlIGRvbid0IGhhdmUgYSBwbGFu
IHRvIGxldCBtdDYzMjMtcG93ZXJvZmYuYyBzdXBwb3J0IG90aGVyDQpQTUlDcy4gQmVjYXVzZSBv
dGhlciBQTUlDcyBsaWtlIG10NjM5NyBhbmQgbXQ2MzU4IGNvdWxkIHVzaW5nDQphcm0tdHJ1c3Qt
ZmlybXdhcmUgUFNDSSBwb3dlciBvZmYgZmxvdyBpbnN0ZWFkLiBtdDYzMjMtcG93ZXJvZmYuYyB3
YXMNCnByZXBhcmVkIGZvciBwbGF0Zm9ybSB3aXRob3V0IGFybS10cnVzdC1maXJtd2FyZS4NCg0K
PiBhLiBJZiBub3QsIEknZCBqdXN0IGFkZDoNCj4gI2RlZmluZSBSVENfV1JUR1JfTVQ2MzIzIFJU
Q19XUlRHUl9NVDYzOTcNCj4gaW4gcnRjLmgsIGZvciBhZGRlZCBjbGFyaXR5LCB1c2UgdGhhdCBp
biBtdDYzMjMtcG93ZXJvZmYuYw0KPiAocy9SVENfV1JUR1IvUlRDX1dSVEdSX01UNjMyMy8pLCBh
bmQgYmUgZG9uZSB3aXRoIGl0Lg0KPiANCg0KSSB3b3VsZCBqdXN0IGNoYW5nZSBSVENfV1JUR1Ig
dG8gUlRDX1dSVEdSX01UNjM5NyBpbiBtdDYzMjMtcG93ZXJvZmYuYw0KYXQgbmV4dCBwYXRjaHNl
dC4NCg0KPiBBY3R1YWxseSwgZXZlbiBpZiB0aGVyZSdzIGEgcGxhbiwgeW91IGNhbiBnbyBhaGVh
ZCB3aXRoIHRoaXMgc2ltcGxlcg0KPiBzb2x1dGlvbiBmb3Igbm93LCBhbmQgZml4IGxhdGVyIHdo
ZW4gdGhlIGlzc3VlIGNvbWVzIHVwLg0KPiANCj4gYi4gSWYgeW91IGV2ZXIgd2FudCB0byBzdXBw
b3J0IG11bHRpcGxlIFBNSUNzIHdpdGggbXQ2MzIzLXBvd2Vyb2ZmLmMsDQo+IHlvdSdkIG5lZWQg
dGhhdCBvZmZzZXQgZm9yIDIgZGlmZmVyZW50IHN1Yi1kZXZpY2VzIHVuZGVyIHRoZSBzYW1lIG1m
ZCwNCj4gc28gdGhlIG1hdGNoaW5nIGxvZ2ljIGJlbG9uZ3MgaW4gdGhlIG1haW4gbWZkIGRldmlj
ZSwgbm90IGluDQo+IHJ0Yy9wb3dlcm9mZiBkcml2ZXIuDQo+IA0KPiBTbyBJJ2QgbW92ZSB0aGUg
bWF0Y2hpbmcgbG9naWMgaW4gZHJpdmVycy9tZmQvbXQ2Mzk3LWNvcmUuYywgYW5kIGFkZA0KPiBy
dGNfd3J0Z3Igb2Zmc2V0IChvciBhIGZ1bGwgX2RhdGEgc3RydWN0dXJlKSB0byBgc3RydWN0IG10
NjM5N19jaGlwYCwNCj4gb3IsIHByb2JhYmx5IGJldHRlciwgYWRkIGEgSU9SRVNPVVJDRV9SRUcg
dG8gdGhlIG1hdGNoaW5nIHJlc291cmNlcyB0bw0KPiBzcGVjaWZ5IHRoZSBvZmZzZXQgKHRoYXQn
cyB3aGF0IGRyaXZlcnMvbWZkLzg4cG04NjB4LWNvcmUuYyBzZWVtcyB0bw0KPiBiZSBkb2luZywg
Zm9yIGV4YW1wbGUpLg0KPiANCj4gQW5kIHRoZW4gbXQ2MzIzLXBvd2Vyb2ZmLmMgc2hvdWxkIHBy
b2JhYmx5IGJlIHJlbmFtZWQgdG8gbXQ2Mzk3LXBvd2Vyb2ZmLmMuDQo+IA0KPiAoYWN0dWFsbHks
IGxvb2tpbmcgYXQgdGhpcywgSSdtIGV2ZW4gcXVlc3Rpb25pbmcgaWYgbXQ2MzIzLXBvd2Vyb2Zm
LmMNCj4gc2hvdWxkIGV2ZW4gZXhpc3QsIGFuZCBpZiB5b3Ugc2hvdWxkIGp1c3QgZm9sZCBpdCBp
bnRvIHJ0Yy1tdDYzOTcuYz8NCj4gU2luY2UgdGhleSB1c2UgdGhlIHNhbWUgcmVnaXN0ZXJzPykN
Cj4gDQoNCm10NjMyMy1wb3dlcm9mZi5jIHdoaWNoIGhpamFjayBwbV9wb3dlcl9vZmYgcG9pbnRl
ciBpcyBvbmx5IGZvciBwbGF0Zm9ybQ0Kd2l0aG91dCBhcm0tdHJ1c3QtZmlybXdhcmUuIFRoaXMg
aXMgdGhlIHJlYXNvbiBJIGFtIGNvbnNpZGVyaW5nDQptdDYzMjMtcG93ZXJvZmYuYyBzaG91bGQg
bm90IGJlIGZvbGRlZCBpbnRvIHJ0Yy1tdDYzOTcuYy4NCg0KPiBIb3BlIHRoaXMgbWFrZXMgc2Vu
c2U/DQo+IA0KPiBCZXN0LA0KDQpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbnMuDQoNCkJlc3Qs
DQo=

