Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77F4717D826
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Mar 2020 03:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgCICdg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 8 Mar 2020 22:33:36 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:31131 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726363AbgCICdf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 8 Mar 2020 22:33:35 -0400
X-UUID: 1e79d5a4c0cf488b84d112d6a33cdc61-20200309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=dVRMX7HzacB89Rfs5D6p0q4PZANziX89+dXutatF4V0=;
        b=kTl4R+qack+CW/5g0o7i/btiiRSIyCynqSsAVQoowR8r9lP3+YnZ5/ND9oPwEfJ2Yn5Zszt6WCDR3ltv4Y2xzN+k72FoJxF2g+x1EZHHJby81EYVxpfwVxNwZHKYtJ2Ys4awG/PiYG6s4OzXPR/VaHmqcSMK9E1qrd9vMkmCUzw=;
X-UUID: 1e79d5a4c0cf488b84d112d6a33cdc61-20200309
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 116088916; Mon, 09 Mar 2020 10:33:30 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Mar 2020 10:32:26 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 9 Mar 2020 10:30:47 +0800
Message-ID: <1583721209.28755.29.camel@mtksdaap41>
Subject: Re: [PATCH v8 4/5] rtc: mt6397: Add support for the MediaTek MT6358
 RTC
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     Ran Bi <ran.bi@mediatek.com>
CC:     Nicolas Boichat <drinkcat@chromium.org>,
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
        <linux-rtc@vger.kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Date:   Mon, 9 Mar 2020 10:33:29 +0800
In-Reply-To: <1583393876.8521.15.camel@mhfsdcap03>
References: <1580730044-30501-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1580730044-30501-5-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1580748607.31376.3.camel@mtksdaap41>
         <1581911502.20099.13.camel@mhfsdcap03>
         <CANMq1KDTHcFV8Gue1PuOWkWXL20z_-j58u8JpwbBm_wUvLeqSg@mail.gmail.com>
         <1583393876.8521.15.camel@mhfsdcap03>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gVGh1LCAyMDIwLTAzLTA1IGF0IDE1OjM3ICswODAwLCBSYW4gQmkgd3JvdGU6DQo+IEhpLA0K
