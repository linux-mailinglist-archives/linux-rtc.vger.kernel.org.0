Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 198EE1A7A6B
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2020 14:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729892AbgDNMNx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Apr 2020 08:13:53 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:39227 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729799AbgDNMNu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Apr 2020 08:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1586866429; x=1618402429;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Yp0Wt+g6nKCxTjnWZD5r9njz9ZUGFJHI/hM5bHlZy5U=;
  b=Ig6Kmp0SukteHGzYXcTo3llGtJKkvk9aZoYV7u8LgvU+xz2cb66Vz/h/
   U3T12r/E7jJylFLLz3jV3PznjD2Q9O0DcMtKcm9ZQnlGEDpJ4vco2euke
   nglVN7CHyRGjb3m9ycs015USi1DhqFmDyEv8nrGAJ0+IhlqNpMdI/Z0Mb
   D5/7evKB+pJW4FK7Autmwydm7DugtoQ4zN0P4daooGYJL96Xwl4Rculwu
   0cA5gkCUApf8zGJlZ5f1k8dbnL9wNHxsZ+8IeiU7zlnYEgYQBJxAQdOvI
   3Nd/VqqfqxQ8CYZHkIjStpqU/XJEVk54dp/VPdvWhQxg5IS2Uiphcb8rO
   Q==;
IronPort-SDR: +TSyZYp0sij5y5X1jFmMz0AbmKfbRqgRKuq2HIqxSRjBCYhNpwXpHezO/R8yG18CVytNiyPBcm
 PL+PynfS8r1OW0BBPyhQ4/mjHdmaLVnIwGtbRVelGzCWj0JwWmiTIzkIuwYrNkPQa8yzXffL22
 6yIlylBTm4em1Lk2hzU1O8oAOvnia9qbeL6CcPXLgEuAg0Y9jLEieZh+wiDiauPl6CaQWS41zW
 67xKYrs75IAnH//J6JhpeIeqhUX1fWFaiLYjPHhCm53Ec8ETFQc9swenfd26aGEW3+UJcNMqwI
 UrE=
X-IronPort-AV: E=Sophos;i="5.72,382,1580799600"; 
   d="scan'208";a="9072711"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Apr 2020 05:13:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 14 Apr 2020 05:13:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 14 Apr 2020 05:13:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1tOx8y/qucLI7zqbWRIbIpI9qEVn4xwCU8vVIEMXLYtpVPbsFsKfZQK6QY9hrDgPhzPVywn3gkV92JaQ3EgY+aI4qy3ekh0um7DH8jGnlNpkk6ahGIxzCC4D3YiYQAbK/6TbQGnTpF3WlLPchthvs4pttIXGmQqQ2tmarpL543u5A9RH4O8MQgl1EfsP5SCefLhzH2aqkOViMBno9mO0OREd1fZWy0TiReex/0ZTqdsILIzUM2tWsbEmA+U5K7U0hJiXCzKiHE5/6ryLLJTaa3XKULuthBM/t20uNkIyBlCWPIdNRgvlfW/yrd3d7nWF7d3SWxU9jtw8I4Jr0rm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yp0Wt+g6nKCxTjnWZD5r9njz9ZUGFJHI/hM5bHlZy5U=;
 b=CF+BCK9YqX8ucYjWSoZnng/SFqHoFh3P+Jz5LsqIPStAEaLUBBwxuFqSHEx1E7pat33ZeTM4hAdSbrBecJkgVb8CGK8n+WeCF6UoDjJ29VmYyyW/beXKXUJ2ze10hNvoFWidn3NzDr/wKcaoriZ54OeMZcnPyIupSY9G+qh6NvDUA/do0R7bgff7RZBYU8Sg1oIFoPD9t9IlwpJZdlzFhzsMZyCRmMIRoYlo/7Uti+i8Wa0uj3fI/RMp11oaL7gY2v8CogOPgbNwZ+2kqYqHlGaCqyMc88e7bsgEM35qngxoSE1m40wnVWllbilJ+0vG5ngLZ32zQ3H7MkXskLjoqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yp0Wt+g6nKCxTjnWZD5r9njz9ZUGFJHI/hM5bHlZy5U=;
 b=fQZfQX049RxVtANdV2aUGbWjfGM5p0aplgjKGa9zXXJWQ1giDnMl9/z3o430aMwAIT1csCudpwYdfCcBonAOr53u0qctofrmIMyCepp/YnLR+/4Gr7l7KgWLkdZoNqIS2bjDMx6DBjkKzL3kcwjwm8ABHp4USiFaPBazppXk5gI=
