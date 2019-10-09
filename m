Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40274D05CD
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Oct 2019 05:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729688AbfJIDSv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Oct 2019 23:18:51 -0400
Received: from spam01.hygon.cn ([110.188.70.11]:62230 "EHLO spam1.hygon.cn"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726490AbfJIDSv (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 8 Oct 2019 23:18:51 -0400
Received: from MK-DB.hygon.cn ([172.23.18.60])
        by spam1.hygon.cn with ESMTP id x993I9X4008137;
        Wed, 9 Oct 2019 11:18:09 +0800 (GMT-8)
        (envelope-from fanjinke@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
        by MK-DB.hygon.cn with ESMTP id x993Hsub046203;
        Wed, 9 Oct 2019 11:17:55 +0800 (GMT-8)
        (envelope-from fanjinke@hygon.cn)
Received: from cncheex01.Hygon.cn (172.23.18.10) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Wed, 9 Oct 2019
 11:18:07 +0800
Received: from cncheex01.Hygon.cn ([172.23.18.10]) by cncheex01.Hygon.cn
 ([172.23.18.10]) with mapi id 15.01.1466.003; Wed, 9 Oct 2019 11:18:07 +0800
From:   Jinke Fan <fanjinke@hygon.cn>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        Wen Pu <puwen@hygon.cn>,
        "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
        "kim.phillips@amd.com" <kim.phillips@amd.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rtc: Fix the AltCentury value on AMD/Hygon platform
Thread-Topic: [PATCH v2] rtc: Fix the AltCentury value on AMD/Hygon platform
Thread-Index: AQHVfbwNh2t6OD3bgkOc8c92ZozDV6dP+FWAgAEmbYA=
Date:   Wed, 9 Oct 2019 03:18:07 +0000
Message-ID: <55aaed33-9f65-7580-74be-f5cd92c26e27@hygon.cn>
References: <20191008093712.102158-1-fanjinke@hygon.cn>
 <20191008094419.GT4254@piout.net>
In-Reply-To: <20191008094419.GT4254@piout.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.18.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <522CD2A2D093884EB8FAC17E0C1DA2BF@Hygon.cn>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: spam1.hygon.cn x993I9X4008137
X-DNSRBL: 
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gMjAxOS8xMC84IDE3OjQ0LCBBbGV4YW5kcmUgQmVsbG9uaSB3cm90ZToNCj4gT24gMDgvMTAv
MjAxOSAxNzozNzoxMiswODAwLCBKaW5rZSBGYW4gd3JvdGU6DQo+PiBXaGVuIHVzaW5nIGZvbGxv
d2luZyBvcGVyYXRpb25zOg0KPj4gICAJc2F2ZV9jb250cm9sID0gQ01PU19SRUFEKFJUQ19DT05U
Uk9MKTsNCj4+IC0JQ01PU19XUklURSgoc2F2ZV9jb250cm9sfFJUQ19TRVQpLCBSVENfQ09OVFJP
TCk7DQo+PiArCUNNT1NfV1JJVEUoKHNhdmVfY29udHJvbCB8IFJUQ19TRVQpLCBSVENfQ09OVFJP
TCk7DQo+IA0KPiBVbnJlbGF0ZWQgY2hhbmdlLg0KDQpPSywgdGhpcyBsaW5lIGNoYW5nZSB3aWxs
IGJlIGNhbmNlbGxlZCBpbiB0aGUgcGF0Y2ggdjMuDQoNCj4+ICAgCXNhdmVfZnJlcV9zZWxlY3Qg
PSBDTU9TX1JFQUQoUlRDX0ZSRVFfU0VMRUNUKTsNCj4+IC0JQ01PU19XUklURSgoc2F2ZV9mcmVx
X3NlbGVjdHxSVENfRElWX1JFU0VUMiksIFJUQ19GUkVRX1NFTEVDVCk7DQo+PiArDQo+PiArI2lm
IGRlZmluZWQoQ09ORklHX0NQVV9TVVBfQU1EKSB8fCBkZWZpbmVkKENPTkZJR19DUFVfU1VQX0hZ
R09OKQ0KPj4gKwlDTU9TX1dSSVRFKChzYXZlX2ZyZXFfc2VsZWN0ICYgKH5SVENfRFYwKSksIFJU
Q19GUkVRX1NFTEVDVCk7DQo+IA0KPiBUaGF0IGRvZXMgYnJlYWsgYWxsIHRoZSBvdGhlciB4ODYg
cGxhdGZvcm1zLg0KDQpZZXMsIGl0J3MgYSBtaXN0YWtlLiBJbiB0aGUgcGF0Y2ggdjMsIHRoZSBt
b2RpZmljYXRpb25zIHdpbGwgYmUNCmxpbWl0ZWQgdG8gQU1EL0h5Z29uIHZlbmRvciBpZC4NCg0K
LS0gDQpCZXN0IFJlZ2FyZHMsDQpKaW5rZSBGYW4NCg==
