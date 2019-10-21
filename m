Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95476DE27D
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 05:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbfJUDKX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 20 Oct 2019 23:10:23 -0400
Received: from spam01.hygon.cn ([110.188.70.11]:56519 "EHLO spam1.hygon.cn"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726770AbfJUDKX (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 20 Oct 2019 23:10:23 -0400
Received: from MK-FE.hygon.cn ([172.23.18.61])
        by spam1.hygon.cn with ESMTP id x9L39Bo0072446;
        Mon, 21 Oct 2019 11:09:11 +0800 (GMT-8)
        (envelope-from fanjinke@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
        by MK-FE.hygon.cn with ESMTP id x9L394ew021535;
        Mon, 21 Oct 2019 11:09:04 +0800 (GMT-8)
        (envelope-from fanjinke@hygon.cn)
Received: from cncheex01.Hygon.cn (172.23.18.10) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Mon, 21 Oct
 2019 11:08:50 +0800
Received: from cncheex01.Hygon.cn ([172.23.18.10]) by cncheex01.Hygon.cn
 ([172.23.18.10]) with mapi id 15.01.1466.003; Mon, 21 Oct 2019 11:08:50 +0800
From:   Jinke Fan <fanjinke@hygon.cn>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        Wen Pu <puwen@hygon.cn>,
        "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
        "kim.phillips@amd.com" <kim.phillips@amd.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND RFC PATCH v3] rtc: Fix the AltCentury value on AMD/Hygon
 platform
Thread-Topic: [RESEND RFC PATCH v3] rtc: Fix the AltCentury value on AMD/Hygon
 platform
Thread-Index: AQHVhsk9kjjnHG3zLEyv1IS/Xg7OVqdj5gmA
Date:   Mon, 21 Oct 2019 03:08:50 +0000
Message-ID: <26fee8c9-695d-7703-bac9-5582ab560ae5@hygon.cn>
References: <20191015080827.11589-1-fanjinke@hygon.cn>
 <20191019220456.GP3125@piout.net>
In-Reply-To: <20191019220456.GP3125@piout.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.18.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <34E5FF9BBF6C4C4F9EDB5771EC3556A7@Hygon.cn>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: spam1.hygon.cn x9L39Bo0072446
X-DNSRBL: 
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gMjAxOS8xMC8yMCA2OjA0LCBBbGV4YW5kcmUgQmVsbG9uaSB3cm90ZToNCj4gT24gMTUvMTAv
MjAxOSAxNjowODoyNyswODAwLCBKaW5rZSBGYW4gd3JvdGU6DQo+PiAgIAlzYXZlX2ZyZXFfc2Vs
ZWN0ID0gQ01PU19SRUFEKFJUQ19GUkVRX1NFTEVDVCk7DQo+PiAtCUNNT1NfV1JJVEUoKHNhdmVf
ZnJlcV9zZWxlY3R8UlRDX0RJVl9SRVNFVDIpLCBSVENfRlJFUV9TRUxFQ1QpOw0KPj4gKw0KPj4g
KyNpZmRlZiBDT05GSUdfWDg2DQo+PiArCWlmIChib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0g
WDg2X1ZFTkRPUl9BTUQgfHwNCj4+ICsJICAgIGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciA9PSBY
ODZfVkVORE9SX0hZR09OKQ0KPj4gKwkJQ01PU19XUklURSgoc2F2ZV9mcmVxX3NlbGVjdCAmICh+
UlRDX0RWMCkpLCBSVENfRlJFUV9TRUxFQ1QpOw0KPiANCj4gVGhpcyBzaG91bGQgcHJvYmFibHkg
dXNlIH5SVENfRElWX1JFU0VUMi4NCg0KWWVzLCB+UlRDX0RJVl9SRVNFVDIgY2FuIGFjdHVhbGx5
IGFjaGlldmUgdGhlIHNhbWUgZWZmZWN0LCBiZWNhdXNlIG9mDQpiaXQ1LWJpdDYgaXMgZGVmaW5l
ZCBhcyByZXNlcnZlZC4NCg0KPj4gKwllbHNlDQo+PiArCQlDTU9TX1dSSVRFKChzYXZlX2ZyZXFf
c2VsZWN0IHwgUlRDX0RJVl9SRVNFVDIpLCBSVENfRlJFUV9TRUxFQ1QpOw0KPj4gKyNlbHNlDQo+
PiArCUNNT1NfV1JJVEUoKHNhdmVfZnJlcV9zZWxlY3QgfCBSVENfRElWX1JFU0VUMiksIFJUQ19G
UkVRX1NFTEVDVCk7DQo+PiArI2VuZGlmDQo+IA0KPiBBbHNvLCBsYXRlciB5b3UgaGF2ZToNCj4g
DQo+IENNT1NfV1JJVEUoc2F2ZV9mcmVxX3NlbGVjdCwgUlRDX0ZSRVFfU0VMRUNUKTsNCj4gDQo+
IFRoaXMgbWF5IHdyaXRlIGJpdDQgYWdhaW4gd2hpY2ggd291bGQgbWFrZSBtYzE0NjgxOF9nZXRf
dGltZSBmYWlsIHNvIHlvdQ0KPiBwcm9iYWJseSB3YW50IHRvIHVwZGF0ZSBzYXZlX2ZyZXFfc2Vs
ZWN0Lg0KDQpZZXMsIHRoYW5rcyBmb3IgcmVtaW5kaW5nIG1lLg0KDQotLSANCkJlc3QgUmVnYXJk
cywNCkppbmtlIEZhbi4=
