Return-Path: <linux-rtc+bounces-384-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E8A800BC1
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 14:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B49BB1C2099D
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Dec 2023 13:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DBE2D614;
	Fri,  1 Dec 2023 13:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="W2KzFiGM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2093.outbound.protection.outlook.com [40.107.114.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8226110E2;
	Fri,  1 Dec 2023 05:23:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6jRMk/SMTvYjBNEiTEAqHCUaqJm+FPjoEzsfPMvIy9/TKbC1tSJBhsjt4VRzQR9VfyBff3CcuIU0+B5+xRtnvCsuQ8i4kCWVeQqVIikIvzD+A8u/+1k615c4NtfrN4P0DQ6mJVHlf54H5T6x1y9DYJE71ohXXYM59bOdBGGbLNfBUDtq1kNtdGfqEPt7Ud8hWce9j50NKL0DrT/cJEoFZPRVV6tq+1pEL5Bzxo9or5HFsds8fHv2I5wh75KUiC3J/zFjm1UwsW0n63kcx5HF24CM56hBdE5z/em5KvZDX1GQJ8gotiOl9N/VgUGLItCCBts93jQk8JavVq/stXAmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbnBytjWLN/851sYpajtt1B/Gjc9/Ct1nBgVv4K3LFQ=;
 b=KG8dbhKu/wFhTeS7hi9RmCpmhWFMmu3TA3iQDxWB84cIGe41EjKt4wRzBXQIPtlmYtWKUcst2pbJU2APujrJWxapu0KhdACuLUW+2r3w0OUqLH3PTg6LN0sn9Bqyc32nobA1LF55Bs0Y/ieKRsic9yf+VaO+/le9oJLjEPw9t6T2KCvEw6Dv5f4rQ4rwDz2mLNVnby0vjO9+VB/n8DVH122ogyK4wuNK5I1osPDThVRPAE/pACGMVg2Yis4DzCeQnnj9b7yz1PKOqHjK/+ak+Lv+bRtoL6i0vYLQXyV2JGi0paW+Gl8gricNfLewAEKl/BIqwlj+6n/NuSzIIvoBGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbnBytjWLN/851sYpajtt1B/Gjc9/Ct1nBgVv4K3LFQ=;
 b=W2KzFiGMusXRhGYbNflo5t49ZSqhl+v+BmO5ghVfT1+oh8T96bbCNEJMmPMZ909qJaDJ91+D139cuCalyZB2oraMqFFFA4CNSVo1fYayyaYJHzGokOVRDA4J8nS43yL6bBptMlzcHxta0j5/1FjbAOG23ALWnZpFSC+Eml0lfwY=
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 (2603:1096:400:366::13) by TYYPR01MB8150.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.26; Fri, 1 Dec
 2023 13:23:20 +0000
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310]) by TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310%7]) with mapi id 15.20.7046.027; Fri, 1 Dec 2023
 13:23:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Support Opensource
	<support.opensource@diasemi.com>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/6] rtc: da9063: Make IRQ as optional
Thread-Topic: [PATCH 1/6] rtc: da9063: Make IRQ as optional
Thread-Index: AQHaJEbFhFuDL7jn3keU6PqOgAZe97CUZA8AgAAF4bA=
Date: Fri, 1 Dec 2023 13:23:18 +0000
Message-ID:
 <TYVPR01MB112794AC4A6383243FAFF1B428681A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
 <20231201110840.37408-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUQaUaJdj-mNBZXNGmCAvgD9ne1ULbhzeoS+WVuvJOM0w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUQaUaJdj-mNBZXNGmCAvgD9ne1ULbhzeoS+WVuvJOM0w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYVPR01MB11279:EE_|TYYPR01MB8150:EE_