Received: from DM6PR11MB3420.namprd11.prod.outlook.com (2603:10b6:5:69::31) by
 DM6PR11MB4707.namprd11.prod.outlook.com (2603:10b6:5:2a6::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.28; Tue, 14 Apr 2020 12:13:47 +0000
Received: from DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::91cb:6555:db9b:53fa]) by DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::91cb:6555:db9b:53fa%7]) with mapi id 15.20.2900.028; Tue, 14 Apr 2020
 12:13:47 +0000
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
Date:   Tue, 14 Apr 2020 12:13:46 +0000
Message-ID: <a07d841e-efa9-6c01-69e2-0ed33f9759c5@microchip.com>
References: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
 <1586536019-12348-5-git-send-email-claudiu.beznea@microchip.com>
 <20200410222658.GB3628@piout.net>
 <c4d46198-488b-c5d6-2a66-865a16840dc4@microchip.com>
 <20200413104652.GE3628@piout.net>
 <3116d1fc-af96-1e0c-aa07-3b34cbd58209@microchip.com>
 <20200414111600.GE34509@piout.net>
In-Reply-To: <20200414111600.GE34509@piout.net>
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
x-ms-office365-filtering-correlation-id: 29e2f627-24f5-42d5-4f92-08d7e06d489b
x-ms-traffictypediagnostic: DM6PR11MB4707:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4707FD3554A80DC7E6755FEB87DA0@DM6PR11MB4707.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0373D94D15
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(366004)(346002)(396003)(376002)(39840400004)(136003)(316002)(478600001)(54906003)(4326008)(26005)(8936002)(81156014)(71200400001)(86362001)(53546011)(6506007)(31686004)(36756003)(6486002)(66556008)(66476007)(6512007)(66946007)(91956017)(76116006)(2616005)(66446008)(64756008)(186003)(7416002)(6916009)(8676002)(966005)(2906002)(5660300002)(31696002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VsH+a4yBr74lwB42DfJyotIld8kAbOTYuRAQjg3CliwmoKMceNUWxkB7GHGlAp5mRSo/woZOEixmz8x5rg/cf1bWNIs8nCXwFRY9kZRqP8YGNrIcnQvNssOcsr63zX260k9KK5t4HH37m9Es1iVuq5dITn7SglYpOEFnlZX2Su5zcZr62jc6wk4rkrXzs7Pmmi8zeoZjw7R4WrA3VMxFud6F0N33hnc2tSfoSdJWe/5aplBOPL9s0Z6K4FDLOpn92tadiZ5gZPWNeG1tUX5semxhDE8XcGGyT8D2V1ocwRWAoD3eznvg+erWDrHdkdUe1nSSHlvJjQ+AIwwsGKaObugQCblVd9dye0xhdjEl+ym8xObY9sxeKuV1bLWdt2ySYPchQw0BDrwIe4zm0ARzXuZo5KLHq+JeVsbhc5QgG3BnOUXlL3wmk7q+WDcpGZTDHjM2vk+LkSLBARi0oRkQ6q3+K4iI9zkQ1nX21MpRONiAqD3BzT57iZtWaUxczVrpr6h4fpdbtRhGNgAvFEV/hw==
x-ms-exchange-antispam-messagedata: C4VOBQDbFEC2BFNLQcm0Ckk72oRL54P+B8uFzIk82Z1+SLO1Wk06VMLdt4QlKWHlNkeHoU9VkIwUeqhzpEZ5abr1eBi+Yv7Ua2WG/3gv+Rl7w2z7GMmaB8OkePIyUR5G9BJX2YcpWBraGAQCQpkQYg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <1633ABC1A9D01F4CB5723A45EFD7BD51@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e2f627-24f5-42d5-4f92-08d7e06d489b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 12:13:46.9060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D0GrjWDB31wELKKeylQKCPpLh9Qe+tT+tHhC3jRiOh6I3RD3Ilr3Vv/A5Io8g+MPJ2r+636BixM5thn6NAXLDVn1RuCr0Dln5UYeqFFaIoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4707
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

DQoNCk9uIDE0LjA0LjIwMjAgMTQ6MTYsIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KPiBFWFRF
Uk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDE0LzA0LzIwMjAgMDg6NDI6
MDgrMDAwMCwgQ2xhdWRpdS5CZXpuZWFAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+PiBXaHkgd291
bGQgb25lIHVzZSB0aGUgUlRUIHdoaWxlIHRoZSBSVEMgaXMgZmFyIHN1cGVyaW9yPw0KPj4NCj4+
IEkgZGlkbid0IGVuYWJsZWQgdGhpcyBmb3IgYSBwYXJ0aWN1bGFyIHVzZSBjYXNlLCBidXQ6IGNv
dWxkbid0IHRoaXMgYmUgdXNlZA0KPj4gYnkgc29tZSB1c2VyIHRoYXQgd2FudHMgdG8gZ2VuZXJh
dGUgbXVsdGlwbGUgYWxhcm1zPyBmcm9tIG11bHRpcGxlIFJUQ3M/DQo+Pg0KPiANCj4gSSB2ZXJ5
IG11Y2ggZG91YnQgdGhhdCBhcyBMaW51eCBpcyBhYmxlIHRvIHByb3Blcmx5IG11bHRpcGxleCBh
bGFybXMgYW5kDQo+IGJhc2ljYWxseSwgdGhlIG9ubHkgb25lIHdlIGFyZSBpbnRlcmVzdGVkIGlu
IGlzIGFjdHVhbGx5IHdha2V1cC4NCg0KSSB0aGluayB5b3UgY2FuIHVzZSB0aGUgd2FrZWFsYXJt
IHN5c2ZzIGV4cG9ydGVkIGZpbGUgdG8gcHJlcGFyZSBhbiBhbGFybQ0KYW5kIHRha2UgdXNlciBz
cGFjZSBhY3Rpb25zIGJhc2VkIG9uIHRoYXQgd2l0aG91dCBiZWluZyBzdXNwZW5kZWQuDQoNCj4g
DQo+PiBNb3Jlb3ZlciwgdGhpcyBJUCdzIGNvdW50ZXIgaGFzIHRoZSBwb3NzaWJpbGl0eSBvZiBi
ZWluZyBjbG9ja2VkIGF0IDFIei4NCj4+IENvdWxkbid0IHRoaXMgbWluaW1pemUgdGhlIHBvd2Vy
IGNvbnN1bXB0aW9uIHdoaWxlIGJlaW5nIGluIGEgcG93ZXIgc2F2aW5nDQo+PiBtb2RlPw0KPj4N
Cj4gDQo+IEFuZCB0aGF0IDFIeiBjbG9jayBpcyBjb21pbmcgZnJvbSB0aGUgUlRDIHNvIHVzaW5n
IHRoZSBSVEMgaXMNCj4gZGVmaW5pdGl2ZWx5IGNvbnN1bWluZyBsZXNzIHBvd2VyLg0KDQpEYXRh
c2hlZXQgc3BlY2lmaWVzIHRoaXM6ICJDb25maWd1cmluZyB0aGUgUlRQUkVTIGZpZWxkIHZhbHVl
IHRvIDB4ODAwMA0KKGRlZmF1bHQgdmFsdWUpIGNvcnJlc3BvbmRzIHRvIGZlZWRpbmcgdGhlIHJl
YWwtdGltZSBjb3VudGVyIHdpdGggYQ0KDQoxSHogc2lnbmFsIChpZiB0aGUgc2xvdyBjbG9jayBp
cyAzMi43Njgga0h6KS4iDQoNClNvLCBpdCBpcyBub3QgdGhlIFJUQywgaXQgaXMgdGhlIHNsb3cg
Y2xvY2sgZGl2aWRlZCBieSAzMjc2OC4NCg0KPiANCj4+Pg0KPj4+Pj4NCj4+Pj4+IEluIGFueSBj
YXNlLCB0aGlzIGRpZmYgc2hvdWxkIGJlIG1lcmdlIHdpdGggdGhlIG90aGVyIGF0OTEtc2FtOXg2
MGVrLmR0cw0KPj4+Pj4gY2hhbmdlIGluc3RlYWQgb2YgYmVpbmcgd2l0aCB0aGUgZHRzaSBjaGFu
Z2UuDQo+Pj4+DQo+Pj4+IFRoZSBjaGFuZ2VzIGluIHRoaXMgcGF0Y2ggYXJlIHJlbGF0ZWQgdG8g
ZW5hYmxpbmcgdGhlIFJUVC4gVGhlIG90aGVyIGR0cw0KPj4+PiBjaGFuZ2UgaXMgcmVsYXRlZCB0
byBlbmFibGluZyBncGJyLiBUaGUgUlRUIHVzZXMgdGhhdCBlbmFibGVkIGdwYnIgLT4gb25lDQo+
Pj4+IGNoYW5nZSBwZXIgcGF0Y2guDQo+Pj4+DQo+Pj4+IElmIHlvdSBzdGlsbCB3YW50IHRvIG1l
cmdlIHRoZW4sIEknbGwgZG8gaXQsIGJ1dCB0aGVuIGl0IGJlY29tZXMgbWl4ZWQuDQo+Pj4+DQo+
Pj4NCj4+PiBUaGlzIHBhdGNoIGlzIGFscmVhZHkgbWl4aW5nIGFkZCB0aGUgZ3BiciBpbiBzYW05
eDYwZWsgYW5kIGFkZCB0aGUgbm9kZQ0KPj4+IGluIHNhbTl4NjAuZHRzaSB3aGljaCBpcyB3b3Jz
ZS4NCj4+DQo+PiBUaGlzIHBhdGNoIGlzIGxpa2UgdGhpczoNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvYXQ5MS1zYW05eDYwZWsuZHRzDQo+PiBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2F0OTEtc2FtOXg2MGVrLmR0cw0KPj4gaW5kZXggYWIzZDJkOWE0MjBhLi40MDIwZTc5YTk1
OGUgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9hdDkxLXNhbTl4NjBlay5kdHMN
Cj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2F0OTEtc2FtOXg2MGVrLmR0cw0KPj4gQEAgLTYx
Nyw2ICs2MTcsMTEgQEANCj4+ICAgICAgIH07DQo+PiAgfTsNCj4+DQo+PiArJnJ0dCB7DQo+PiAr
ICAgICBhdG1lbCxydHQtcnRjLXRpbWUtcmVnID0gPCZncGJyIDB4MD47DQo+PiArICAgICBzdGF0
dXMgPSAib2theSI7DQo+PiArfTsNCj4+ICsNCj4+ICAmc2h1dGRvd25fY29udHJvbGxlciB7DQo+
PiAgICAgICBhdG1lbCxzaGR3Yy1kZWJvdW5jZXIgPSA8OTc2PjsNCj4+ICAgICAgIHN0YXR1cyA9
ICJva2F5IjsNCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zYW05eDYwLmR0c2kg
Yi9hcmNoL2FybS9ib290L2R0cy9zYW05eDYwLmR0c2kNCj4+IGluZGV4IDMyNmIzOTMyOGI1OC4u
ZTFkOGUzYTRjYjBiIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc2FtOXg2MC5k
dHNpDQo+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zYW05eDYwLmR0c2kNCj4+IEBAIC02NjEs
NiArNjYxLDEzIEBADQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAi
ZGlzYWJsZWQiOw0KPj4gICAgICAgICAgICAgICAgICAgICAgIH07DQo+Pg0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgIHJ0dDogcnR0QGZmZmZmZTIwIHsNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAibWljcm9jaGlwLHNhbTl4NjAtcnR0IjsNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweGZmZmZmZTIwIDB4MjA+Ow0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwxIElSUV9UWVBFX0xFVkVM
X0hJR0ggNz47DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNs
azMyayAwPjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICB9Ow0KPj4gKw0KPj4NCj4+IEl0IGRv
ZXNuJ3QgYWRkcyB0aGUgR1BCUiBpbiBzYW05eDYwZWssIGl0IGFkZHMgcnR0IGluIHNhbTl4NjBl
ayB3aGljaCB1c2VzDQo+PiBHUEJSLg0KPj4NCj4+Pg0KPj4+IEp1c3QgaGF2ZSBvbmUgcGF0Y2gg
YWRkaW5nIHRoZSBydHQgbm9kZSB0byB0aGUgc2FtOXg2MC5kdHNpIGFuZCB0aGVuIGENCj4+PiBw
YXRjaCBhZGRpbmcgdGhlIFJUVCB0byBzYW05eDYwZWsuDQo+Pg0KPj4gT2ssIEkgdW5kZXJzdGFu
ZCB0aGlzLg0KPj4NCj4+PiBCZWNhdXNlIHRoZSBSVFQgdXNlcyB0aGUgZ3BiciwgaXQgaXMNCj4+
PiBhIGdvb2QgdGltZSB0byBhZGQgZW5hYmxlIHRoZSBncGJyLCB0aGlzIGlzIGEgc2luZ2xlIGZ1
bmN0aW9ubmFsIGNoYW5nZS4NCj4+Pg0KPj4+IExldCdzIHNheSB0aGF0IGZvciBzb21lIHJlYXNv
biwgdGhlIFJUVCBwYXRjaCBvbiBzYW05eDYwZWsgaGFzIHRvIGJlDQo+Pj4gcmV2ZXJ0ZWQsIHRo
ZW4gdGhlIFJUVCBub2RlIGlzIHN0aWxsIGRlZmluZWQgd2hpY2ggaXMgZ29vZCBmb3IgYWxsIHRo
ZQ0KPj4+IG90aGVyIGV2ZW50dWFsIHVzZXJzLg0KPj4NCj4+IFJUVCBub2RlIHdvdWxkIHN0aWxs
IGJlIGRlZmluZWQgYnV0IEdQQlIgbm9kZSB3aWxsIG5vdCBiZSBlbmFibGVkLg0KPj4NCj4+IElm
IFJUVCBwYXRjaCBjb250YWlucyB0aGlzIGNoYW5nZSB0aGF0IEkgdW5kZXJzdGFuZCB5b3Ugd2Fu
dCBtZSB0byBtZXJnZSBoZXJlOg0KPj4NCj4+ICsmZ3BiciB7DQo+PiArICAgICBzdGF0dXMgPSAi
b2theSI7DQo+PiArfTsNCj4+ICsNCj4+DQo+PiB0aGVuLCB0aGVvcmV0aWNhbGx5LCBzb21lIG90
aGVyIElQcyB1c2luZyB0aGUgR1BCUiAoUlRDIGhhdmUgdGhlDQo+PiBwb3NzaWJpbGl0eSBvZiBk
b2luZyB0aGlzKSwgbWF5IGJlIGJyb2tlbiBieSByZXZlcnRpbmcgdGhlIFJUVCBwYXRjaCB0aGF0
DQo+PiBpbmNsdWRlcyB0aGUgR1BCUiBlbmFibGluZyBwYXRjaC4NCj4+DQo+IA0KPiBCdXQgdGhp
cyBpcyB2ZXJ5IHVubGlrZWx5IHRvIGhhcHBlbiBiZWNhdXNlIHRoaXMgd291bGQgYmUgbGltaXRl
ZCB0byBhDQo+IHNpbmdsZSBib2FyZCBkZXZpY2UgdHJlZSBpbnN0ZWFkIG9mIGltcGFjdCBldmVy
eSBzYW05eDYwIGJhc2VkIGJvYXJkcy4NCg0KVmVyeSB1bmxpa2VseSBidXQgYSBoYXZpbmcgYSBw
YXRjaCB3aXRoIGRpZmYgbGlrZSB0aGlzOg0KDQorJmdwYnIgew0KKyAgICAgc3RhdHVzID0gIm9r
YXkiOw0KK307DQorDQorJnJ0dCB7DQorICAgICBhdG1lbCxydHQtcnRjLXRpbWUtcmVnID0gPCZn
cGJyIDB4MD47DQorICAgICBzdGF0dXMgPSAib2theSI7DQorfTsNCisNCg0KYW5kIHJldmVydGlu
ZyBpdCBtYXkgYWZmZWN0IHRoZSBvdGhlciB1c2VycyBvZiBncGJyIGluIHNhbTl4NjBlay5kdHMu
DQoNCj4gDQo+IA0KPiAtLQ0KPiBBbGV4YW5kcmUgQmVsbG9uaSwgQm9vdGxpbg0KPiBFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20NCj4g
