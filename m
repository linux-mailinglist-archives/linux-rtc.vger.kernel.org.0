Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E44FE26EA98
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Sep 2020 03:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbgIRBp1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Sep 2020 21:45:27 -0400
Received: from mail-am6eur05on2075.outbound.protection.outlook.com ([40.107.22.75]:9185
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725886AbgIRBp0 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 17 Sep 2020 21:45:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGBaLM9l/Tfd9kC3UL9kf/JZe+M92lSRWkzeggTafmuRAxYkXiGRsIxXQm9dbjGZ8m+/iTZpoMRiITh4QMpUiC7Fh5HH9uWVoAmvbqigbShaltalmFqhkhnZEc2qt2LD7tH7qRBkT14JcJvU5PWSdI40H0gD6wsnI+eHq+bgZIutwVtzLCrwDVnhdM1wD048SNyLFT7RPSaRjeZjDWAwrJIhVRN24YMbSd0ax4q/abq0Im21Medl2V4dHQ9dKQ7t0w5LePERzDIoS6jF3gk7DF3TxYLGTMQj6Cg2Ja5n5x5IfsS14hsNdLxO/iwiUBRdtlj/wRRogrRgMo3ZjOXlAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGwbt8mQE+lXI+YIki2ve/ViaWVxlA8p2jZvnNCGEds=;
 b=bItmGCI6JDD0wZN29fei40WhLhNQhMF6JJWtCwCwXdMtJ6pkvZMPmeyRRlRTZ6H44se1E8JVLPNA/LuiXAaBvgrcA1Wo6qknBEFOZgwxEzZ1E+A2ks172no/lZSJk2buD8Vye2nfZUQuJgSZI8yXIWRGULsrnSOl0lc2WR72TiWtL4d/jrnEfCkrWA1ms3cJBara5mSbXhXYl2AbT6GmuPkaWzO8ZdBB+c5Wi56K55sDvoUgUFynzwvQ0DRVHjKfAs/pbzc02CkXyxPenvTGn4UG7UPs6u9cw8RhVgcr/7m1pFy28inLCECLrWV9ailwEioTTDNal55r0O9d4GjdNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGwbt8mQE+lXI+YIki2ve/ViaWVxlA8p2jZvnNCGEds=;
 b=DRg8imarxpM2GVLnLXx8SBzygYkQYKQkKZIyio8moQoHCsxzchGQQzBmCHSGru1Gc7wBMmhQnncrWDKgQvjjsHH/Pdo5C91G6Woh5umpJZrlqlhbvKZA5xGlP3EBdnCoDE5p9HH0Gg2ZwW7glAQM9/6YhbOK9w771G9++pH5ePI=
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com (2603:10a6:803:129::26)
 by VI1PR04MB3262.eurprd04.prod.outlook.com (2603:10a6:802:f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Fri, 18 Sep
 2020 01:45:21 +0000
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::f16e:a79:2203:5d35]) by VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::f16e:a79:2203:5d35%6]) with mapi id 15.20.3391.011; Fri, 18 Sep 2020
 01:45:21 +0000
From:   Qiang Zhao <qiang.zhao@nxp.com>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
CC:     Rob Herring <robh@kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] dt-bindings: rtc-2127: Add bindings for
 nxp,rtc-2127.txt
Thread-Topic: [PATCH 1/3] dt-bindings: rtc-2127: Add bindings for
 nxp,rtc-2127.txt
Thread-Index: AQHWfFOV2mqT9X+P3UaXnJvGvvBfp6lg1ekAgAByYLCAAkefAIAEQfJwgAWHGICAAGbxkA==
Date:   Fri, 18 Sep 2020 01:45:17 +0000
Message-ID: <VE1PR04MB6768BFBAED0B5B59D873DD70913F0@VE1PR04MB6768.eurprd04.prod.outlook.com>
References: <20200827091441.12972-1-qiang.zhao@nxp.com>
 <20200909202456.GA3019412@bogus>
 <VE1PR04MB676899EEA79D59061FE91BF691270@VE1PR04MB6768.eurprd04.prod.outlook.com>
 <CAL_JsqJx=7npNYNe4MybNvdNRxBj_XjvEOJsSm+gNGEkvbh2VA@mail.gmail.com>
 <VE1PR04MB6768F9352B510CB6E873515A91230@VE1PR04MB6768.eurprd04.prod.outlook.com>
 <CAH+2xPAVhivJJ4DGZ+79kyeiLN-f93xMBbMEXTVUN-rrm4hawQ@mail.gmail.com>