PiANCj4gT24gV2VkLCAyMDIwLTAzLTA0IGF0IDIwOjU5ICswODAwLCBOaWNvbGFzIEJvaWNoYXQg
d3JvdGU6DQo+ID4gSGksDQo+ID4gDQo+ID4gT24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTE6NTIg
QU0gUmFuIEJpIDxyYW4uYmlAbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPiA+DQo+ID4gPiBPbiBU
dWUsIDIwMjAtMDItMDQgYXQgMDA6NTAgKzA4MDAsIFlpbmdqb2UgQ2hlbiB3cm90ZToNCg0KPC4u
Li4+DQoNCj4gPiA+ID4NCj4gPiA+ID4gUHV0dGluZyB0aGVzZSBpbiBoZWFkZXIgZmlsZSBkb2Vz
bid0IGxvb2tzIHJpZ2h0IHRvIG1lLg0KPiA+ID4gPiBXaG8gbmVlZCB0aGlzPyBjYW4geW91IG1v
dmUgdGhlbSBiYWNrIHRvIHJ0Yy1tdDYzOTcuYz8NCj4gPiA+ID4gSm9lLkMNCj4gPiA+ID4NCj4g
PiA+DQo+ID4gPiBUaGlzIGNvdWxkIGFsc28gZWZmZWN0IGtlcm5lbC9kcml2ZXJzL3Bvd2VyL3Jl
c2V0L210NjMyMy1wb3dlcm9mZi5jDQo+ID4gPiB3aGljaCB1c2luZyBzYW1lIHJlZ2lvbiBvZiBS
VEMgcmVnaXN0ZXJzLg0KPiA+ID4gVGhlcmUgYXJlIDIgd2F5cyBvZiBtb2RpZmljYXRpb246DQo+
ID4gPiAxLiBrZXJuZWwvZHJpdmVycy9ydGMvcnRjLW10NjM5Ny5jIGltcGxlbWVudCBkb19wd3Jv
ZmYgZnVuY3Rpb24gYW5kDQo+ID4gPiBleHBvcnQgdG8gbXQ2MzIzLXBvd2Vyb2ZmLmMNCj4gPiA+
IDIuIEp1c3QgbW9kaWZ5IG10NjMyMy1wb3dlcm9mZi5jIGZpbGUgdG8gY29tcGF0aWJsZSB0aGlz
IHBhdGNoLiBJIG1lYW4NCj4gPiA+IHVzaW5nIFJUQ19XUlRHUl9NVDYzOTcgdG8gcmVwbGFjZSBS
VENfV1JUR1IuIE9yIG1vZGlmeSBtdDYzMjMtcG93ZXJvZmYuYw0KPiA+ID4gbGlrZSBydGMtbXQ2
Mzk3LmMNCj4gPiANCj4gPiBPaCwgSSBzZWUsIHNvIGJhc2ljYWxseSBib3RoIHJ0Yy1tdDYzOTcu
YyBhbmQgbXQ2MzIzLXBvd2Vyb2ZmLmMgbmVlZA0KPiA+IHRvIGtub3cgYXQgd2hhdCBvZmZzZXQg
UlRDX1dSVEdSIGFjdHVhbGx5IGlzLiBDb3JyZWN0Pw0KPiA+IA0KPiANCj4gWWVzLCB5b3UgYXJl
IHJpZ2h0IGJvdGggZHJpdmVycyBuZWVkIHRvIGtub3cgUlRDX1dSVEdSIG9mZnNldC4gT2Zmc2V0
cw0KPiBvZiBvdGhlciByZWdpc3RlcnMgYXJlIHRoZSBzYW1lLg0KPiANCj4gPiBJcyB0aGVyZSBh
bnkgcGxhbiB0byBoYXZlIG10NjMyMy1wb3dlcm9mZi5jIHN1cHBvcnQgYW55IG9mIHRoZSBvdGhl
cg0KPiA+IFBNSUNzIChub3QganVzdCBNVDYzMjM/KT8NCj4gPiANCj4gDQo+IEN1cnJlbnRseSwg
d2UgZG9uJ3QgaGF2ZSBhIHBsYW4gdG8gbGV0IG10NjMyMy1wb3dlcm9mZi5jIHN1cHBvcnQgb3Ro
ZXINCj4gUE1JQ3MuIEJlY2F1c2Ugb3RoZXIgUE1JQ3MgbGlrZSBtdDYzOTcgYW5kIG10NjM1OCBj
b3VsZCB1c2luZw0KPiBhcm0tdHJ1c3QtZmlybXdhcmUgUFNDSSBwb3dlciBvZmYgZmxvdyBpbnN0
ZWFkLiBtdDYzMjMtcG93ZXJvZmYuYyB3YXMNCj4gcHJlcGFyZWQgZm9yIHBsYXRmb3JtIHdpdGhv
dXQgYXJtLXRydXN0LWZpcm13YXJlLg0KDQpUaGlzIGRlcGVuZHMgb24gU29DIGluc3RlYWQgb2Yg
UE1JQy4NCldlIHdpbGwgbmVlZCBtdDYzMjMtcG93ZXJvZmYuYyBmb3Igc29jIHdpdGggYXJtdjcg
Q1BVLCBiZWNhdXNlIHdlIHdvbid0DQpoYXZlIEFURiBvbiB0aGVtLiBJJ20gbm90IGF3YXJlIG9m
IG5ldyBwbGFuIGZvciB0aGlzLg0KDQoNCj4gPiBhLiBJZiBub3QsIEknZCBqdXN0IGFkZDoNCj4g
PiAjZGVmaW5lIFJUQ19XUlRHUl9NVDYzMjMgUlRDX1dSVEdSX01UNjM5Nw0KPiA+IGluIHJ0Yy5o
LCBmb3IgYWRkZWQgY2xhcml0eSwgdXNlIHRoYXQgaW4gbXQ2MzIzLXBvd2Vyb2ZmLmMNCj4gPiAo
cy9SVENfV1JUR1IvUlRDX1dSVEdSX01UNjMyMy8pLCBhbmQgYmUgZG9uZSB3aXRoIGl0Lg0KPiA+
IA0KPiANCj4gSSB3b3VsZCBqdXN0IGNoYW5nZSBSVENfV1JUR1IgdG8gUlRDX1dSVEdSX01UNjM5
NyBpbiBtdDYzMjMtcG93ZXJvZmYuYw0KPiBhdCBuZXh0IHBhdGNoc2V0Lg0KPiANCj4gPiBBY3R1
YWxseSwgZXZlbiBpZiB0aGVyZSdzIGEgcGxhbiwgeW91IGNhbiBnbyBhaGVhZCB3aXRoIHRoaXMg
c2ltcGxlcg0KPiA+IHNvbHV0aW9uIGZvciBub3csIGFuZCBmaXggbGF0ZXIgd2hlbiB0aGUgaXNz
dWUgY29tZXMgdXAuDQo+ID4gDQo+ID4gYi4gSWYgeW91IGV2ZXIgd2FudCB0byBzdXBwb3J0IG11
bHRpcGxlIFBNSUNzIHdpdGggbXQ2MzIzLXBvd2Vyb2ZmLmMsDQo+ID4geW91J2QgbmVlZCB0aGF0
IG9mZnNldCBmb3IgMiBkaWZmZXJlbnQgc3ViLWRldmljZXMgdW5kZXIgdGhlIHNhbWUgbWZkLA0K
PiA+IHNvIHRoZSBtYXRjaGluZyBsb2dpYyBiZWxvbmdzIGluIHRoZSBtYWluIG1mZCBkZXZpY2Us
IG5vdCBpbg0KPiA+IHJ0Yy9wb3dlcm9mZiBkcml2ZXIuDQo+ID4gDQo+ID4gU28gSSdkIG1vdmUg
dGhlIG1hdGNoaW5nIGxvZ2ljIGluIGRyaXZlcnMvbWZkL210NjM5Ny1jb3JlLmMsIGFuZCBhZGQN
Cj4gPiBydGNfd3J0Z3Igb2Zmc2V0IChvciBhIGZ1bGwgX2RhdGEgc3RydWN0dXJlKSB0byBgc3Ry
dWN0IG10NjM5N19jaGlwYCwNCj4gPiBvciwgcHJvYmFibHkgYmV0dGVyLCBhZGQgYSBJT1JFU09V
UkNFX1JFRyB0byB0aGUgbWF0Y2hpbmcgcmVzb3VyY2VzIHRvDQo+ID4gc3BlY2lmeSB0aGUgb2Zm
c2V0ICh0aGF0J3Mgd2hhdCBkcml2ZXJzL21mZC84OHBtODYweC1jb3JlLmMgc2VlbXMgdG8NCj4g
PiBiZSBkb2luZywgZm9yIGV4YW1wbGUpLg0KPiA+IA0KPiA+IEFuZCB0aGVuIG10NjMyMy1wb3dl
cm9mZi5jIHNob3VsZCBwcm9iYWJseSBiZSByZW5hbWVkIHRvIG10NjM5Ny1wb3dlcm9mZi5jLg0K
PiA+IA0KPiA+IChhY3R1YWxseSwgbG9va2luZyBhdCB0aGlzLCBJJ20gZXZlbiBxdWVzdGlvbmlu
ZyBpZiBtdDYzMjMtcG93ZXJvZmYuYw0KPiA+IHNob3VsZCBldmVuIGV4aXN0LCBhbmQgaWYgeW91
IHNob3VsZCBqdXN0IGZvbGQgaXQgaW50byBydGMtbXQ2Mzk3LmM/DQo+ID4gU2luY2UgdGhleSB1
c2UgdGhlIHNhbWUgcmVnaXN0ZXJzPykNCj4gPiANCj4gDQo+IG10NjMyMy1wb3dlcm9mZi5jIHdo
aWNoIGhpamFjayBwbV9wb3dlcl9vZmYgcG9pbnRlciBpcyBvbmx5IGZvciBwbGF0Zm9ybQ0KPiB3
aXRob3V0IGFybS10cnVzdC1maXJtd2FyZS4gVGhpcyBpcyB0aGUgcmVhc29uIEkgYW0gY29uc2lk
ZXJpbmcNCj4gbXQ2MzIzLXBvd2Vyb2ZmLmMgc2hvdWxkIG5vdCBiZSBmb2xkZWQgaW50byBydGMt
bXQ2Mzk3LmMuDQoNCg0KVXNpbmcvc2hhcmluZyBzYW1lIHNldCBvZiByZWdpc3RlcnMgZnJvbSBk
aWZmZXJlbnQgZHJpdmVycyBpcyBub3QgZ29vZDogDQoNCi0gV1JUR1IgaXMgYSBzcGVjaWFsIHJl
Z2lzdGVyIHRvICdjb21taXQnIHByZXZpb3VzIGNoYW5nZXMuIElmIDIgZHJpdmVycw0KYXJlIHJ1
bm5pbmcgYXQgdGhlIHNhbWUgdGltZSwgaXQgaXMgcG9zc2libGUgdG8gY29tbWl0IGluY29tcGxl
dGUgdXBkYXRlDQphbmQgY2F1c2UgdW5leHBlY3RlZCByZXN1bHQuIEl0IGlzIGVhc2llciB0byBj
b250cm9sIHRoaXMgZnJvbSBzYW1lDQpkcml2ZXIuDQoNCi0gSXQgaXMgZWFzeSB0byBvdmVybG9v
ayB0aGUgcmVnaXN0ZXIgaXMgYWNjZXNzIGJ5IG90aGVycyBhbmQgbGVhZCB0bw0KYnVncy9idWls
ZCBmYWlscyB3aGVuIGRvaW5nIGRyaXZlciB1cGRhdGUsIGVnLCB0aGlzIHBhdGNoc2V0Lg0KDQot
IFRoZSB0cmlnZ2VyIGNvZGUgaXMgZHVwbGljYXRlIGluIG10NjMyMy1wb3dlcm9mZi5jLCBjYW4g
anVzdCBjYWxsDQptdGtfcnRjX3dyaXRlX3RyaWdnZXIuDQoNCg0KU28gSSBhZ3JlZSB3aXRoIE5p
Y29sYXMsIG10NjMyMy1wb3dlcm9mZiBzaG91bGQgYmUgZm9sZGVkIGludG8NCnJ0Yy1tdDYzOTcu
Yy4gV2Ugc2hvdWxkIGJlIGFibGUgdG8gZGlzYWJsZSBwbV9wb3dlcl9vZmYgaGlqYWNraW5nIGZv
cg0KcGxhdGZvcm0gd2l0aCBhcm1WOCBDUFUuIE1heWJlIHdlIGNhbiBrZWVwICJtZWRpYXRlayxt
dDYzMjMtcHdyYyINCmNvbXBhdGlibGUgaW4gbXQ2MzIzLXBvd2Vyb2ZmLmMgZm9yIHRoaXMuDQoN
CkknbSBvayB3aXRoIGltcGxlbWVudCBhLiBhcyBzdWdnZXN0ZWQgYnkgTmljb2xhcyBmb3Igbm93
Lg0KDQpKb2UuQw0KDQo=

