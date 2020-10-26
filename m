Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95AF429875C
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Oct 2020 08:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1769290AbgJZHXc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Oct 2020 03:23:32 -0400
Received: from mail-am6eur05on2089.outbound.protection.outlook.com ([40.107.22.89]:64224
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1769275AbgJZHXb (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 26 Oct 2020 03:23:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1VzeaTnFCOFxNFY0l3mEyVnZmLZlr9CY/GT/xHUSnKn6Udb9P5LRkdS9OEVLTQ2mJ2grZkaMZpXpb6kNRkiHRLMmtscJjVobdxmxBJB5LbIRqEsfNbESE6Y9kBQUKXimkcnuk046b4LU7HHDMTU6vpD65pr6XLKj+prSmv3lsAIuqhyu4nJNnHSI/rT81lMddqZiiqHw4VnqxHDJJAuvKSaJIVIyoVuVuyXHmcH9MroDghwnEgJe0wv2ntAnbiuSPELz1TNTr3WzjWDtsfYTuPpP235nPrhg3pFiQG7FZ5asEj/DsYAlbz4C66QUcw4ruZJM/W0NiMQ4aAp6dI1xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RniEPAXpgVoK6PB6wwXFKQo+B6FhAJj2GC3hTcbXlmw=;
 b=Js4fF67Yfb2Y2Vj5xLu6Yte1LKej0/pS1vSH5y/zEjM7RAACRkuq4W664zjPIeNX+zynQxerC01ifhBSOpX6pfMoQT+00O7yDxMHOFf4t6vG2aDhYXfspd8mwrd4hMgtOenrm++HpYzjuHc1ZJyMtOAzjCI1yx66a0hGKYq51aSN5Cd2dG0uNC0ybf/GMdqG0S9UhyRQA6Mgd7VnCbxK6/L/lN8/Nq91seyjGBBZGg4YaUpA3qELkBzRZPwq2FqnczngZQ4Q4LV59GXLrJYE/JsUPzyJVUgrDvvCbgJ+cWJWgHAJ3JmOPJ3fuOQuprPCU6HFGbd96hu7O4/DxU0C8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RniEPAXpgVoK6PB6wwXFKQo+B6FhAJj2GC3hTcbXlmw=;
 b=l8b4D4U/qrJWZrkO9hbwhIbgcpOjXDe1PSDONGPom+ZcAAcFqMY1aBs80mwkclDhh6Fk4X++NBwXxoBIHuwgOyj3a2JA0ZgH4SBFD9FRcLhjRDI4kJLj38fEY20fkrq4ygnzwe1kn2RXS/6HQDXgsYPlYjZlrgcKhSeGo+oTR5k=
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com (2603:10a6:803:129::26)
 by VE1PR04MB7264.eurprd04.prod.outlook.com (2603:10a6:800:1b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Mon, 26 Oct
 2020 07:23:27 +0000
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::f16e:a79:2203:5d35]) by VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::f16e:a79:2203:5d35%6]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 07:23:27 +0000
From:   Qiang Zhao <qiang.zhao@nxp.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
CC:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: RE: [PATCH 0/2] rtc: pcf2127: only use watchdog when explicitly
 available
Thread-Topic: [PATCH 0/2] rtc: pcf2127: only use watchdog when explicitly
 available
Thread-Index: AQHWkmDfI0LJbYXX+ketnQwXwyeiJamprPAg
Date:   Mon, 26 Oct 2020 07:23:26 +0000
Message-ID: <VE1PR04MB676864E851C6371F97877FA291190@VE1PR04MB6768.eurprd04.prod.outlook.com>
References: <20200924074715.GT9675@piout.net>
 <20200924105256.18162-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20200924105256.18162-1-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ae98d5c1-f077-41f1-09ea-08d879800817
x-ms-traffictypediagnostic: VE1PR04MB7264:
x-microsoft-antispam-prvs: <VE1PR04MB7264C0D6691C7EB083A286A691190@VE1PR04MB7264.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WYpz/GYME5kqLj4dv0QcWamyMwBgrAtUJ9+/Q9LLD0KwXh4CbcUUVpimXsgjKgQjbIKts6UIKvLh4ZhyQhVV7l1UGUBOCD08xmvswvnUQrxNZ4n3VDOYNSXTi39EYVL/u2wnd/htNYbd7iGI8Kinw3lsU9dIlOVIa0xCtoW0kpzntVZcg/RZyKCP4H9sZC1ZI3emDfuLIYziLysUfuuaptE0FnFv0jk0FIpsQEFVhOHaefzIRAlVa6pcyPP+Z+aQXnYSASjbARQNKsjBKNVo4fJb2wFsqNFE2FFqghj0ofab/HNfH8k3li273c6KCwBo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6768.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(66446008)(44832011)(316002)(66574015)(9686003)(83380400001)(4326008)(7416002)(8936002)(86362001)(33656002)(8676002)(64756008)(6506007)(66476007)(478600001)(7696005)(66556008)(71200400001)(186003)(5660300002)(26005)(53546011)(66946007)(52536014)(76116006)(2906002)(54906003)(55016002)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 9eZCEHG6lKd84CYNmMzfPAzvSqRO6H5D15Wo3r8qvI3L4f7sWC0UGKx6GzHsBEDsl83b2+KCP3BfZlFoqZKDqpX3FUDBrXe3PW2iuTMmXMKUleXGCeob4fEa9OO+aEV50/cpzb65qTpJBv94CF2mETaoLZRfCAV84yRLVh6b0G1lSjqkAjKI014XECYl+a5ackmOHGA48VsiAnY/QzS1MVtcr4vsvKgDWV4Am/BfFaKyOsvOdZKEaUCOEPU/0msUUi/y3WJxLTWDerRTcD64iO9Rh7OtA/NDVpCbQYiS0bwiaxwBHTaRv92omclv+pn6miBwMP+cuqIs/sQL2yO8mzmCRU/ZVVbvl0uKk5s9pq7IuX1mLQ8u3qYrjPpYzQ58DnGNaZ670JSG0S1MnI0YVyK0xQSUkFHT17Q4M4I+e3pvbyOu4VMF8maAv5nfKIhRlSZDW5xywf3T+BTXGbGEdPujOIUf1J8ldergYTO/vIhCwBrSs0kAJYUWHRyv1Q6vooN+H+NeYM6E29nP4i5DDmOQv3ddH9Q7rH15YbYtUHwnF3cegcGyTqlUTJ7Johe19RIL0RrpmvoUYjdBKuF9Dyh+gZ7QLWxCGwU7ahTwnmnVMWDmW/uezC7tYjo+b+60TSUvsqxWxBzOhjk9I2o0gg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6768.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae98d5c1-f077-41f1-09ea-08d879800817
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 07:23:26.9698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UUyLF7rF8YitibBKHCl0UCUWHR3kumSFj0xGA+BywuKzlv/CAkIhYt0Y/v8rTt4QmAr4oKLsmm1zriOlZOqrzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7264
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

