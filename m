Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16D9A1A7652
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2020 10:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437009AbgDNImP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Apr 2020 04:42:15 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:24048 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436845AbgDNImN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Apr 2020 04:42:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1586853732; x=1618389732;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YyqlXQy+5+tIBi9vWs7cGdgbh2uZRxgJymCKCnTpy+M=;
  b=RVp2XAGCDQ1tyL9alUTYoybV6+0al+Epao9VMpXwX3wi5CkzYeizdGay
   I3gN9vfJoETsuvX9uqcdVQrcPZ2KnYxv6tiECDUMs0CT3LxY47riAQbPW
   /09719rW1LJQv1EaSU0NxuFKG4ncKwSA2Glafzqr+WTlTSiKGT9aciNs7
   3SEbHCme64h0+AZD5qhQtIw4l0GyXot4OdC3zV/TiJPTOdv+fWS3UKfFm
   yGWmyEjQj3TGZxUFakg823SHqVEFgvGAqPALtsnxcfXY1ExitSKviz2rR
   DifDGmEEB92MktEx2I4qez7sGbc5X6cXOf4aTB/NC96GNKIqXRK6sTn75
   Q==;
IronPort-SDR: v4RgAcfhcgbYLdiH05blLF7t1UOCsUz8+DChRMq4qkHJRzWoxB9OJdL5Ht9IS4HZEH6WkaO4G3
 xbtMt1jjbQudI5fCsMyrt7N6DwHROtWYHonELN1m2q/pMOkNaYT0TdJqw9DSfEK00f0giUCImN
 2j6XZgS6k89EzFcFcX81Vb6T+2pumbbgPPQ5/w+d3onucoWH1p/3Dq4doa5GF0cK+8qlh+17xn
 4H7tSHalQiXe5RGLBtnlOHCh3bPWZ2VlQ6B9VyxeN1OP2XFA7TGWGReVxpab48XIr0zmF0Jx3n
 nE4=
X-IronPort-AV: E=Sophos;i="5.72,382,1580799600"; 
   d="scan'208";a="9052643"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Apr 2020 01:42:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 14 Apr 2020 01:42:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 14 Apr 2020 01:42:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9Fn42FfZuwhniiAYbK2AwV8Z8DZyrpnDKj9mfQg+GRdAQpWthAvZWzl44qak6LxhVu3bWwnV0E1hmIZiY1f7DlGUEaQHJAxcXisaJb0VPBfwvjGwEwqcRRmfhHh9pNkQspnbtXN3G0JbTT+yug2XjTEehKPQNwMhe5ziuZDa8LTRDcMnBYb8znFNN8xBqOPWkHX2WOfvgXEYubKXSLMq66Q+bImwSjU9WNc9XvBW6pYSbXFDHVRwqxbcrbh1s7Dope4ytHh/eRJEcsxVhbW3tEjq3HSslYA7O4acX9V9qIxg0bByk41Gq7r3o/DbqpPR5YDfKmRkaF0HgR7xJNTcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyqlXQy+5+tIBi9vWs7cGdgbh2uZRxgJymCKCnTpy+M=;
 b=AKmzy/Lx6pvUPy7pHfE/hR1IKD2+FFyqz+HiyBRP7Y110mdljJGdRMG0pKDA8qgsAHkpA7dJ2eeRnx4mVna85Vx5p4UCcGLSDIbptcrHmRUPCCwnVrMS22n5qX7R0RJltmgHb2gMLBNSphDt5pBK10q8v5dmh4ufCuMLykaQzB/H9goLrC/8EAr+hbJY7VsDzEXcN24jSVR7Z62Wky3ZyVFzVeBXqNDKdfcCZseI5heID2V1CKc37laj9q2/L7yvxP7Mxvc5ONH54aRATuq9wEvJ3fc06BnLawLhvjs1oLArwvu778fAOvutG8vWTWYgYcU5P6V7ouPsliAtWke6Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyqlXQy+5+tIBi9vWs7cGdgbh2uZRxgJymCKCnTpy+M=;
 b=QSsHB+AA1ULtYkB09qBMp4w11qcxzfacvpjJLXGkdUaWeivriJIm4S+Ioish+lMX7SpoOEr/r2vUPgYsCAWuZRD6zFV79Y4s0ujf+D7mLOLqzQ5FvzuYd26c7Sn2LxSLirO9mOyvYcwKrpsjRn2Ee2RB3Dwb/Km5cVHDCjc+L5I=
