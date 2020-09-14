Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA7B26857D
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Sep 2020 09:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbgINHIf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Sep 2020 03:08:35 -0400
Received: from mail-eopbgr20047.outbound.protection.outlook.com ([40.107.2.47]:5282
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726064AbgINHIe (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 14 Sep 2020 03:08:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTyPYwNVE8PQ1HRWjDfAg0YatYBDV11mVVbj7RdME/FX4yBB7kCN35YwLNWhFhMpeyj+p4YjAcJhO0kogVKD3UwAQhNnLL2OdyUoMTISJBjX7yTHLY5U27E8ElQeocLwM+sbVabuvkhAuCdlxyQnQeAoDCUXS+qE4B/dIBC5DHmPGA6w8J8AW05ySrb9rDGIw9Caf4XeyvNYwIrL+iimbZJGCfTYmB1qkNMN4SGF89lVMZ85EPWM956++Lm1Z+6YSu4yBuozdsqt7xUuWFyI3CWpBaJ5lBKYQvkKI3P07vQPZMdxnMl/6BGIOZ61hSSmBhIQmEZM0mSalldXC4mG4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPLFOc4dBN3VxvTcS7W/fzXikW8GuPal+OKiItKzbpI=;
 b=lY4FfpPhb3Gj/ISonuLy5vP45W8Sv93FYxlcDn44xRaLpmALgKTO7aj4+fkZWtx4WhEXOBZTrCOrwFCHAPgud6XUablwSdB6SoA2SqzosBxTNYbcA4WY1Wpy2hG9iWDLh3lotTsEKrtovhLE6EBtujnEVbUJPgo9rp0ppQ5c6BQ2FnbW/65THcGCYk7G38y+DOsptwP5l5Shk3RRyLSXPkNaubbJjMLR6EIvsbvHmHYX0TohixzFOMnUu19qqeCI3WomzfFsSKbJqW8nDUMwL0+pwvkLCooLjJ0zYSL5yYyaZwjnQvVhm0cNav0pQ45zJ+V1xzVqlhlehJol6vA50w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPLFOc4dBN3VxvTcS7W/fzXikW8GuPal+OKiItKzbpI=;
 b=rP4GPJbUPCgXzgCV8vtn9ktRc+RyVmsHumIBEGDm+CKHC22P9mQsNqe5JMPu5AAGtJASloVwjILK8cCITQ92MTh/N4qKJWvtsKFALPqkpEZlNbVSGDtYI0aw9Cnmz0cH3J7cC8sq2c3NxHePqR8nR0kbRnb6M+tuPZ5HTLleGg8=
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com (2603:10a6:803:129::26)
 by VI1PR04MB5822.eurprd04.prod.outlook.com (2603:10a6:803:de::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 14 Sep
 2020 07:08:23 +0000
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::f16e:a79:2203:5d35]) by VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::f16e:a79:2203:5d35%6]) with mapi id 15.20.3370.019; Mon, 14 Sep 2020
 07:08:23 +0000
From:   Qiang Zhao <qiang.zhao@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] dt-bindings: rtc-2127: Add bindings for
 nxp,rtc-2127.txt
Thread-Topic: [PATCH 1/3] dt-bindings: rtc-2127: Add bindings for
 nxp,rtc-2127.txt
Thread-Index: AQHWfFOV2mqT9X+P3UaXnJvGvvBfp6lg1ekAgAByYLCAAkefAIAEQfJw
Date:   Mon, 14 Sep 2020 07:08:22 +0000
Message-ID: <VE1PR04MB6768F9352B510CB6E873515A91230@VE1PR04MB6768.eurprd04.prod.outlook.com>
References: <20200827091441.12972-1-qiang.zhao@nxp.com>
 <20200909202456.GA3019412@bogus>
 <VE1PR04MB676899EEA79D59061FE91BF691270@VE1PR04MB6768.eurprd04.prod.outlook.com>
 <CAL_JsqJx=7npNYNe4MybNvdNRxBj_XjvEOJsSm+gNGEkvbh2VA@mail.gmail.com>