QW55IHVwZGF0ZSBmb3IgdGhpcyBwYXRjaHNldD8NCg0KQmVzdCBSZWdhcmRzDQpRaWFuZyBaaGFv
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVXdlIEtsZWluZS1Lw7Zu
aWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCj4gU2VudDogMjAyMOW5tDnmnIgy
NOaXpSAxODo1Mw0KPiBUbzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJv
b3RsaW4uY29tPjsgUWlhbmcgWmhhbw0KPiA8cWlhbmcuemhhb0BueHAuY29tPjsgQnJ1bm8gVGhv
bXNlbiA8YnJ1bm8udGhvbXNlbkBnbWFpbC5jb20+DQo+IENjOiBsaW51eC1ydGNAdmdlci5rZXJu
ZWwub3JnOyBhLnp1bW1vQHRvd2VydGVjaC5pdDsNCj4gbGludXgtd2F0Y2hkb2dAdmdlci5rZXJu
ZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgcm9iaCtkdEBrZXJuZWwub3JnOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7DQo+
IFdpbSBWYW4gU2Vicm9lY2sgPHdpbUBsaW51eC13YXRjaGRvZy5vcmc+OyBHdWVudGVyIFJvZWNr
DQo+IDxsaW51eEByb2Vjay11cy5uZXQ+DQo+IFN1YmplY3Q6IFtQQVRDSCAwLzJdIHJ0YzogcGNm
MjEyNzogb25seSB1c2Ugd2F0Y2hkb2cgd2hlbiBleHBsaWNpdGx5IGF2YWlsYWJsZQ0KPiANCj4g
SGVsbG8sDQo+IA0KPiBub3cgdGhhdCB0aGVyZSBhcmUgdHdvIHBlb3BsZSBzdHVtYmxpbmcgb3Zl
ciB0aGUgcGNmMjEyNyBkcml2ZXIgcHJvdmlkaW5nIGENCj4gbm9uLWZ1bmN0aW9uYWwgd2F0Y2hk
b2cgZGV2aWNlLCBoZXJlIGNvbWVzIGFuIFJGQyBwYXRjaCB0byBhZGRyZXNzIHRoaXMuDQo+IA0K
PiBOb3RlIHRoaXMgaXMgb25seSBjb21waWxlIHRlc3RlZCBhbmQgZHQtZG9jdW1lbnRhdGlvbiBp
cyBzdGlsbCBtaXNzaW5nLg0KPiBTdGlsbCBzZW5kIHRoaXMgc2VyaWVzIGJlY2F1c2UgdGhlIGNs
ZWFudXAgaXMgbmljZSBpbmRlcGVuZGVudCBvZiB0aGlzIGRpc2N1c3Npb24NCj4gYW5kIHRvIGhh
dmUgc29tZXRoaW5nIHRvIGFyZ3VlIGFib3V0Lg0KPiANCj4gRG9lcyBzb21lb25lIGNhbiBvZmZl
ciBhIGJldHRlciBuYW1lIHRoYW4gImhhcy13YXRjaGRvZyIsIGlzIHRoZXJlIGEgc2NoZW1lDQo+
IHRoYXQgY291bGQgYmUgdXNlZCBhbHJlYWR5IHRoYXQgSSdtIG5vdCBhd2FyZSBvZj8NCj4gDQo+
IEJlc3QgcmVnYXJkcw0KPiBVd2UNCj4gDQo+IFV3ZSBLbGVpbmUtS8O2bmlnICgyKToNCj4gICBy
dGM6IHBjZjIxMjc6IG1vdmUgd2F0Y2hkb2cgaW5pdGlhbGlzYXRpb24gdG8gYSBzZXBhcmF0ZSBm
dW5jdGlvbg0KPiAgIFtSRkNdIHJ0YzogcGNmMjEyNzogb25seSB1c2Ugd2F0Y2hkb2cgd2hlbiBl
eHBsaWNpdGx5IGF2YWlsYWJsZQ0KPiANCj4gIGRyaXZlcnMvcnRjL3J0Yy1wY2YyMTI3LmMgfCA1
NyArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzMiBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkNCj4gDQo+IC0tDQo+IDIuMjgu
MA0KDQo=