In-Reply-To: <CAH+2xPAVhivJJ4DGZ+79kyeiLN-f93xMBbMEXTVUN-rrm4hawQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5c68d9b8-3b40-4f2e-fa6f-08d85b748136
x-ms-traffictypediagnostic: VI1PR04MB3262:
x-microsoft-antispam-prvs: <VI1PR04MB32622A45DE8BCF83E1E0C0F1913F0@VI1PR04MB3262.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yh6WL9aHXZpnuqb9Cb5hW+xFSvLKNaNWH9ptSJQn8NHFn/PKvgoOPRucJuLBKQCOmOIIsOs08KvLaGlDUmPD1izLuvo/AK9JS6aRRxdJFEC6pjDwPXmxg/ZkqMzmL9b83y1SaBlkcUnJFOfGF6t8qS4mG2jzBpKwDXFmSRbP1miZwHbst+qOvR3bh5HxS8VN/YISd3lUHFiNSMIrsuRuHhb//n0nXAulZM0g1PLbtLimHfXcmGEaa4EQCo2+h8ESv6MrjoJ5HxUUuLrO8w03oXNfSgrbawJH+CPcn/ukvQP68ijLhBDlXlpbLT1eGw5WIz7O0mXqsZ/TrVx2oBgXWRiuP8CjomBD5lXEbPmKwHYH6qWNpJI9Zm9V3y2Pi3OjUeiXtxlyIBhy4RtA5JxldH04Y4vA6WQ4NPjxTInoyuyWHUwsTA5Jy80aZ60r76YPm36G9IAqr7oGYFwVM/MVPw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6768.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(54906003)(83080400001)(8936002)(316002)(8676002)(6666004)(33656002)(7696005)(83380400001)(186003)(2906002)(52536014)(76116006)(55016002)(5660300002)(9686003)(66946007)(6916009)(64756008)(86362001)(44832011)(6506007)(26005)(66446008)(4326008)(71200400001)(53546011)(45080400002)(66556008)(66476007)(478600001)(142933001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: H/iASE+gYxSB0MqVmrP5viEVMdplIrdl/hRf6aznmbVQfRie29OZVAFMglyweVxN5+kGjd7LHbSVFG9ixgSmabbR6eQjR18yWfERZX+XWvF/rGzy6ybKhNXukfrfT8FsRAO6FyRgtsmHbOq1oHXY+8ljoDLkZTn+GeTTrga5RKisTwLsJXGNFhz+pDqXJ7B1JscRuuJhXEVVMkt5YRH/10DD9fF8b4u6VWi/Vs701iu9VYe4VFCgtzC3yraYZ8byyJl6eRTSdKjQQw6E0clLkOGBvJigLDuITo7A38xrTtdAsnoAMb3defa64BE4YVuLU1cLHIjQDiCgGIaYtYmEv59NduV8BM/UEKbl9vBJ8VkbpFAqVK0gS1lD1VoGhi8aVSjUaHm0MmwN/OosKDy/t8RCO7miO14GqB61+zB51sPqM/nTq1GbGY8nlscUeGxqcv80sVkvzu5t/trSX+j1nZGcOUfyrvKZOWaZYRlAXAm2U81S+tbcgSZRPOyMnjkIZTx2yof19/0LHzGpFBz1n0J3NKZ/raingXgSvtlrlDUS8P36SoXr+Xad4Qo3ixTVlj6PSwowtBFqC/SB1aqvd0j7/HsdS5+j6Yt6+6SGqKQJVL79JEwrkU5B87WCtjUjvG16jUS9lSUn7c7a48OTlA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6768.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c68d9b8-3b40-4f2e-fa6f-08d85b748136
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 01:45:20.5548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vvcRvnWR8T2ideEENpqxCws1argSk8F+AML+ZXUQuf7t0vl6kqpzGLC3TMgn21MsqKKZ3T0MA3AA0lyZuSg12Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3262
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