In-Reply-To: <CAL_JsqJx=7npNYNe4MybNvdNRxBj_XjvEOJsSm+gNGEkvbh2VA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e1a9e59c-8361-45ce-dc14-08d8587cf7d7
x-ms-traffictypediagnostic: VI1PR04MB5822:
x-microsoft-antispam-prvs: <VI1PR04MB582255CE2CE77F9FB773813791230@VI1PR04MB5822.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OY0YhzcdmwP6cagRDlvosQ5UHLrKiCev6Lw93OwPevipJ0w5n0TKtlu4KCueh9/rGPWTtOrEsHbeYvzfoHk7AakRqSMs1aihubhFVoAla3+OGy7fohqGhBciIh7Rk5nL0UGp1nLvkhBC+cEf9soqxn+hUlGzDCmh1+3qJV9qfIP7ae7FtcIvR6Br93EnEr6gQ2ujDjRKs1fe/PJKrZNesc053cbu8r+6QmxsfUNUzUm2+w70Pe47FLvK81NKBxXWMINx3oKQ62RTtu5FC1UtZRTwylXaj6g/TlyDQRrgzAnjJnlPALDXkBqqO8/AXRFpkZYE76kBykkJ55umrzOrULspAsjn5ke4wTOaanYmIpnLfL4aaUA40U1l9256Wa4mno9GFcvCG8jUU/q58RLL/JAsAake3P0UUI8IHTVf6TZL09Pz7gMl/hAQ6e7Hb7vge0H8pTbngE8xaE5YJctDsA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6768.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(86362001)(7696005)(71200400001)(55016002)(966005)(44832011)(53546011)(26005)(8936002)(6506007)(4326008)(83380400001)(9686003)(6916009)(186003)(478600001)(33656002)(54906003)(8676002)(5660300002)(76116006)(52536014)(2906002)(66946007)(316002)(64756008)(66556008)(66476007)(66446008)(142933001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: zy2DHRb84BE4o7a24CGx22uQcOtnb44go/bHMcZs7Q6GvgP0O85zoN8SoW4UaoBo16GEHrBacT8RHNWnK6TR580V0o0hiweyIkZrJeo70x9GqTWszpdYpEMXZKCzQaTxk1+8ILonS6utPRsUJzD1G1r57y/BNVlUcT1udK1sCLDYmKJf2fl5I404cfS08iQUGDc24O5UFkhCxjLzc6Ljdw4yTw6dsLl1ug6mFUgScOGKfayT3sePyQhrIg1dpLVKHjJoQqOrXJt1YYF1qg7i0RSnQIHFqFJ0GJbRLownpxfNLwf8vTtsQKYkTlLRM6gsArfPT58zswPm4da0gh1qDXJvU0JksR5g54GPYswKSW7b3peTu39OLPsgrLGAFmS6doK+7ooFOMKWlym7LbJowoSyhBfiiKqpRV5TKj51Q2CTYS6aAUUIzoUg/RV4NJnZVxrMREc2qiNLeyMS/Q9rkm1fHpow+JQx3PfwqFgUrFLLNNnbfbHyjO3JLm3t7Dhsrswm5igvtf3fBdo6uvm2g6iYZlXMUtMvUSOV5ysLH/YyL8VpHEf8YSr9jHfDA+htDQKUTPGKA5ZFWdfxOn7p81gBr1D78wai/p4WtLZQHIuEC83pZMMz1DrFpVdASHgvO1j7Kvko8sWeO5u1qH4VeQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6768.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a9e59c-8361-45ce-dc14-08d8587cf7d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2020 07:08:22.9113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IFVI5eePGkWqlX43P0GEo7Y4LXmj7UrgLrIsUGd6l7wEdBcNCFpyMpQcJfydm4+OkR872gZvkedR/KA7OUydmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5822
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gRnJpLCBTZXAgMTEsIDIwMjAgYXQgMjI6MDMsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+IHdyb3RlOg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjDlubQ55pyIMTHml6UgMjI6MDMN
Cj4gVG86IFFpYW5nIFpoYW8gPHFpYW5nLnpoYW9AbnhwLmNvbT4NCj4gQ2M6IGEuenVtbW9AdG93
ZXJ0ZWNoLml0OyBhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbTsNCj4gbGludXgtcnRjQHZn
ZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzNdIGR0LWJpbmRpbmdz
OiBydGMtMjEyNzogQWRkIGJpbmRpbmdzIGZvcg0KPiBueHAscnRjLTIxMjcudHh0DQo+IA0KPiBP
biBXZWQsIFNlcCA5LCAyMDIwIGF0IDk6MTYgUE0gUWlhbmcgWmhhbyA8cWlhbmcuemhhb0BueHAu
Y29tPiB3cm90ZToNCj4gPg0KPiA+IE9uIFRodSwgU2VwIDEwLCAyMDIwIGF0IDA0OjI1QU0sIFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+
ID4gPiBTZW50OiAyMDIw5bm0OeaciDEw5pelIDQ6MjUNCj4gPiA+IFRvOiBRaWFuZyBaaGFvIDxx
aWFuZy56aGFvQG54cC5jb20+DQo+ID4gPiBDYzogYS56dW1tb0B0b3dlcnRlY2guaXQ7IGFsZXhh
bmRyZS5iZWxsb25pQGJvb3RsaW4uY29tOw0KPiA+ID4gbGludXgtcnRjQHZnZXIua2VybmVsLm9y
ZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnDQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvM10gZHQtYmluZGluZ3M6IHJ0
Yy0yMTI3OiBBZGQgYmluZGluZ3MgZm9yDQo+ID4gPiBueHAscnRjLTIxMjcudHh0DQo+ID4gPg0K
PiA+ID4gT24gVGh1LCBBdWcgMjcsIDIwMjAgYXQgMDU6MTQ6MzlQTSArMDgwMCwgUWlhbmcgWmhh
byB3cm90ZToNCj4gPiA+ID4gRnJvbTogWmhhbyBRaWFuZyA8cWlhbmcuemhhb0BueHAuY29tPg0K
PiA+ID4gPg0KDQpQbGVhc2UgaGVscCB0byByZXZpZXcgYXMgYmVsb3csIGlmIGl0IGlzIG9rLCBJ
IHdpbGwgc2VuZCB0aGUgbmV3IHZlcnNpb24gcGF0Y2guIFRoYW5rIHlvdSENCg0KZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvbnhwLHBjZjIxMjcueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvbnhwLHBjZjIxMjcueWFt
bA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAuLjgwOWRkNTkNCi0tLSAvZGV2
L251bGwNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvbnhwLHBj
ZjIxMjcueWFtbA0KQEAgLTAsMCArMSwzOCBAQA0KKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjANCislWUFNTCAxLjINCistLS0NCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL3J0Yy9ueHAscGNmMjEyNy55YW1sIw0KKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KKw0KK3RpdGxlOiBQQ0YgUlRDcw0KKw0KK21h
aW50YWluZXJzOg0KKyAgLSBRaWFuZyBaaGFvIDxxaWFuZy56aGFvQG54cC5jb20+DQorDQorYWxs
T2Y6DQorICAtICRyZWY6ICJydGMueWFtbCMiDQorDQorcHJvcGVydGllczoNCisgIGNvbXBhdGli
bGU6DQorICAgIGVudW06DQorICAgICAgLSBueHAscGNmMjEyNw0KKyAgICAgIC0gbnhwLHBjZjIx
MjkNCisNCisgIHJlZzoNCisgICAgbWF4SXRlbXM6IDENCisNCisgIGludGVycnVwdHM6DQorICAg
IG1heEl0ZW1zOiAxDQorDQorICBuby13YXRjaGRvZzoNCisgICAgbWF4SXRlbXM6IDENCisNCisg
IHN0YXJ0LXllYXI6IHRydWUNCisNCityZXF1aXJlZDoNCisgIC0gY29tcGF0aWJsZQ0KKyAgLSBy
ZWcNCisNCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCisNCisuLi4NCg0KPiANCj4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL3dyaXRpbmctc2NoZW1hLnJzdCBhbmQgYWJvdXQgMTAwMCBl
eGFtcGxlcyBpbiB0aGUNCj4ga2VybmVsIHRyZWUuDQo+IA0KPiBSb2INCg==