Received: from DM6PR11MB3420.namprd11.prod.outlook.com (2603:10b6:5:69::31) by
 DM6PR11MB3962.namprd11.prod.outlook.com (2603:10b6:5:192::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.26; Tue, 14 Apr 2020 08:42:08 +0000
Received: from DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::91cb:6555:db9b:53fa]) by DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::91cb:6555:db9b:53fa%7]) with mapi id 15.20.2900.028; Tue, 14 Apr 2020
 08:42:08 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <alexandre.belloni@bootlin.com>
CC:     <a.zummo@towertech.it>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <Nicolas.Ferre@microchip.com>,
        <Ludovic.Desroches@microchip.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <maz@kernel.org>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] ARM: dts: sam9x60: add rtt
Thread-Topic: [PATCH 4/5] ARM: dts: sam9x60: add rtt
Thread-Index: AQHWEXCuyP8yxRbKYUqiuXPeALwxyw==
Date:   Tue, 14 Apr 2020 08:42:08 +0000
Message-ID: <3116d1fc-af96-1e0c-aa07-3b34cbd58209@microchip.com>
References: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
 <1586536019-12348-5-git-send-email-claudiu.beznea@microchip.com>
 <20200410222658.GB3628@piout.net>
 <c4d46198-488b-c5d6-2a66-865a16840dc4@microchip.com>
 <20200413104652.GE3628@piout.net>
