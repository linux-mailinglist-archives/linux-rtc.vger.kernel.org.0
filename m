Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB91A709C0E
	for <lists+linux-rtc@lfdr.de>; Fri, 19 May 2023 18:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjESQKt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 May 2023 12:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjESQKp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 May 2023 12:10:45 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2137.outbound.protection.outlook.com [40.107.113.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F99C2;
        Fri, 19 May 2023 09:10:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRiNVaSTcyemROiO1Uq1mCRWiaRmcqcDUmvgVFLsOAmykpdlZy6PCu55fDDVjCBq4ftlG2UXvCGuYEBAP58PzPG+a/iurxlfTBAe9DfXx8b8kum9B2qLi88822RE0bjnlNAcxwfI8G0Hk+QeSI062Zj++kYA9E1fEvpo6jpZzIhaA+CAh3/twY9Ungg8kQ/Z+3wHoT5Arw1a2GESSItWt9SCfTmt2Kf5syRDr5U4U+/Uqj9/Nn+xACJdLWxODGE/DkJrdIhzViyhkS0hoForfblZmy4N2SffNL1SqFMly2j2PqH92f8W7ToF9vmKd5MD57OUYOya/wapX5rP9KdN9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMN2+D6aeEIuwI9HauIqLYGkVuEajI+gbK8302ZNdQ4=;
 b=UN2V6wCLcjAq2vlElcKvHxYpAs+T1Z4+6+xmsfXyn0HzYUz7gXK2cf+l7ZxtOuB5whwm7T3Xk0W3tte2ABCbkcVfZGvCMSu8SLqYmO/9i8IHcKtCI8n67IFvMnnZrtoe0I3G2nFHqpV4gqK7DKfgAu9BrSXd6NH2Yb+k/at6S1yNL13eWsdmjWHgu4tmbOMS1kVu6HmbHrdUjY1RDIG3/+JgL8HL1TjXp3ii8uVH4+r9I+cEKhPGllVfezx6HD+cOr2C7a2FiZ1Uc2+SYaRgGtwYb6wytqU9zLKui8ztxVNhnAnAcULSimH2vEM7Gpj0nrbnHzA52dNxZ4BYzJ9dHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMN2+D6aeEIuwI9HauIqLYGkVuEajI+gbK8302ZNdQ4=;
 b=ufqJNBgTLM1VpzOL8nhuTUzFvDAngp3eRqcAXlEf+NL/c5w0g3FTXtDDFsNYVGEm/LdmR9RWxkIhbzB8dp3F4aXHi1RvElRXnxnZWvDS739XxDaFb/k10IbG14I4hU8V8Cfv9sMQa3nPDqB80MsOZ/0+aKdsnVBpsWqxVfAf760=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9871.jpnprd01.prod.outlook.com (2603:1096:400:237::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 16:10:40 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 16:10:40 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 05/11] rtc: isl1208: Make similar I2C and DT-based
 matching table
Thread-Topic: [PATCH v4 05/11] rtc: isl1208: Make similar I2C and DT-based
 matching table
Thread-Index: AQHZiX0Y/g2rupGPLkWYfWCeLVhlIq9hiqwAgAA45eCAAAI3EA==
Date:   Fri, 19 May 2023 16:10:40 +0000
Message-ID: <OS0PR01MB59229AB121D292BF5CEF18F4867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdXaJtZVxp5faw=vovsdukdwiXH8RbaJfiKAoOKTLWrZzA@mail.gmail.com>
 <OS0PR01MB5922AFB243478AA9FA2B0CBC867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922AFB243478AA9FA2B0CBC867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB9871:EE_
x-ms-office365-filtering-correlation-id: 03677579-12a9-4fe1-e76f-08db58839761
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s7EWPZp1vNdvxRckWyQHVmBQVl5EtgyoUuC4qta589gzyJnO37iIU5ycZGF7lWuwDCwDL1CT3f/gxPMVo2IQI5UhG7LVP/1zLYHksJQgtDCkYKhwt32Anjv1VLmYVhT57RJ8NzbYNa5ua5YkRLSqTaEiZ7Gr5V2AmdMr7KnOqLic09EVskLmYQ/8iSgaUhlFiSdoVjSlRnXFZjm8Epblz6jHImG90zl6qgtP1TSg206WInbX77BbPk+hlcCBh3Qxh6tLukkTlRUARKhD2TPE3E/eLRHzCx5CtnRUJyscqX+dYYxZhC3Ho+D+k3ZDzE2wBbhGD/pLhKJgZvQKUweHGfhI4GLA2iSo4juh9+MEaN9z/sEkl92l4xC4DkTTXjbSPvIq8oEHwIL/ecKScxhr45o6vgFd6JsH18BaiHZo4QXLBcrJYIdxQAr9tBLlCalX/U0hVBPgv1WLYE3WceYl/I+on9tZY+eqhcl3jrZ3lVwuV5O0Fi+KMYBX0c9rutNQviYNP1zjYA8nNcHRAfpcxzLYr+F4U53EKAPK3j88JdvvQ2MX/gEPW1hvZKUzEGgd4bfrI1aGzThtG7rG8cUkD5Z0pUhyYlS4/DZK6LJihQkORE06AqWftj+P6Eg7VQ8/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199021)(86362001)(33656002)(55016003)(53546011)(8936002)(26005)(8676002)(9686003)(5660300002)(6506007)(186003)(2940100002)(52536014)(316002)(54906003)(66446008)(66556008)(76116006)(66946007)(110136005)(41300700001)(66476007)(64756008)(478600001)(7696005)(4326008)(71200400001)(38100700002)(122000001)(38070700005)(83380400001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjhDZTlOaEtySFFJcGROcHBiaFJtc0xFNmZaSG1OUnBKaXJ0ZGNxNHNuR0hE?=
 =?utf-8?B?cXM5bjd1K0FSN1ZIbFZCR25HanNNaUE3RFBWZkxJUXJLdXVUMENVakc3SCtQ?=
 =?utf-8?B?OHBTUElTWDFkNlVYRmJmSjV2eTJza2xrRDhZVk9MeHptYVQrSzROU1RXSFlu?=
 =?utf-8?B?dU9ubTFhK0VvczlVU1p0dVd1ZUVyTi9POEcxN2U1TFhHMlUrVERWQ2NiRytv?=
 =?utf-8?B?d0dqeHhGZXVicUpYNnY3ODVvUEN1U0lMd3ZiSXhzWmp0cmdjZ2Vuc2RsMy9N?=
 =?utf-8?B?Q1dYcGxFd3hvNWRmT1lkZTU4cktQekxsTU15aVpsMlF2U2l6WG80OHJOYm4y?=
 =?utf-8?B?TEJCY2wwS2JYNE1LOC9JdktCSGpZTHF5c28vd0x2Qlp1c01pbGdDQkI4cGVS?=
 =?utf-8?B?cTJEbU9IYksrL1N3NW40YWJ5TDU0UjcvYm5iVWdzZzlyUUNDYTRTN0t4V2Yy?=
 =?utf-8?B?T3FuRm1LVTZmVUVuRmV1MFkrSDl2Wm4zMmdLMk40OHpYSFpaVHh1cUdOTmlC?=
 =?utf-8?B?MEcxZVQvNnRPL2tqdEZDVGFTZnZONzhNSS9zeVpFc01zWW1SbWxtbXZ3WE1R?=
 =?utf-8?B?ejZpZVUwRTU2Z0dPNXZhRjJ6TDdMYnFJSjVyOGZSbXJmc0p6QnJJZlVnTEJn?=
 =?utf-8?B?dVNwZkRPY2lMYmNDcUZMd3I3dXBrZ1IvRHYva2tsaWdVeVFDa2tmeis5KzZL?=
 =?utf-8?B?WnpUUkRneEF1QnFEWW5BanF3VURFN1VjeU9CU2NCYjd0NTZ6d2x4R2EwWEU1?=
 =?utf-8?B?TGFPMkpCT25OOVlhaW5zeHlIdE1FbE93RVNpUzArcG9PWlA3Y0lmMHNiaGFF?=
 =?utf-8?B?MzM1T1YycWdhb1FaQjE5NE8zVzZpUlBYYnpqbHJzT01RK01NT1NyUDdVYnpR?=
 =?utf-8?B?cGpPQy8wWWQrVTI3SEVQdDhxaldRb0pPRDZHU0xvVExpbWR0VktBdUZLK25F?=
 =?utf-8?B?c2RwajQrdnhCTHIzZStJYjFDeXF4MU9FNjlKakJqUHBTT3B4cHVCRUEyK1FC?=
 =?utf-8?B?K0Fkdy95N3VhSktBOEk4L2JEcUdRaFlYMmlrUUgvcStRdWc0VlBHL1FOeTRu?=
 =?utf-8?B?Vjk4ZTJDNFlOcjhMRXBYWmJQUkRRTlE3azZIS1VsZ0JiNW5FR2NEck1VeHdk?=
 =?utf-8?B?MU1ROGd5RVhRWDFkcmJYMmlaVDhzUzJUcTRBQzNPLzFTNngyemxSK3plQnRu?=
 =?utf-8?B?KzN2VWhxeTg2ZzRzaHgrNG5xb2lpM2dwdGlraHVEb0VVTFBJb04rR1grb2FP?=
 =?utf-8?B?S1ZGS1JBRStyWlZFejc2RjhGTjR4ZmVrT1pwSG10a1poOUZER05EZHdVSlN6?=
 =?utf-8?B?cmYyYVdjak54emxpODhmR0ViMjkyOEkwYXZmMDNuaVJ1MHhJQTBMNnhRZXo3?=
 =?utf-8?B?VlhoZXlHOFEyRUNVeElNSzdxUmFYNy9rMllIeGxiSkl4WUZDdDU5Zi83WFJQ?=
 =?utf-8?B?U1BhcFZYbnNiUURXQUlmMHdSUmpaVlEyeTBUMHkwSDNsb0pheThRakRRZXhS?=
 =?utf-8?B?eHBuelAwVEZtbzhaSU9BcEIyT3lFY2NWcnBmaG5WVm9pSTdvWUFxclhEMktp?=
 =?utf-8?B?emd6NzliWTdCSlBEazZiRHZUdkVEelh3eTc3ZWxydzdnRkZwWWlqZHdaRkpI?=
 =?utf-8?B?OFNuTkdRTGhibkszQS9yajNYeStZalAvRzMvTTRXKzQ3VTI4V09IODRvVHVY?=
 =?utf-8?B?Vmg5b0VOZXBvak9tWW9oalFvemx4dzZOZkdORlBpY0pKeTNMZXNWTTN2Zlow?=
 =?utf-8?B?cjduMSttVGV4ZEZjNlRyeXBmZXFkMmg4WDZ0T3JxemR4Y1VJTXhwdkFvTlhB?=
 =?utf-8?B?Nno4THJmamYrMms4NEc1ZWF3R1FhWXFhSWJQYnJWQUFkYXpjcmUwVDVmOW1m?=
 =?utf-8?B?bURWS2hQdFI3S1Z6ZWM3NGxZN3RDbGZZV0cvMU9EWXQ3MkxIbFppN25LdFJU?=
 =?utf-8?B?VlBMOTduOWRGL1BqTElCZU5nUER1S2lRMC9SbmlxT2gwZmk2a2hQSDZwN0dR?=
 =?utf-8?B?bEpMcVV5c3k3d2lKU01ieXlkcGNxczUwRDY2MExFaUpNck1vUktIeEdiZUtV?=
 =?utf-8?B?RlIxZXdMSjQvTnJHNkY3T0N6aWV4aytLT2tpT015Y0x1THBQZWRYUWFOcVht?=
 =?utf-8?Q?QGefz/fu1vwa5CRlXRaSVgGYY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03677579-12a9-4fe1-e76f-08db58839761
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 16:10:40.6295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 47/ZtV5g5otvgSrNUU9BldAPfMaYo3CUanW9wbS6SGISAJ3FHmD18bpmMRwCpP5FiDhXwKSsRGWaJmgutvJAcA+hnRmKLKNHERzJn+yotcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9871
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

KyBXb2xmcmFtDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBTZW50OiBGcmlkYXksIE1heSAxOSwg
MjAyMyA1OjA5IFBNDQo+IFRvOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsu
b3JnPg0KPiBDYzogQWxlc3NhbmRybyBadW1tbyA8YS56dW1tb0B0b3dlcnRlY2guaXQ+OyBBbGV4
YW5kcmUgQmVsbG9uaQ0KPiA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+OyBsaW51eC1y
dGNAdmdlci5rZXJuZWwub3JnOyBGYWJyaXppbw0KPiBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5q
ekByZW5lc2FzLmNvbT47IGxpbnV4LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmcNCj4g
U3ViamVjdDogUkU6IFtQQVRDSCB2NCAwNS8xMV0gcnRjOiBpc2wxMjA4OiBNYWtlIHNpbWlsYXIg
STJDIGFuZCBEVC0NCj4gYmFzZWQgbWF0Y2hpbmcgdGFibGUNCj4gDQo+IEhpIEdlZXJ0LA0KPiAN
Cj4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4NCj4gPiBTZW50OiBGcmlkYXksIE1heSAxOSwgMjAyMyAxOjM5IFBNDQo+ID4gVG86IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBDYzogQWxlc3NhbmRybyBadW1t
byA8YS56dW1tb0B0b3dlcnRlY2guaXQ+OyBBbGV4YW5kcmUgQmVsbG9uaQ0KPiA+IDxhbGV4YW5k
cmUuYmVsbG9uaUBib290bGluLmNvbT47IGxpbnV4LXJ0Y0B2Z2VyLmtlcm5lbC5vcmc7IEZhYnJp
emlvDQo+ID4gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+OyBsaW51eC1y
ZW5lc2FzLQ0KPiA+IHNvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gPiBTdWJqZWN0OiBSZTogW1BBVENI
IHY0IDA1LzExXSBydGM6IGlzbDEyMDg6IE1ha2Ugc2ltaWxhciBJMkMgYW5kIERULQ0KPiA+IGJh
c2VkIG1hdGNoaW5nIHRhYmxlDQo+ID4NCj4gPiBPbiBUaHUsIE1heSAxOCwgMjAyMyBhdCAxOjM3
4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IHdyb3RlOg0K
PiA+ID4gVGhlIGlzbDEyMDhfaWRbXS5kcml2ZXJfZGF0YSBjb3VsZCBzdG9yZSBhIHBvaW50ZXIg
dG8gdGhlIGNvbmZpZywNCj4gPiA+IGxpa2UgZm9yIERULWJhc2VkIG1hdGNoaW5nLCBtYWtpbmcg
STJDIGFuZCBEVC1iYXNlZCBtYXRjaGluZyBtb3JlDQo+IHNpbWlsYXIuDQo+ID4gPg0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+
ID4gLS0tDQo+ID4gPiB2NDoNCj4gPiA+ICAqIE5ldyBwYXRjaC4NCj4gPg0KPiA+IFJldmlld2Vk
LWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiA+DQo+
ID4gPiBAQCAtODIyLDkgKzgyMiw5IEBAIGlzbDEyMDhfcHJvYmUoc3RydWN0IGkyY19jbGllbnQg
KmNsaWVudCkNCj4gPiA+ICAgICAgICAgfSBlbHNlIHsNCj4gPiA+ICAgICAgICAgICAgICAgICBj
b25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCAqaWQgPQ0KPiA+ID4gaTJjX21hdGNoX2lkKGlzbDEy
MDhfaWQsIGNsaWVudCk7DQo+ID4gPg0KPiA+ID4gLSAgICAgICAgICAgICAgIGlmIChpZC0+ZHJp
dmVyX2RhdGEgPj0gSVNMX0xBU1RfSUQpDQo+ID4gPiArICAgICAgICAgICAgICAgaWYgKCFpZCkN
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPiA+ID4gLSAg
ICAgICAgICAgICAgIGlzbDEyMDgtPmNvbmZpZyA9ICZpc2wxMjA4X2NvbmZpZ3NbaWQtPmRyaXZl
cl9kYXRhXTsNCj4gPiA+ICsgICAgICAgICAgICAgICBpc2wxMjA4LT5jb25maWcgPSAoc3RydWN0
IGlzbDEyMDhfY29uZmlnDQo+ID4gPiArICopaWQtPmRyaXZlcl9kYXRhOw0KPiA+DQo+ID4gSXQn
cyBhIHBpdHkgdGhlcmUncyBubyBpMmNfZ2V0X21hdGNoX2RhdGEoKSB5ZXQuLi4NCj4gDQo+IFlv
dSBtZWFuLCBpbnRyb2R1Y2UgWzFdIGFuZCBvcHRpbWl6ZSA/Pw0KPiANCj4gCWlmIChjbGllbnQt
PmRldi5vZl9ub2RlKQ0KPiAJCWlzbDEyMDgtPmNvbmZpZyA9IG9mX2RldmljZV9nZXRfbWF0Y2hf
ZGF0YSgmY2xpZW50LT5kZXYpOw0KPiAJZWxzZQ0KPiAJCWlzbDEyMDgtPmNvbmZpZyA9IGkyY19n
ZXRfbWF0Y2hfZGF0YShpc2wxMjA4X2lkLCBjbGllbnQpOw0KPiANCj4gCWlmICghaXNsMTIwOC0+
Y29uZmlnKQ0KPiAJCXJldHVybiAtRU5PREVWOw0KPiANCj4gWzFdDQo+IGNvbnN0IHZvaWQgKiBp
MmNfZ2V0X21hdGNoX2RhdGEoY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkLCBjb25zdA0K
PiBzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KSB7DQo+IAlpZiAoIShpZCAmJiBjbGllbnQpKQ0K
PiAJCXJldHVybiBOVUxMOw0KPiANCj4gCXdoaWxlIChpZC0+bmFtZVswXSkgew0KPiAJCWlmIChz
dHJjbXAoY2xpZW50LT5uYW1lLCBpZC0+bmFtZSkgPT0gMCkNCj4gCQkJcmV0dXJuIGlkLT5kcml2
ZXJfZGF0YTsNCj4gCQlpZCsrOw0KPiAJfQ0KPiAJcmV0dXJuIE5VTEw7DQo+IH0NCj4gRVhQT1JU
X1NZTUJPTChpMmNfZ2V0X21hdGNoX2RhdGEpOw0KPiANCj4gQ2hlZXJzLA0KPiBCaWp1DQo=
