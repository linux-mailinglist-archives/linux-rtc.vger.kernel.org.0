Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 461F761C22
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jul 2019 11:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbfGHJNX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Jul 2019 05:13:23 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:56992 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727065AbfGHJNX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Jul 2019 05:13:23 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x68967am006024;
        Mon, 8 Jul 2019 11:12:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=J+VrRoM1vmsyKivpX5U+CqP541ilP0xEicODEegVLtM=;
 b=PIV2XdbgB0aZJqgtreP6xTwlrWKCNkvJeRx2dKmHokXB9K9FELlV+YSQc6+QRoX/Me7z
 TDtZikvgNRGqiCMZRB6CxGHEcgaz716HWePA8rGEnMVFAgb6Jp7OzvWQw2lUc+ooOdFD
 P0QAYK42RYrC65eNtzvHzYcSo9p6i1felTNSB4wdhz+Vv4IvE/Jj5+3ZUGGWDBviHQOh
 NyJOFo8BoqHSL1kyigcxpIpdMnprg4MYIpTXZv+mDaEzkbA2VwNJXmZRdSyvdjWSE4FS
 TcTm26B+l+W5qLnlT9uiMEkQcH3zFSb5JwxnzketnNSAkFZWo9PJOWX8ha62R74IJ8TL pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2tjh405r6f-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 08 Jul 2019 11:12:54 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4971D34;
        Mon,  8 Jul 2019 09:12:53 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07A2D2763;
        Mon,  8 Jul 2019 09:12:53 +0000 (GMT)
Received: from SFHDAG3NODE2.st.com (10.75.127.8) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 8 Jul
 2019 11:12:52 +0200
Received: from SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96]) by
 SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96%20]) with mapi id
 15.00.1347.000; Mon, 8 Jul 2019 11:12:52 +0200
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
To:     Markus Elfring <Markus.Elfring@web.de>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Russell King <linux@armlinux.org.uk>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rtc: stm32: One condition check and function call less
 in stm32_rtc_set_alarm()
Thread-Topic: [PATCH v2] rtc: stm32: One condition check and function call
 less in stm32_rtc_set_alarm()
Thread-Index: AQHVNWk64H5f1akvVEOEc4o7Pyqv/6bATj4A
Date:   Mon, 8 Jul 2019 09:12:52 +0000
Message-ID: <b614006a-17ac-e738-a3f3-08649f69a42c@st.com>
References: <f04277da-8a98-473e-2566-ac7846f9f8e1@web.de>
 <20190707211638.sehikkear25dffah@shell.armlinux.org.uk>
 <4da614a4-83c6-548c-a112-033b846c561b@web.de>
In-Reply-To: <4da614a4-83c6-548c-a112-033b846c561b@web.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C37AB1342C2294A8941E133C33BA759@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-08_02:,,
 signatures=0
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gNy84LzE5IDEwOjQyIEFNLCBNYXJrdXMgRWxmcmluZyB3cm90ZToNCj4gRnJvbTogTWFya3Vz
IEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0Pg0KPiBEYXRlOiBNb24sIDgg
SnVsIDIwMTkgMTA6MjY6NDcgKzAyMDANCj4gDQo+IEEgY29uZGl0aW9uIGNoZWNrIHdhcyByZXBl
YXRlZCBpbiB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uIGRlc3BpdGUgb2YNCj4gYSBjb3Jy
ZXNwb25kaW5nIGNoZWNrIGluIHRoZSBzdG0zMl9ydGNfYWxhcm1faXJxX2VuYWJsZSgpIGZ1bmN0
aW9uLg0KPiBUaHVzIGRlbGV0ZSByZWR1bmRhbnQgc291cmNlIGNvZGUgaGVyZS4NCj4gDQo+IFN1
Z2dlc3RlZC1ieTogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+DQo+IExpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA3MDcyMTE2Mzguc2VoaWtrZWFyMjVk
ZmZhaEBzaGVsbC5hcm1saW51eC5vcmcudWsvDQo+IA0KPiBUaGlzIGlzc3VlIHdhcyBkZXRlY3Rl
ZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBzb2Z0d2FyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4NCg0KUmV2aWV3
ZWQtYnk6IEFtZWxpZSBEZWxhdW5heSA8YW1lbGllLmRlbGF1bmF5QHN0LmNvbT4NCg0KPiAtLS0N
Cj4gDQo+IHYyOg0KPiBSdXNzZWxsIEtpbmcgcG9pbnRlZCB0aGUgY2hhbmdlIHBvc3NpYmlsaXR5
IG91dCB0byBvbWl0IGEgY29uZGl0aW9uIGNoZWNrDQo+IGF0IHRoaXMgcGxhY2UuDQo+IA0KPiAN
Cj4gICBkcml2ZXJzL3J0Yy9ydGMtc3RtMzIuYyB8IDYgKy0tLS0tDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcnRjL3J0Yy1zdG0zMi5jIGIvZHJpdmVycy9ydGMvcnRjLXN0bTMyLmMNCj4gaW5kZXgg
OGU2YzliM2JjYzI5Li43NzNhMTk5MGI5M2YgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcnRjL3J0
Yy1zdG0zMi5jDQo+ICsrKyBiL2RyaXZlcnMvcnRjL3J0Yy1zdG0zMi5jDQo+IEBAIC01MTksMTEg
KzUxOSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcnRjX3NldF9hbGFybShzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBydGNfd2thbHJtICphbHJtKQ0KPiAgIAkvKiBXcml0ZSB0byBBbGFybSByZWdp
c3RlciAqLw0KPiAgIAl3cml0ZWxfcmVsYXhlZChhbHJtYXIsIHJ0Yy0+YmFzZSArIHJlZ3MtPmFs
cm1hcik7DQo+IA0KPiAtCWlmIChhbHJtLT5lbmFibGVkKQ0KPiAtCQlzdG0zMl9ydGNfYWxhcm1f
aXJxX2VuYWJsZShkZXYsIDEpOw0KPiAtCWVsc2UNCj4gLQkJc3RtMzJfcnRjX2FsYXJtX2lycV9l
bmFibGUoZGV2LCAwKTsNCj4gLQ0KPiArCXN0bTMyX3J0Y19hbGFybV9pcnFfZW5hYmxlKGRldiwg
YWxybS0+ZW5hYmxlZCk7DQo+ICAgZW5kOg0KPiAgIAlzdG0zMl9ydGNfd3ByX2xvY2socnRjKTsN
Cj4gDQo+IC0tDQo+IDIuMjIuMA0KPiANCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQo+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0DQo+
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwNCj4g
