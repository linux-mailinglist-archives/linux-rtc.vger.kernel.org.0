Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB40263B44
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Sep 2020 05:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgIJDRG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 9 Sep 2020 23:17:06 -0400
Received: from mail-eopbgr80073.outbound.protection.outlook.com ([40.107.8.73]:43087
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725772AbgIJDQ6 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 9 Sep 2020 23:16:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjIMWoJmcidzo0sSvB0kXn7zlCI20J/JRyHFPSacY5iM+IQAmhDVck6nrrcFd1Uj5lzZopHJWYQluSGoaDQN83KNTDkIca/T0EeEb5bp/d8dgIYA1M/GiTC2dYjSbUInsV7VUWXZ7sTouKTJieNJdtogbWImaI8FvxzJdBDujgt4Taj77b8LWNoBEROhLdNXo9BUTdmf+ldJSDd9MS7p6ENBaYLt2FHNfweh+1O9ueDxTZiDIgzpBPYSwjUZda9FZ6qe+G0rwCA/ZT0jkhTuErZYD66aQ4hVNhbk2RNBrtPMGJhbX3sDoYHcQd29tKPsqJl8BWzsoAgkZgTkMFKW9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzMB1RtRmHT2LEurca5owpJhNXNKz3fch28kMHBq8E4=;
 b=Nb6fA1K2bN4c/tXuDBg0HYZoota5lJWNFV91uWinPefceDmSjlYVJVp7leMrDjt+uhNICx2fuNs3pKoNWFd4X3OkkRX4+TcG1vGxJKEdxYUsdExJOyR0vufcgJXBHNY4Ne6XDXrX0dBVy1aLLRKnMrTDGn47d3CbnfDfO1K3M1Jm9S4B09xM4hBKKA5xtpQgoT5pZ/dFKQlTw3xToNbDDH6FC6k2ODZyKSV0Rs9laWJ9bvHQRn8D3x6YVcLIbZpBGNxmhLfDnJiy3n9lMOEE2U1DxEoWrDQ1TgqpCWtwInh52gAvgRBdfgCyCWEVOfeaY+I4L31gr4EO7rYcoAtI3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzMB1RtRmHT2LEurca5owpJhNXNKz3fch28kMHBq8E4=;
 b=rabPDSXyH5kTj+V9xYm5Wwtyv07ilf85Jbth0q74VvVkfbrb2oqhHGqfMR6a0uBlJveW5D7k1Bop8g9ES3d5QEi6IokUZDDnB9f3Wyv8RQppZQWDdcJODaWMG3SohcWP8oxTvf1WaYK9Xu3D+rKvqUYg4H9SvsXjt5cwmPENQBM=
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com (2603:10a6:803:129::26)
 by VI1PR04MB4861.eurprd04.prod.outlook.com (2603:10a6:803:5e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Thu, 10 Sep
 2020 03:16:54 +0000
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::f16e:a79:2203:5d35]) by VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::f16e:a79:2203:5d35%6]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 03:16:54 +0000
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
Thread-Index: AQHWfFOV2mqT9X+P3UaXnJvGvvBfp6lg1ekAgAByYLA=
Date:   Thu, 10 Sep 2020 03:16:54 +0000
Message-ID: <VE1PR04MB676899EEA79D59061FE91BF691270@VE1PR04MB6768.eurprd04.prod.outlook.com>
References: <20200827091441.12972-1-qiang.zhao@nxp.com>
 <20200909202456.GA3019412@bogus>