x-ms-office365-filtering-correlation-id: d7371aa7-d0da-4154-dd69-08dbf270ae9a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 arJON07FIVLaa7W/WroXaSNUDDEaIL2OKKwkbPZNP7OSPWIdHdT2Te7I3kbjmWMlgnGVU8x3cazy40X4VOvLuUaM4fnchj5GHD5kOGwB6wocdNWEBnB3TwsjMWroPrpWSIWupa2EoEjkddJbwyNOg9avFy8T9JhCg+Y9ESJRDFuI3NCY3b6AFUCB9Wfd3U3ImlCmuqmpmzYXJnD4K4kwx0FAnY+gfy6eL3mJqNKk+8QUj2Qb38Or8r/AgUxZXNtUzFv9LTdZae5IABcGbqoZv/r5BpzQkDSVO2rg6kzkHjSAHozuMtSNw11c4YDCtTuXgca3fJ/JPh/bBnDtdXP3RuoFJSqanKrorU1qKWUjTdOuUpRZx8Cfa9GPOUpGLVfWg3iayNZqdkpstW1UY69p6QyEbhWVgIrl32Dfs4sm8dUvWCY4IhV6J9deWILaGb+/INbLReUhlgiHXpNZXmw9yknifPlZOF1R/jX2V3umdpcNlPIANSV9d4kU51HMBjj493obLuh1LZ1JF/8SXRpfbmlbisLYx9UZRvmmxnm7uwLRySOgaBbbYMz56nYSUADdugjDELfWAH745+Mm0oXEwUd85edbZNiL1z/gWWb9UMS2xvifVCi/Jb/s15glWZfi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYVPR01MB11279.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38100700002)(55016003)(2906002)(5660300002)(33656002)(7696005)(6506007)(71200400001)(83380400001)(41300700001)(86362001)(8936002)(4326008)(66946007)(66446008)(76116006)(66476007)(66556008)(26005)(9686003)(54906003)(478600001)(6916009)(316002)(64756008)(122000001)(52536014)(38070700009)(53546011)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UEpZMUZiUU53UW1tMVVxcTJnb2pxUGppVWJibjFjVGVYRHZPckRsU0swS3F6?=
 =?utf-8?B?MTlhTmpIWUVnVHFVWWxNOVJrd2E3WDF1VGJ3M01rblNwd25hajV4T1ZKRFhj?=
 =?utf-8?B?cXFrWmQxdTAzN09WNy9qQ3NQbXNkbStPZnFZc3Q2cjZ2dVpxL1V4cmkxUjd6?=
 =?utf-8?B?UEZ1dUdNaGphR0JzSEZLUnRXeXBXb2pHc3RCeS8vZjdoWmR5RWFLWmdBSFM1?=
 =?utf-8?B?L2pxeDVya0hYdWFWZDJiUnNRaFM1VmN2Nm9mTlkwV1hzbE5HOThaYzRKMmw3?=
 =?utf-8?B?OHhicjNqT1ZmTUl1TmM5WStuWmtSNjM4VGlYR1BnYmQ0b2FPeDVBdk11ZjJ3?=
 =?utf-8?B?TytBRldWYVZMUXdrbEVKQWRwMG9ZeWpSZm1hTjcwTW9VYW9kb3N2aTRJUDU5?=
 =?utf-8?B?YnBhTzJPTUYxbFhaN0pQbm9PVElMT3lUNE5JbDFVTG9PbTl2cHozdGtmS2xl?=
 =?utf-8?B?Y29IeG5pV1F1YUR5WHQyVk41TnVkNFJEOXI2N1dHN0JrQ01RMXB5MjVKYmZq?=
 =?utf-8?B?RkNrRzFtZHIvaUZGbXpleCsvTHF1aFppS3NkZm1zMjMxUXJScHdYSjliaVdU?=
 =?utf-8?B?akFqeG9QUGJ4eGtzN08rYk93eEl2R3JndjVyTG1xK1J0NTJyTzdPNVBLU3ZP?=
 =?utf-8?B?TDR0bWM2VVVvdTJCemRXQjZsbklxMHJ5Ky9aSjF5Y0YzMkI4aHM1bTh4M1Z5?=
 =?utf-8?B?TDJEMVp4YVBvS292aUlQdENSS29QTzJCNk8ybGEwdDRvUFhUVUNpSjVzL01n?=
 =?utf-8?B?ak9od3hxN3VrRWtlZWordU1pK2xmYVdmQWN2STJBZzkydzBIWWtVNE16Mzkz?=
 =?utf-8?B?Q1JTcnJiSlhoTGFuUmpDVVdMTTVjVGJYSEZRdkxnTk9xRDNlaUVCT1NVcklk?=
 =?utf-8?B?VjErSGxsOXdpZGFjaVRVT3lyUWlJc1FRU2NnbFZ4YzJxeXVmSlZWbWErR3E3?=
 =?utf-8?B?cDFRY2cwU3Q4ck5NZzBvUWJUQjN1WWt6QjhBNGRZdVNONEhnV0tmS2RJSGpw?=
 =?utf-8?B?OFMwSzVBTTQ5cTdFQVY4TWp4OGYwVW4zckpHVUd1SVoyNGRGbzMxT0Uzc2gy?=
 =?utf-8?B?NVRaRXJzWnhhU0pONWZtMzczblJuR3BoVmhHTVhyeUt6QkN1NFM5Z0laVC9s?=
 =?utf-8?B?UUs4eUpTR2YrTndmREd0aUx4R2ppNi9GRW13NmtYaTVvaUZrVWZtM2tNc2dD?=
 =?utf-8?B?SWE5azZ5VTlLTDVtMWxPcFJVTXJmTFZ3Y1BVQnFPaUMyakx2UWFUMDFlWDFM?=
 =?utf-8?B?b0xiWnp1cU5ubGdLRnpMK3lxa3NldWJXclJsQ1k2ckhJMUVxUVZhTEJPUDNu?=
 =?utf-8?B?M2xwdGpBMTJXTFJzUXU0TXlUa3k2LzBYMGJmUTlZMU0zZXRUWGxMeW5oUXpj?=
 =?utf-8?B?VW5qYnUvOERJNWplSTV5QUI1K1hFa3l6NFdsWmg0R3A0Z0htblBaS2lkb1Rn?=
 =?utf-8?B?NVdyWFp0dWdKTjZ1OCttb0JHUlNJR3kwZTgvbkVReWM3dHVwRUpvYmJOZzVv?=
 =?utf-8?B?OXdUL1RIL1IvcEdvUnRRaGNGa1VWczNwZDkzOGhvb0wva0Rud3g1YTBYUUlG?=
 =?utf-8?B?U1ZnNTlpOUVzR3JOa1VrM2piR0lDLzh2R0xLWWVLOGdoV3k1SGxLV0duRWI0?=
 =?utf-8?B?T1dpbytXQXlIOHg2aklEU0hmcHNDWTdMelVEN1dCOGVONFY3TGxXMkh3Mnkx?=
 =?utf-8?B?V0kxSFhhN1hBc2xIcGZxdlEwem5CRkFrWHRQOFFoMkdPbVBLT1VEeFpHV0Zs?=
 =?utf-8?B?RTlNY1ZGbFRtM1psWHV2a21tMmZuS3hlZ0N2L3NsT3JVWnFUdlh1eUVQYjFk?=
 =?utf-8?B?OWdLMGdscVB2STZQQXlVSU9ZS21nS290ejFRcHdtTmxGNjNYT09nSW9KUmNZ?=
 =?utf-8?B?dHNFWTg1bFhVbnYvNzBmL3hQNDVOd1hVVVpSZERFYkZhNXowdWNMV2cwUUVq?=
 =?utf-8?B?anladVA1Y0MwM240T3dvQWxYQnBEUmtrNUNvK09jRlJtTFhNWU03d3Qzd2FD?=
 =?utf-8?B?bHBkRmN0R3VrbXBlRWVHcHdqbDB5SlpXYktWMVUwTzRDcGRkMVI1a2hpSms2?=
 =?utf-8?B?aGZkNzJkdXo2eHZCczRHSnFxay9nWHhhVmw5MjRmZUFDVnFWWlkyYmVMeloz?=
 =?utf-8?B?ekxxNVNKVjBtd1dzV3A0L0pyNW5ySmhpREJ2R0txTGFXSFAzbkY0VEtaMEhJ?=
 =?utf-8?B?TUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB11279.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7371aa7-d0da-4154-dd69-08dbf270ae9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 13:23:18.2445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z1WbtcLiCytEMVh92GOTxSgWbImmMTW9sO8GSrILMUPohrJHV3UaYPSTeMHFPndqpTOIEWXQUdk1BLSYuLmkSUkihDb9dcoIff2kSemha3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8150

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvNl0gcnRjOiBkYTkw
NjM6IE1ha2UgSVJRIGFzIG9wdGlvbmFsDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCBE
ZWMgMSwgMjAyMyBhdCAxMjowOOKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4NCj4gd3JvdGU6DQo+ID4gT24gc29tZSBwbGF0Zm9ybXMgKGVnOiBSWi97RzJVTCxGaXZl
fSBTTUFSQyBFVkspLCB0aGVyZSBpcyBubyBJUlENCj4gPiBwb3B1bGF0ZWQgYnkgZGVmYXVsdC4g
QWRkIGlycSBvcHRpb25hbCBzdXBwb3J0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBh
dGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3J0Yy9ydGMtZGE5MDYzLmMNCj4gPiArKysgYi9k
cml2ZXJzL3J0Yy9ydGMtZGE5MDYzLmMNCj4gPiBAQCAtNDg1LDI1ICs0ODUsMjYgQEAgc3RhdGlj
IGludCBkYTkwNjNfcnRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+
ID4gICAgICAgICAgICAgICAgIGNsZWFyX2JpdChSVENfRkVBVFVSRV9VUERBVEVfSU5URVJSVVBU
LCBydGMtPnJ0Y19kZXYtDQo+ID5mZWF0dXJlcyk7DQo+ID4gICAgICAgICB9DQo+ID4NCj4gPiAt
ICAgICAgIGlycV9hbGFybSA9IHBsYXRmb3JtX2dldF9pcnFfYnluYW1lKHBkZXYsICJBTEFSTSIp
Ow0KPiA+IC0gICAgICAgaWYgKGlycV9hbGFybSA8IDApDQo+ID4gLSAgICAgICAgICAgICAgIHJl
dHVybiBpcnFfYWxhcm07DQo+ID4gLQ0KPiA+IC0gICAgICAgcmV0ID0gZGV2bV9yZXF1ZXN0X3Ro
cmVhZGVkX2lycSgmcGRldi0+ZGV2LCBpcnFfYWxhcm0sIE5VTEwsDQo+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRhOTA2M19hbGFybV9ldmVudCwNCj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSVJRRl9UUklHR0VSX0xPVyB8IElS
UUZfT05FU0hPVCwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IkFMQVJNIiwgcnRjKTsNCj4gPiAtICAgICAgIGlmIChyZXQpDQo+ID4gLSAgICAgICAgICAgICAg
IGRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0byByZXF1ZXN0IEFMQVJNDQo+IElSUSAlZDog
JWRcbiIsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgaXJxX2FsYXJtLCByZXQpOw0KPiA+
IC0NCj4gPiAtICAgICAgIHJldCA9IGRldl9wbV9zZXRfd2FrZV9pcnEoJnBkZXYtPmRldiwgaXJx
X2FsYXJtKTsNCj4gPiAtICAgICAgIGlmIChyZXQpDQo+ID4gLSAgICAgICAgICAgICAgIGRldl93
YXJuKCZwZGV2LT5kZXYsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8g
c2V0IElSUSAlZCBhcyBhIHdha2UgSVJROiAlZFxuIiwNCj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgaXJxX2FsYXJtLCByZXQpOw0KPiA+IC0NCj4gPiAtICAgICAgIGRldmljZV9pbml0X3dh
a2V1cCgmcGRldi0+ZGV2LCB0cnVlKTsNCj4gPiArICAgICAgIGlycV9hbGFybSA9IHBsYXRmb3Jt
X2dldF9pcnFfYnluYW1lX29wdGlvbmFsKHBkZXYsICJBTEFSTSIpOw0KPiA+ICsgICAgICAgaWYg
KGlycV9hbGFybSA+PSAwKSB7DQo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IGRldm1fcmVxdWVz
dF90aHJlYWRlZF9pcnEoJnBkZXYtPmRldiwgaXJxX2FsYXJtLA0KPiBOVUxMLA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRhOTA2M19hbGFybV9l
dmVudCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBJUlFGX1RSSUdHRVJfTE9XIHwNCj4gSVJRRl9PTkVTSE9ULA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJBTEFSTSIsIHJ0Yyk7DQo+ID4gKyAg
ICAgICAgICAgICAgIGlmIChyZXQpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZGV2X2Vy
cigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIHJlcXVlc3QgQUxBUk0NCj4gSVJRICVkOiAlZFxuIiwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlycV9hbGFybSwgcmV0KTsNCj4g
PiArDQo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IGRldl9wbV9zZXRfd2FrZV9pcnEoJnBkZXYt
PmRldiwgaXJxX2FsYXJtKTsNCj4gPiArICAgICAgICAgICAgICAgaWYgKHJldCkNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBkZXZfd2FybigmcGRldi0+ZGV2LA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gc2V0IElSUSAlZCBhcyBhIHdha2UNCj4g
SVJROiAlZFxuIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpcnFfYWxh
cm0sIHJldCk7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBkZXZpY2VfaW5pdF93YWtldXAo
JnBkZXYtPmRldiwgdHJ1ZSk7DQo+ID4gKyAgICAgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgICAg
ICAgICBjbGVhcl9iaXQoUlRDX0ZFQVRVUkVfVVBEQVRFX0lOVEVSUlVQVCwNCj4gPiArIHJ0Yy0+
cnRjX2Rldi0+ZmVhdHVyZXMpOw0KPiANCj4gVGhpcyBkb2VzIG5vdCBoYW5kbGUgYW5kIHByb3Bh
Z2F0ZSByZWFsIGVycm9ycyAoZS5nLiAtRVBST0JFX0RFRkVSKS4NCg0KDQpPb3BzLiBNaXNzZWQg
cHJvcGFnYXRpbmcgZXJyb3JzLg0KDQo+IA0KPiAgICAgfSBlbHNlIGlmIChpcnFfYWxhcm0gIT0g
LUVOWElPKSB7DQo+ICAgICAgICAgICAgIHJldHVybiBpcnFfYWxhcm07DQo+ICAgICB9IGVsc2Ug
ew0KPiAgICAgICAgICAgICAuLi4uDQo+ICAgICB9DQo+IA0KPiAoSSB0aGluayAtRU5YSU8gaXMg
dGhlIGNvcnJlY3QgZXJyb3IgdG8gY2hlY2sgZm9yLA0KPiAgcGxhdGZvcm1fZ2V0X2lycV9ieW5h
bWVfb3B0aW9uYWwoKSByZWFsbHkgc2hvdWxkIHN0YXJ0IHJldHVybmluZyAgemVybw0KPiBmb3Ig
bm90IGZvdW5kKQ0KDQpBZ3JlZWQsIGN1cnJlbnRseSwgaWYgaXQgaXMgLUVOWElPLCB0aGVuIG5v
dCBmb3VuZCBjb25kaXRpb24uDQoNCkNoZWVycywNCkJpanUgDQoNCj4gDQo+ID4gKyAgICAgICB9
DQo+ID4NCj4gPiAgICAgICAgIHJldHVybiBkZXZtX3J0Y19yZWdpc3Rlcl9kZXZpY2UocnRjLT5y
dGNfZGV2KTsNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+
IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBj
YWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

