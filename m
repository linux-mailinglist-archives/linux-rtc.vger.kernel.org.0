Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1B91A6450
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Apr 2020 10:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgDMIvQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Apr 2020 04:51:16 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:28537 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbgDMIvP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Apr 2020 04:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1586767874; x=1618303874;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=A/BfzDM0SiCjl7M5EmTj6SXKtRysbudhvxwHBw3R5e0=;
  b=cBIRhc2iMCHKJ9bNEsCFhOrUsRDPwweiNtJooFRnTntH+WkkeCJB0pZf
   ULA9xzd5X2kCSE6KCsrCfGcz66G3X1ix8RG5GH5sf8MYKEISm18JMGo7W
   ItjOtvLqWVSXm7Vq1B4ksV94xHLMij8yDcQO11mCEoUcls8iF+zPJ7ICL
   zgIL5ZXSsiDYVlplioHTw5Nb7N2XUBZJbKMkL4FRPzcMFQEZWC58XB09y
   fiCCOYlE20zGbg95Sz1mCdc3+CZkphwFZxpSqgVqhLJYbQ4Vutub4GZUk
   2gwm3vQ7CnIQuqBq8GcM+yCF43nb5TbGNyRcY2AbWUhWMu03RcSYa5mAv
   A==;
IronPort-SDR: xrUkWg1bsWSDOG6w7WtiCZPrRWeNBNoIXhHzxedhOKwm8saNQuq9RXXOXoiuZiBT8llRaD2tL/
 khwulhjYm0DAEF8+8FQ6lnZmzspwSYnIyblitMksIOibZdn3sFnkPJP8C2cAxIxgZXpz4bnUx8
 PxtNul+f2hRX7gJa1CVMQVkRaGjA6Y/3Wk3d1ZcIXaN6x+bxMV/vt5KnkN67ivbOXRXuyb7S3a
 d4J2+qRWneqCCGSHOG04rr0mUBH5N7DlPDzC6ltvbuXfcOwwAsmuOa43kUEYoJSfpO0zfHLttS
 wJw=
X-IronPort-AV: E=Sophos;i="5.72,378,1580799600"; 
   d="scan'208";a="8939627"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2020 01:51:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 13 Apr 2020 01:51:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 13 Apr 2020 01:51:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UImM2AzJUbKY3D59hPeswaYhddaNanAFeZK6+7q1sg+F05SU/qJ2zcgCdhZOcgLCPiC/VnwwPr75Nwrrxq3keUWdyBUqPEqUC5L50trTr/NDb5tQunuB+ezi6BLNhoMydR01Ya97eqBKor448qCB9WNc1FsQT9KQcSaiKznybH4Y8Ta2bMfSQaMQuX/3cniAw+vnQ51u6bfUJ1uh4jA7YkEJ2seOHj/hHvonNH33moMUALG6emciKOzoRMfnSjS0WNTqmkNN7uxzpgkU94yjpFZ1P4jR2ola+B1dnkRXFxaRzKfrocubHyECtsHc2BelzslPD+DuWL9r0fed9DmPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/BfzDM0SiCjl7M5EmTj6SXKtRysbudhvxwHBw3R5e0=;
 b=asdoSECeXzeNWk4pAMfW7pA867/yatqDFAh31/JGC29/rCE9qjGu2nJYndujdjZd8C7QVgpEBixnU3xicHBEh+r7hCW3tjxR7lZsuhHRQEjqg1RzXxdKhQacozgPHbglUo6rfWZznEhWDuK8q3iqRg//fR/SDWvjwS+lu84YXOCvGDIvr4kWC3rXHFDaAnbAU26rwHdN5QS1mElgA6Y9Tv4xgmzUBoMqBreUtZn/fY3IY6j19+2LxB/Ps1AeJVMIta1Z0jig+SpbBvwdJg+XiFIQtYj51/kTKyB0JIe5cqVPu7aNXZ9fXZdiWs28USJIkTh5EDbsvZxvDb4GNXt8lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/BfzDM0SiCjl7M5EmTj6SXKtRysbudhvxwHBw3R5e0=;
 b=Lr+2Q+eHTG8x6QdQx4l32ePToMureYk69nVutiGhQA+yHxfeajzGHHaWiazNq3h0b9vtRG8IxGhQ60RIg6uKfFu6RiHrd45vUnGbHRfYySBSpLWKf2jhf2xLLzwT0IIj2aT6Zr3O06ROEcHSszdGr+rG8usyA2xmOsmE/oV0/l8=
