Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C128F13118D
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jan 2020 12:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgAFLpG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 6 Jan 2020 06:45:06 -0500
Received: from spam01.hygon.cn ([110.188.70.11]:25091 "EHLO spam2.hygon.cn"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725787AbgAFLpG (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 6 Jan 2020 06:45:06 -0500
Received: from MK-FE.hygon.cn ([172.23.18.61])
        by spam2.hygon.cn with ESMTP id 006BiZ86005952;
        Mon, 6 Jan 2020 19:44:35 +0800 (GMT-8)
        (envelope-from fanjinke@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
        by MK-FE.hygon.cn with ESMTP id 006BiYZh051074;
        Mon, 6 Jan 2020 19:44:34 +0800 (GMT-8)
        (envelope-from fanjinke@hygon.cn)
Received: from cncheex01.Hygon.cn (172.23.18.10) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Mon, 6 Jan 2020
 19:44:35 +0800
Received: from cncheex01.Hygon.cn ([172.23.18.10]) by cncheex01.Hygon.cn
 ([172.23.18.10]) with mapi id 15.01.1466.003; Mon, 6 Jan 2020 19:44:35 +0800
From:   Jinke Fan <fanjinke@hygon.cn>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "hwentlan@amd.com" <hwentlan@amd.com>,
        "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
        "kim.phillips@amd.com" <kim.phillips@amd.com>
Subject: Re: [PATCH] rtc: cmos: Revert "rtc: Fix the AltCentury value on
 AMD/Hygon platform"
Thread-Topic: [PATCH] rtc: cmos: Revert "rtc: Fix the AltCentury value on
 AMD/Hygon platform"
Thread-Index: AQHVwrfTVKk+wf1rp0W1bhQdWLaOKafdAcgA
Date:   Mon, 6 Jan 2020 11:44:34 +0000
Message-ID: <fe3c4660-090a-19ea-4dc6-87538c7d7afa@hygon.cn>
References: <20200104043110.707810-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20200104043110.707810-1-alexandre.belloni@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.18.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <10097DF8442EE64D9FDF96CB3582539D@Hygon.cn>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: spam2.hygon.cn 006BiZ86005952
X-DNSRBL: 
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgQWxleGFuZHJlLA0KDQpPbiAyMDIwLzEvNCAxMjozMSwgQWxleGFuZHJlIEJlbGxvbmkgd3Jv
dGU6DQo+IFRoZXJlIGFyZSBtdWx0aXBsZSByZXBvcnRzIG9mIHRoaXMgcGF0Y2ggYnJlYWtpbmcg
UlRDIHRpbWUgc2V0dGluZyBmb3IgQU1EDQo+IHBsYXRmb3Jtcy4NCj4gDQpBZnRlciBkaWdnaW5n
IGludG8gdGhpcyBpc3N1ZXMsIHdlIHN1c3BlY3QgaXQgcmVsYXRlZCB0byBCSU9TIHVwZ3JhZGUs
IA0KV2hpY2ggdXBncmFkZSBBTTQgUEkgZnJvbSBBR0VTQSAxLjAuMC4zQUJCQSB0byBBTTQgY29t
Ym8gUEkgMS4wLjAuNCBwYXRjaCBCLg0KU2VlbWVkIHRoaXMgUEkgdXBncmFkZSBtYWtlcyB0aGlz
IHBhdGNoIGNhbid0IHdvcmsgYXMgZXhwZWN0ZWQuDQoNCi0tIA0KQmVzdCByZWdhcmRzLg0KSmlu
a2UgRmFuDQo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgN2FkMjk1ZDUxOTZhNThjMjJhYmVjZWY2MmRk
NGY5OWUyZjg2ZTgzMS4NCj4gDQo+IENjOiBKaW5rZSBGYW4gPGZhbmppbmtlQGh5Z29uLmNuPg0K
PiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yL0NBQlhHQ3NNTG9iMERDMjVKUzh3d0FZ
eWRuRG9IQlNvTWgyX1lMUGZxbTNUVHZERS1ad0BtYWlsLmdtYWlsLmNvbQ0KPiBGaXhlczogN2Fk
Mjk1ZDUxOTZhICgicnRjOiBGaXggdGhlIEFsdENlbnR1cnkgdmFsdWUgb24gQU1EL0h5Z29uIHBs
YXRmb3JtIikNCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5i
ZWxsb25pQGJvb3RsaW4uY29tPg0KPiAtLS0=