In-Reply-To: <20200413104652.GE3628@piout.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Claudiu.Beznea@microchip.com; 
x-originating-ip: [86.120.235.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 013119d4-b562-4d37-51ce-08d7e04fb7c7
x-ms-traffictypediagnostic: DM6PR11MB3962:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3962783B69C37EB3E839ED0387DA0@DM6PR11MB3962.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0373D94D15
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(366004)(6506007)(53546011)(186003)(5660300002)(64756008)(7416002)(31686004)(6486002)(76116006)(66446008)(2906002)(26005)(6512007)(66476007)(66946007)(6916009)(66556008)(8936002)(498600001)(36756003)(54906003)(4326008)(71200400001)(2616005)(81156014)(91956017)(966005)(86362001)(31696002)(8676002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ISctB5nizLt110GeaQxYM2RymcColc5kT4AFlycr+FXOZpdI69iNFiBx9pLwajcPJppkgxkz0wCUMfhQPeBMrFl0hV9xORjNxyuGxwlAhHQquYFFySBGSIK60K99v8O2Ycdz797y2t0e04btdjJqhTprca6TSHbG5NrH4L4P0wEXDzV4w8Tx4AuSadhqOW0+FAqZ/i2Z6ZCHpRn9hiZp/wCENrhhkWKglRTdoesNTsXEr4WbaodNGTahlOoz8m4VO8A9MI5zPbo+RKTk/m/r35hteTZPU+SMEVtLrnjyBK9MH75WxVa9u2arwqdGXRhTGOevIzDv4mKR14wq2GJh9O4Y8ecgoao/SiJJbP8CwAw/dsGa0b/KUy6iASVdxK5FmQeDq6SX+FSKGnT5FHDQliqKqbkZdPu/nd5SDHlbAHOLUmoepOyaZCgcUPJv0km0pPbxK9iv7YCFcCMD4ZU358rnaQhUJkM6UaaY1yOXSC0Ckim+bnDaEqKECkrT7cAeOG4aqd0xX/tgS2GT9Bu8LQ==
x-ms-exchange-antispam-messagedata: MwIS9kDZotA19AurzirqH41oxj0KXddKOkRwblq0C3+OeCZgMaQrzR61YZmiuW56nvyEL/9DTwXsJGfKK2KuT6tQHEnAIyU8fbjtIjj+ucd7CYf9Yv50Pqll5Zrvizqc2THUH6clfA6dTJ1pq3FGCw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F36CB46DEE071B4BB9A3E12636A192D4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 013119d4-b562-4d37-51ce-08d7e04fb7c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 08:42:08.4616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z8yjNyIz+OqCl2srr3rOSs6cTmUa+bu0wqrzoXKusIsZWL4d8PqadMpZf0uqG2PxoIqpNfzjO8jKAJSXMYpcMIHsRnJp+UcEZwFC7j7gMfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3962
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

DQoNCk9uIDEzLjA0LjIwMjAgMTM6NDYsIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KPiBFWFRF
Uk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDEzLzA0LzIwMjAgMDg6NTE6
MTIrMDAwMCwgQ2xhdWRpdS5CZXpuZWFAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+DQo+Pg0KPj4g
T24gMTEuMDQuMjAyMCAwMToyNiwgQWxleGFuZHJlIEJlbGxvbmkgd3JvdGU6DQo+Pj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4NCj4+PiBPbiAxMC8wNC8yMDIwIDE5OjI2
OjU4KzAzMDAsIENsYXVkaXUgQmV6bmVhIHdyb3RlOg0KPj4+PiBBZGQgUlRULg0KPj4+Pg0KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlw
LmNvbT4NCj4+Pj4gLS0tDQo+Pj4+ICBhcmNoL2FybS9ib290L2R0cy9hdDkxLXNhbTl4NjBlay5k
dHMgfCA1ICsrKysrDQo+Pj4+ICBhcmNoL2FybS9ib290L2R0cy9zYW05eDYwLmR0c2kgICAgICAg
fCA3ICsrKysrKysNCj4+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0KPj4+
Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXQ5MS1zYW05eDYwZWsuZHRz
IGIvYXJjaC9hcm0vYm9vdC9kdHMvYXQ5MS1zYW05eDYwZWsuZHRzDQo+Pj4+IGluZGV4IGFiM2Qy
ZDlhNDIwYS4uNDAyMGU3OWE5NThlIDEwMDY0NA0KPj4+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0
cy9hdDkxLXNhbTl4NjBlay5kdHMNCj4+Pj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXQ5MS1z
YW05eDYwZWsuZHRzDQo+Pj4+IEBAIC02MTcsNiArNjE3LDExIEBADQo+Pj4+ICAgICAgIH07DQo+
Pj4+ICB9Ow0KPj4+Pg0KPj4+PiArJnJ0dCB7DQo+Pj4+ICsgICAgIGF0bWVsLHJ0dC1ydGMtdGlt
ZS1yZWcgPSA8JmdwYnIgMHgwPjsNCj4+Pj4gKyAgICAgc3RhdHVzID0gIm9rYXkiOw0KPj4+DQo+
Pj4gSXMgdGhlcmUgYW55IHBvaW50IHVzaW5nIGEgZ3BiciByZWdpc3RlciB3aGlsZSB0aGVyZSBp
cyBhbHJlYWR5IGEgbXVjaA0KPj4+IGJldHRlciBSVEMgaW4gdGhlIHN5c3RlbT8NCj4+DQo+PiBP
bmx5IHRvIGhhdmUgaXQgYWxzbyBlbmFibGVkLg0KPj4NCj4gDQo+IFdoeSB3b3VsZCBvbmUgdXNl
IHRoZSBSVFQgd2hpbGUgdGhlIFJUQyBpcyBmYXIgc3VwZXJpb3I/DQoNCkkgZGlkbid0IGVuYWJs
ZWQgdGhpcyBmb3IgYSBwYXJ0aWN1bGFyIHVzZSBjYXNlLCBidXQ6IGNvdWxkbid0IHRoaXMgYmUg
dXNlZA0KYnkgc29tZSB1c2VyIHRoYXQgd2FudHMgdG8gZ2VuZXJhdGUgbXVsdGlwbGUgYWxhcm1z
PyBmcm9tIG11bHRpcGxlIFJUQ3M/DQoNCk1vcmVvdmVyLCB0aGlzIElQJ3MgY291bnRlciBoYXMg
dGhlIHBvc3NpYmlsaXR5IG9mIGJlaW5nIGNsb2NrZWQgYXQgMUh6Lg0KQ291bGRuJ3QgdGhpcyBt
aW5pbWl6ZSB0aGUgcG93ZXIgY29uc3VtcHRpb24gd2hpbGUgYmVpbmcgaW4gYSBwb3dlciBzYXZp
bmcNCm1vZGU/DQoNCj4gDQo+Pj4NCj4+PiBJbiBhbnkgY2FzZSwgdGhpcyBkaWZmIHNob3VsZCBi
ZSBtZXJnZSB3aXRoIHRoZSBvdGhlciBhdDkxLXNhbTl4NjBlay5kdHMNCj4+PiBjaGFuZ2UgaW5z
dGVhZCBvZiBiZWluZyB3aXRoIHRoZSBkdHNpIGNoYW5nZS4NCj4+DQo+PiBUaGUgY2hhbmdlcyBp
biB0aGlzIHBhdGNoIGFyZSByZWxhdGVkIHRvIGVuYWJsaW5nIHRoZSBSVFQuIFRoZSBvdGhlciBk
dHMNCj4+IGNoYW5nZSBpcyByZWxhdGVkIHRvIGVuYWJsaW5nIGdwYnIuIFRoZSBSVFQgdXNlcyB0
aGF0IGVuYWJsZWQgZ3BiciAtPiBvbmUNCj4+IGNoYW5nZSBwZXIgcGF0Y2guDQo+Pg0KPj4gSWYg
eW91IHN0aWxsIHdhbnQgdG8gbWVyZ2UgdGhlbiwgSSdsbCBkbyBpdCwgYnV0IHRoZW4gaXQgYmVj
b21lcyBtaXhlZC4NCj4+DQo+IA0KPiBUaGlzIHBhdGNoIGlzIGFscmVhZHkgbWl4aW5nIGFkZCB0
aGUgZ3BiciBpbiBzYW05eDYwZWsgYW5kIGFkZCB0aGUgbm9kZQ0KPiBpbiBzYW05eDYwLmR0c2kg
d2hpY2ggaXMgd29yc2UuDQoNClRoaXMgcGF0Y2ggaXMgbGlrZSB0aGlzOg0KDQpkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXQ5MS1zYW05eDYwZWsuZHRzDQpiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2F0OTEtc2FtOXg2MGVrLmR0cw0KaW5kZXggYWIzZDJkOWE0MjBhLi40MDIwZTc5YTk1OGUg
MTAwNjQ0DQotLS0gYS9hcmNoL2FybS9ib290L2R0cy9hdDkxLXNhbTl4NjBlay5kdHMNCisrKyBi
L2FyY2gvYXJtL2Jvb3QvZHRzL2F0OTEtc2FtOXg2MGVrLmR0cw0KQEAgLTYxNyw2ICs2MTcsMTEg
QEANCiAJfTsNCiB9Ow0KDQorJnJ0dCB7DQorCWF0bWVsLHJ0dC1ydGMtdGltZS1yZWcgPSA8Jmdw
YnIgMHgwPjsNCisJc3RhdHVzID0gIm9rYXkiOw0KK307DQorDQogJnNodXRkb3duX2NvbnRyb2xs
ZXIgew0KIAlhdG1lbCxzaGR3Yy1kZWJvdW5jZXIgPSA8OTc2PjsNCiAJc3RhdHVzID0gIm9rYXki
Ow0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3NhbTl4NjAuZHRzaSBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3NhbTl4NjAuZHRzaQ0KaW5kZXggMzI2YjM5MzI4YjU4Li5lMWQ4ZTNhNGNiMGIg
MTAwNjQ0DQotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zYW05eDYwLmR0c2kNCisrKyBiL2FyY2gv
YXJtL2Jvb3QvZHRzL3NhbTl4NjAuZHRzaQ0KQEAgLTY2MSw2ICs2NjEsMTMgQEANCiAJCQkJc3Rh
dHVzID0gImRpc2FibGVkIjsNCiAJCQl9Ow0KDQorCQkJcnR0OiBydHRAZmZmZmZlMjAgew0KKwkJ
CQljb21wYXRpYmxlID0gIm1pY3JvY2hpcCxzYW05eDYwLXJ0dCI7DQorCQkJCXJlZyA9IDwweGZm
ZmZmZTIwIDB4MjA+Ow0KKwkJCQlpbnRlcnJ1cHRzID0gPDEgSVJRX1RZUEVfTEVWRUxfSElHSCA3
PjsNCisJCQkJY2xvY2tzID0gPCZjbGszMmsgMD47DQorCQkJfTsNCisNCg0KSXQgZG9lc24ndCBh
ZGRzIHRoZSBHUEJSIGluIHNhbTl4NjBlaywgaXQgYWRkcyBydHQgaW4gc2FtOXg2MGVrIHdoaWNo
IHVzZXMNCkdQQlIuDQoNCj4gDQo+IEp1c3QgaGF2ZSBvbmUgcGF0Y2ggYWRkaW5nIHRoZSBydHQg
bm9kZSB0byB0aGUgc2FtOXg2MC5kdHNpIGFuZCB0aGVuIGENCj4gcGF0Y2ggYWRkaW5nIHRoZSBS
VFQgdG8gc2FtOXg2MGVrLg0KDQpPaywgSSB1bmRlcnN0YW5kIHRoaXMuDQoNCj4gQmVjYXVzZSB0
aGUgUlRUIHVzZXMgdGhlIGdwYnIsIGl0IGlzDQo+IGEgZ29vZCB0aW1lIHRvIGFkZCBlbmFibGUg
dGhlIGdwYnIsIHRoaXMgaXMgYSBzaW5nbGUgZnVuY3Rpb25uYWwgY2hhbmdlLg0KPiANCj4gTGV0
J3Mgc2F5IHRoYXQgZm9yIHNvbWUgcmVhc29uLCB0aGUgUlRUIHBhdGNoIG9uIHNhbTl4NjBlayBo
YXMgdG8gYmUNCj4gcmV2ZXJ0ZWQsIHRoZW4gdGhlIFJUVCBub2RlIGlzIHN0aWxsIGRlZmluZWQg
d2hpY2ggaXMgZ29vZCBmb3IgYWxsIHRoZQ0KPiBvdGhlciBldmVudHVhbCB1c2Vycy4NCg0KUlRU
IG5vZGUgd291bGQgc3RpbGwgYmUgZGVmaW5lZCBidXQgR1BCUiBub2RlIHdpbGwgbm90IGJlIGVu
YWJsZWQuDQoNCklmIFJUVCBwYXRjaCBjb250YWlucyB0aGlzIGNoYW5nZSB0aGF0IEkgdW5kZXJz
dGFuZCB5b3Ugd2FudCBtZSB0byBtZXJnZSBoZXJlOg0KDQorJmdwYnIgew0KKwlzdGF0dXMgPSAi
b2theSI7DQorfTsNCisNCg0KdGhlbiwgdGhlb3JldGljYWxseSwgc29tZSBvdGhlciBJUHMgdXNp
bmcgdGhlIEdQQlIgKFJUQyBoYXZlIHRoZQ0KcG9zc2liaWxpdHkgb2YgZG9pbmcgdGhpcyksIG1h
eSBiZSBicm9rZW4gYnkgcmV2ZXJ0aW5nIHRoZSBSVFQgcGF0Y2ggdGhhdA0KaW5jbHVkZXMgdGhl
IEdQQlIgZW5hYmxpbmcgcGF0Y2guDQoNCj4gDQo+IA0KPiAtLQ0KPiBBbGV4YW5kcmUgQmVsbG9u
aSwgQm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0
dHBzOi8vYm9vdGxpbi5jb20NCj4g
