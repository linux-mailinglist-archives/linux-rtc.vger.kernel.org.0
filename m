Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8867CD72D1
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2019 12:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbfJOKJH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Oct 2019 06:09:07 -0400
Received: from spam01.hygon.cn ([110.188.70.11]:19923 "EHLO spam2.hygon.cn"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727018AbfJOKJH (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 15 Oct 2019 06:09:07 -0400
Received: from MK-FE.hygon.cn ([172.23.18.61])
        by spam2.hygon.cn with ESMTP id x9FA8HvJ025917;
        Tue, 15 Oct 2019 18:08:17 +0800 (GMT-8)
        (envelope-from fanjinke@hygon.cn)
Received: from cncheex02.Hygon.cn ([172.23.18.12])
        by MK-FE.hygon.cn with ESMTP id x9FA85iU064248;
        Tue, 15 Oct 2019 18:08:05 +0800 (GMT-8)
        (envelope-from fanjinke@hygon.cn)
Received: from cncheex01.Hygon.cn (172.23.18.10) by cncheex02.Hygon.cn
 (172.23.18.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Tue, 15 Oct
 2019 18:08:16 +0800
Received: from cncheex01.Hygon.cn ([172.23.18.10]) by cncheex01.Hygon.cn
 ([172.23.18.10]) with mapi id 15.01.1466.003; Tue, 15 Oct 2019 18:08:16 +0800
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
Thread-Index: AQHVgy/RkjjnHG3zLEyv1IS/Xg7OVqda2DwAgAAcM4A=
Date:   Tue, 15 Oct 2019 10:08:16 +0000
Message-ID: <9eceb1b6-bd61-d48f-0bc8-ec5c9de5f25a@hygon.cn>
References: <20191015080827.11589-1-fanjinke@hygon.cn>
 <20191015082720.GW3125@piout.net>
In-Reply-To: <20191015082720.GW3125@piout.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.18.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <55A0941C8CBFE54FA3479EAD7AD6CCE6@Hygon.cn>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: spam2.hygon.cn x9FA8HvJ025917
X-DNSRBL: 
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gMjAxOS8xMC8xNSAxNjoyNywgQWxleGFuZHJlIEJlbGxvbmkgd3JvdGU6DQo+IE9oIGNvbWUg
b24sIHlvdSBzZW50IHRoYXQgcGF0Y2ggb25seSBhIHdlZWsgYWdvIGFuZCB2MiBoYWQgYSBzbyBv
YnZpb3VzDQo+IG1pc3Rha2UgdGhhdCBteSB0cnVzdCBpbiB5b3VyIGNvZGUgcXVhbGl0eSBpcyBu
b3cgdmVyeSBsb3cuDQpIaSBBbGV4YW5kcmUsDQoNClRoZSBwYXRjaCB2MyBoYXMgYmVlbiBjb21w
aWxlZCBmb3Igc3BhcmM2NCBhbmQgYWxwaGEgYXJjaGl0ZWN0dXJlcyB3aXRoOg0KICAtIEdDQ19W
RVJTSU9OPTcuNC4wIG1ha2UuY3Jvc3MgQVJDSD1zcGFyYzY0DQogIC0gR0NDX1ZFUlNJT049Ny40
LjAgbWFrZS5jcm9zcyBBUkNIPWFscGhhDQp0aGUgcmVzdWx0IHdhcyBwYXNzZWQuIEFuZCB0ZXN0
ZWQgb24gSHlnb24gcGxhdGZvcm0sIGl0IHdvcmtlZCB3ZWxsLg0KDQpBcyB5b3VyIGNvbW1lbnQs
IHRoZSBtb2RpZmljYXRpb24gd2lsbCBiZSBzdHJpY3RseSBsaW1pdGVkIHRvIEFNRCANCkVQWUMo
MTdoKSBhbmQgSHlnb24gQ1BVIGluIHRoZSBuZXh0IHZlcnNpb24uIEFsc28gSSB3aWxsIGRvIG1v
cmUgdGVzdHMgDQpvbiB0aGVzZSBwbGF0Zm9ybXMuDQoNCkFueSBtb3JlIHN1Z2dlc3Rpb25zPw0K
DQotLSANCkJlc3QgUmVnYXJkcywNCkppbmtlIEZhbg==