DQpPbiBGcmksIFNlcCAxOCwgMjAyMCBhdCAwMzoyOSwgQnJ1bm8gVGhvbXNlbiA8YnJ1bm8udGhv
bXNlbkBnbWFpbC5jb20+IHdyb3RlOg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IEJydW5vIFRob21zZW4gPGJydW5vLnRob21zZW5AZ21haWwuY29tPg0KPiBTZW50OiAy
MDIw5bm0OeaciDE45pelIDM6MjkNCj4gVG86IFFpYW5nIFpoYW8gPHFpYW5nLnpoYW9AbnhwLmNv
bT4NCj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBhLnp1bW1vQHRvd2VydGVj
aC5pdDsNCj4gYWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb207IGxpbnV4LXJ0Y0B2Z2VyLmtl
cm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8zXSBkdC1iaW5kaW5nczogcnRj
LTIxMjc6IEFkZCBiaW5kaW5ncyBmb3INCj4gbnhwLHJ0Yy0yMTI3LnR4dA0KPiANCj4gRGVuIG1h
bi4gMTQuIHNlcC4gMjAyMCBrbC4gMDkuMDggc2tyZXYgUWlhbmcgWmhhbyA8cWlhbmcuemhhb0Bu
eHAuY29tPjoNCj4gPg0KPiA+IE9uIEZyaSwgU2VwIDExLCAyMDIwIGF0IDIyOjAzLCBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+ID4gUGxlYXNlIGhlbHAgdG8gcmV2
aWV3IGFzIGJlbG93LCBpZiBpdCBpcyBvaywgSSB3aWxsIHNlbmQgdGhlIG5ldyB2ZXJzaW9uIHBh
dGNoLg0KPiBUaGFuayB5b3UhDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9ueHAscGNmMjEyNy55YW1sDQo+ID4gYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL254cCxwY2YyMTI3LnlhbWwNCj4gPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAuLjgwOWRkNTkNCj4gPiAtLS0gL2Rldi9u
dWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9ueHAs
cGNmMjEyNy55YW1sDQo+ID4gQEAgLTAsMCArMSwzOCBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOg0K
PiA+ICtodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9
aHR0cCUzQSUyRiUyRmRldmkNCj4gPg0KPiArY2V0cmVlLm9yZyUyRnNjaGVtYXMlMkZydGMlMkZu
eHAlMkNwY2YyMTI3LnlhbWwlMjMmYW1wO2RhdGE9MDIlNw0KPiBDMDElNw0KPiA+DQo+ICtDcWlh
bmcuemhhbyU0MG54cC5jb20lN0M1YTI3MWFhM2QxZWQ0NmVhNTc4MTA4ZDg1YjNmZjlmNiU3QzY4
NmUNCj4gYTFkM2JjDQo+ID4NCj4gKzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYz
NzM1OTY3NzYyNDAwMjYxNyZhbXA7c2RhdGENCj4gPVVHWjlCNkUNCj4gPiAreHRlSU12eGMzenZQ
ZnIlMkZqWlZRdVBENkRKNmIya1olMkJPTyUyQklBJTNEJmFtcDtyZXNlcnZlZD0wDQo+ID4gKyRz
Y2hlbWE6DQo+ID4gK2h0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5j
b20vP3VybD1odHRwJTNBJTJGJTJGZGV2aQ0KPiA+DQo+ICtjZXRyZWUub3JnJTJGbWV0YS1zY2hl
bWFzJTJGY29yZS55YW1sJTIzJmFtcDtkYXRhPTAyJTdDMDElN0NxaWFuZw0KPiAuemhhDQo+ID4N
Cj4gK28lNDBueHAuY29tJTdDNWEyNzFhYTNkMWVkNDZlYTU3ODEwOGQ4NWIzZmY5ZjYlN0M2ODZl
YTFkM2JjMmI0DQo+IGM2ZmE5MmMNCj4gPg0KPiArZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2Mzcz
NTk2Nzc2MjQwMDI2MTcmYW1wO3NkYXRhPTdQMm05T3ZJcw0KPiBGUzZRMkJ5OQ0KPiA+ICtETm1L
OU9xNUZmNkIlMkJOU0VBNEY3b3RUVDhnJTNEJmFtcDtyZXNlcnZlZD0wDQo+ID4gKw0KPiA+ICt0
aXRsZTogUENGIFJUQ3MNCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gUWlhbmcg
WmhhbyA8cWlhbmcuemhhb0BueHAuY29tPg0KPiA+ICsNCj4gPiArYWxsT2Y6DQo+ID4gKyAgLSAk
cmVmOiAicnRjLnlhbWwjIg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRp
YmxlOg0KPiA+ICsgICAgZW51bToNCj4gPiArICAgICAgLSBueHAscGNmMjEyNw0KPiA+ICsgICAg
ICAtIG54cCxwY2YyMTI5DQo+IA0KPiBUaGUgZGV2aWNlIGRyaXZlciBoYXZlIDMgY29tcGF0aWJs
ZSBzdHJpbmdzLCAibnhwLHBjYTIxMjkiIGlzIG1pc3NpbmcuDQoNClRoYW5rIHlvdSBmb3IgeW91
ciByZW1pbmRlciwgSSB3aWxsIGFkZCBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+IC9CcnVubw0K
PiANCj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4g
KyAgaW50ZXJydXB0czoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIG5vLXdh
dGNoZG9nOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgc3RhcnQteWVhcjog
dHJ1ZQ0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAg
LSByZWcNCj4gPiArDQo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4g
PiArLi4uDQo+ID4NCj4gPiA+DQo+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvd3JpdGlu
Zy1zY2hlbWEucnN0IGFuZCBhYm91dCAxMDAwIGV4YW1wbGVzDQo+ID4gPiBpbiB0aGUga2VybmVs
IHRyZWUuDQo+ID4gPg0KPiA+ID4gUm9iDQpCZXN0IFJlZ2FyZHMNClFpYW5nIFpoYW8NCg==