Received: from DM6PR11MB3420.namprd11.prod.outlook.com (2603:10b6:5:69::31) by
 DM6PR11MB4010.namprd11.prod.outlook.com (2603:10b6:5:194::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.26; Mon, 13 Apr 2020 08:51:12 +0000
Received: from DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::91cb:6555:db9b:53fa]) by DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::91cb:6555:db9b:53fa%7]) with mapi id 15.20.2900.026; Mon, 13 Apr 2020
 08:51:12 +0000
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
Date:   Mon, 13 Apr 2020 08:51:12 +0000
Message-ID: <c4d46198-488b-c5d6-2a66-865a16840dc4@microchip.com>
References: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
 <1586536019-12348-5-git-send-email-claudiu.beznea@microchip.com>
 <20200410222658.GB3628@piout.net>
In-Reply-To: <20200410222658.GB3628@piout.net>
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
x-ms-office365-filtering-correlation-id: accfc48b-0cf1-4354-300d-08d7df87d16e
x-ms-traffictypediagnostic: DM6PR11MB4010:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB401078BB1D2570983A55A3CC87DD0@DM6PR11MB4010.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 037291602B
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(396003)(376002)(346002)(136003)(39860400002)(366004)(7416002)(36756003)(66946007)(26005)(2906002)(66446008)(64756008)(66556008)(66476007)(76116006)(91956017)(6512007)(6506007)(478600001)(53546011)(54906003)(316002)(966005)(2616005)(8936002)(8676002)(6486002)(86362001)(31696002)(31686004)(6916009)(5660300002)(186003)(81156014)(4326008)(71200400001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wUjRAC4ni4oCUUqv2n/iw67ziHROVh1ubFZ/6ZOpq5FtjwTNOcbbIe0UNFDpOeaTpvgW8rjDzLn0Kl+27Gsj1DLjveIMVBpsnI7MHXE1aX2oGTonvXrCHikdecVq58vooeiKycSFVUTr+qchN09D25loWgIERQcGjV8O4fGNuCn/W5MNxXodkEDv2I9CB1V+c6r0nKuOm87b1QR4WQA3UBCNYUEAMflUdXWCJbxOk5lTbRhf9Cu3YqPuEs9VraHPpFY/wNp6XHWPdDtHW5825Pc6Xs2fkaZdJHftZxnh26XFOnQl38gJBCfQ2igC+lKbTcPuAh2fnvgThovk0u081/GZkEVaDzNrlnzaPjp2H351Xlv9Zz0RlUde2qKvpkBkBz9QT0NEXn8sxPsYhzdJOdHiAjSkGeqyQXRLPKmbsthWW5UEJl3Q160flDbpTlXF7yZbU5qydswuWou95Y40zLzfKoFqDoiAtWZSnCUS1HCv9eGz/ZExwswAAOyFgM2OVS0Rvph80xiF8LPYdXIeKw==
x-ms-exchange-antispam-messagedata: qFFFvktiDwk+i/JtkkbA2/AbcvJz/5ll1hATFh5TqW/8FTX7SnE9DEPrY+YoBcrXUata5Q7TLVaEA6Lk1aWdmdbuQlCMlqgm0PSKbTJEr6ZRuxiNOeBllxzee+5HhUfdXeYhZdTgj/Zfc19hT6hPgg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <45CB4E31E730EB459A36BB36E22C6AAA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: accfc48b-0cf1-4354-300d-08d7df87d16e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2020 08:51:12.1673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rZabScQp4KvMpaIbQQWh+OYdXA1mP4Ju/91TF/+vcKrezzHXQBadtdlca5bjqDjkInKmMXC/2NCj9ot1/xPbsvixFy0knMqfdADIUGNe/Pc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4010
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

DQoNCk9uIDExLjA0LjIwMjAgMDE6MjYsIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KPiBFWFRF
Uk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDEwLzA0LzIwMjAgMTk6MjY6
NTgrMDMwMCwgQ2xhdWRpdSBCZXpuZWEgd3JvdGU6DQo+PiBBZGQgUlRULg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUBtaWNyb2NoaXAuY29tPg0K
Pj4gLS0tDQo+PiAgYXJjaC9hcm0vYm9vdC9kdHMvYXQ5MS1zYW05eDYwZWsuZHRzIHwgNSArKysr
Kw0KPj4gIGFyY2gvYXJtL2Jvb3QvZHRzL3NhbTl4NjAuZHRzaSAgICAgICB8IDcgKysrKysrKw0K
Pj4gIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS9hcmNoL2FybS9ib290L2R0cy9hdDkxLXNhbTl4NjBlay5kdHMgYi9hcmNoL2FybS9ib290L2R0
cy9hdDkxLXNhbTl4NjBlay5kdHMNCj4+IGluZGV4IGFiM2QyZDlhNDIwYS4uNDAyMGU3OWE5NThl
IDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYXQ5MS1zYW05eDYwZWsuZHRzDQo+
PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9hdDkxLXNhbTl4NjBlay5kdHMNCj4+IEBAIC02MTcs
NiArNjE3LDExIEBADQo+PiAgICAgICB9Ow0KPj4gIH07DQo+Pg0KPj4gKyZydHQgew0KPj4gKyAg
ICAgYXRtZWwscnR0LXJ0Yy10aW1lLXJlZyA9IDwmZ3BiciAweDA+Ow0KPj4gKyAgICAgc3RhdHVz
ID0gIm9rYXkiOw0KPiANCj4gSXMgdGhlcmUgYW55IHBvaW50IHVzaW5nIGEgZ3BiciByZWdpc3Rl
ciB3aGlsZSB0aGVyZSBpcyBhbHJlYWR5IGEgbXVjaA0KPiBiZXR0ZXIgUlRDIGluIHRoZSBzeXN0
ZW0/DQoNCk9ubHkgdG8gaGF2ZSBpdCBhbHNvIGVuYWJsZWQuDQoNCj4gDQo+IEluIGFueSBjYXNl
LCB0aGlzIGRpZmYgc2hvdWxkIGJlIG1lcmdlIHdpdGggdGhlIG90aGVyIGF0OTEtc2FtOXg2MGVr
LmR0cw0KPiBjaGFuZ2UgaW5zdGVhZCBvZiBiZWluZyB3aXRoIHRoZSBkdHNpIGNoYW5nZS4NCg0K
VGhlIGNoYW5nZXMgaW4gdGhpcyBwYXRjaCBhcmUgcmVsYXRlZCB0byBlbmFibGluZyB0aGUgUlRU
LiBUaGUgb3RoZXIgZHRzDQpjaGFuZ2UgaXMgcmVsYXRlZCB0byBlbmFibGluZyBncGJyLiBUaGUg
UlRUIHVzZXMgdGhhdCBlbmFibGVkIGdwYnIgLT4gb25lDQpjaGFuZ2UgcGVyIHBhdGNoLg0KDQpJ
ZiB5b3Ugc3RpbGwgd2FudCB0byBtZXJnZSB0aGVuLCBJJ2xsIGRvIGl0LCBidXQgdGhlbiBpdCBi
ZWNvbWVzIG1peGVkLg0KDQo+IA0KPj4gK307DQo+PiArDQo+PiAgJnNodXRkb3duX2NvbnRyb2xs
ZXIgew0KPj4gICAgICAgYXRtZWwsc2hkd2MtZGVib3VuY2VyID0gPDk3Nj47DQo+PiAgICAgICBz
dGF0dXMgPSAib2theSI7DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc2FtOXg2
MC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc2FtOXg2MC5kdHNpDQo+PiBpbmRleCAzMjZiMzkz
MjhiNTguLmUxZDhlM2E0Y2IwYiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3Nh
bTl4NjAuZHRzaQ0KPj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc2FtOXg2MC5kdHNpDQo+PiBA
QCAtNjYxLDYgKzY2MSwxMyBAQA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Rh
dHVzID0gImRpc2FibGVkIjsNCj4+ICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPj4NCj4+ICsg
ICAgICAgICAgICAgICAgICAgICBydHQ6IHJ0dEBmZmZmZmUyMCB7DQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1pY3JvY2hpcCxzYW05eDYwLXJ0dCI7DQo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHhmZmZmZmUyMCAweDIwPjsN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MSBJUlFfVFlQ
RV9MRVZFTF9ISUdIIDc+Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tz
ID0gPCZjbGszMmsgMD47DQo+PiArICAgICAgICAgICAgICAgICAgICAgfTsNCj4+ICsNCj4+ICAg
ICAgICAgICAgICAgICAgICAgICBwaXQ6IHRpbWVyQGZmZmZmZTQwIHsNCj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXRtZWwsYXQ5MXNhbTkyNjAtcGl0IjsN
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweGZmZmZmZTQwIDB4MTA+
Ow0KPj4gLS0NCj4+IDIuNy40DQo+Pg0KPiANCj4gLS0NCj4gQWxleGFuZHJlIEJlbGxvbmksIEJv
b3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KPiBodHRwczov
L2Jvb3RsaW4uY29tDQo+IA==