In-Reply-To: <20200909202456.GA3019412@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b0e7f88f-3c85-47e4-ebab-08d85537f828
x-ms-traffictypediagnostic: VI1PR04MB4861:
x-microsoft-antispam-prvs: <VI1PR04MB4861D6E3BDE1683423A1A0ED91270@VI1PR04MB4861.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 56gMhD2cqRpybUVu9y77JginETd/AsUHMLhPjEoYOWEPdgVG6xe+y+RTmkzGQhSccaIi/R+r3lExzIT2KoQoWQTmomf1Ma6x1jSLrhXQf9Gh7TSQWBFbCMpE1/dGzj7mGtKk8ANoJIU3IV/dv4wFEQrN6aBx9y9DjDnHwV4X+W2l0uT01ZKbxVhkixbQyNZaegzli6s9UApjMhlKTPaGBhr4aPfhDBcBUutsCg3dxF8hDDTc/yoijlS/pB3kosTTZPa6Jokvxfb57dNUkoDUKdx1v59wYkzIxq2Dy7SlCOtci1gDYABgJJddG5jrDM0643jWm1eq+3kcd8HJ9iYpk7oQ5CwzvJWIjOsS24fBKgObrHlMFfwqt+kl04cQUI0R
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6768.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(86362001)(316002)(66476007)(64756008)(2906002)(83380400001)(52536014)(54906003)(6916009)(44832011)(26005)(4744005)(186003)(66446008)(4326008)(478600001)(7696005)(33656002)(71200400001)(5660300002)(66556008)(66946007)(8936002)(8676002)(55016002)(53546011)(76116006)(9686003)(6506007)(142933001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: d7/60eH/M1D26icCGQB8gp5zF9WIv/cLluhFT7kwko2Qh5D2H1824Q3jr4Kj11IFkiuh2G/FWVhSiGS7XeeBCQMV+AMLTnLUiZPWtGsbd31IxmCY1DoF8KHtyP/pbZgwhhHLe+JkG+gNp7UkJn7uXqet7/JaE69Ng3RNJeTJrX8t07MgpPjGme2gZCMYGwNTYImQaAjU5oQnxCrL3zf0Oz8654OJJNoJWuM9Gvxtb1c8kIjTK2TmzHFjTXWADCAIrSw+2ecTeEcCfUTo6ePMmyP8pXcbelREPBHCbLDA1fcGdQ/tmONXWBNuwsE8yy0d91u8roonpO7SaGpbtrLjRghXXXcUmKdkbuAljZTeZQU34onZjsmSHpteT5/Hd+0GKX7PSIo3NMejJJP2xejINo8s7uFMhWm+ixOXNHcscYZcPBfShRSl5wiFhoIy+xsZWvBhh8Ix3imQ95ARofYqygH0qdJ7E2QN2LKmYlzKxSNBan6tp4NKikBJd7YkeYxkAxEeUDLCrTWfZ2xmpRUEWkdX4Yf3lFveRkwOAgWNuUOBYunfCL63S+SoEZ/OfaJuRWz/kFdb++Ll2oTJVWLa8TjeE/TITjdsvhv9tvcDi/TO+86DDx8TF1C6+c3J1HwZmyGib1aHbXS1ZprMRqiJew==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6768.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e7f88f-3c85-47e4-ebab-08d85537f828
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2020 03:16:54.6159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zTJe9tzM06lC2xnty/uILwIb8RtWXiQ4OdYhyeZkDZ3O2IdPYgG4SfFe+tGNWnb+IHf1iICZL2WZnXzQIDiiZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4861
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gVGh1LCBTZXAgMTAsIDIwMjAgYXQgMDQ6MjVBTSwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjDE6jnUwjEwyNUgNDoyNQ0KPiBU
bzogUWlhbmcgWmhhbyA8cWlhbmcuemhhb0BueHAuY29tPg0KPiBDYzogYS56dW1tb0B0b3dlcnRl
Y2guaXQ7IGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tOw0KPiBsaW51eC1ydGNAdmdlci5r
ZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvM10gZHQtYmluZGluZ3M6IHJ0
Yy0yMTI3OiBBZGQgYmluZGluZ3MgZm9yDQo+IG54cCxydGMtMjEyNy50eHQNCj4gDQo+IE9uIFRo
dSwgQXVnIDI3LCAyMDIwIGF0IDA1OjE0OjM5UE0gKzA4MDAsIFFpYW5nIFpoYW8gd3JvdGU6DQo+
ID4gRnJvbTogWmhhbyBRaWFuZyA8cWlhbmcuemhhb0BueHAuY29tPg0KPiA+DQo+ID4gQWRkIGJp
bmRpbmdzIGZvciBueHAscnRjLTIxMjcNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFpoYW8gUWlh
bmcgPHFpYW5nLnpoYW9AbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3J0Yy9ueHAscnRjLTIxMjcudHh0IHwgMTgNCj4gKysrKysrKysrKysr
KysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NA0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL254
cCxydGMtMjEyNy50eHQNCj4gDQo+IEJpbmRpbmdzIHNob3VsZCBiZSBpbiBEVCBzY2hlbWEgZm9y
bWF0IG5vdy4NCg0KSXMgdGhlcmUgYW55IGRvYyBkZXNjcmlwdGlvbiBmb3IgRFQgc2NoZW1hIGZv
cm1hdCBvciBleGFtcGxlIA0KU28gdGhhdCBJIGNhbiB0YWtlIGFzIGEgcmVmZXJlbmNlLiBUaGFu
ayB5b3UhDQoNCkJlc3QgUmVnYXJkcw0KUWlhbmcgWmhhbw0K
