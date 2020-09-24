Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D895276AB1
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Sep 2020 09:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgIXHX0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Sep 2020 03:23:26 -0400
Received: from mail-eopbgr10085.outbound.protection.outlook.com ([40.107.1.85]:23942
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726993AbgIXHX0 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 24 Sep 2020 03:23:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cms/ec9cEfdhB0SIOeKbtQ0n8kQuFA+TZR6G24Ta/m2YXY0HknRqPKoCyWjXY7zULELMT6/qvh8GJetSUUmAFajpsd8kH2q73LVys3CFEWPghWROhyo6cOSXYWQqNgtr1MwZ9glBg6EfXls7wWXBedGIOmJZXVdoqmyGXX/o3T6jnBq+w/lppfyzcYlMohmAUtk/UM2gxwi4bwLBfmUJ64w6uFJTGMLgulf43niXgPMN0RkI3N4zUhsfdr46ato7OpgWyR2u6mPjYB0rJaX96VUc2Ow2MGcZqKpqflT5c3G+UNb6kv00MT30IEc46UoAW0u17ODZIIhXjmdfuaUiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZREFUneW/MgzohLmb3zE5TVJl7BtcXNttDKVRjrIzDw=;
 b=Q+TG7m2bkpsvmv3yblSqoeM4DH+WLQg1F6oQF0xPj4nsiDhumaUbvQT6wdV2Lj7E8h7B/1s5mkWk4uiDLwdrCHsweKvDH0CxKUs+5rL+sppdgLg2hQdw+BymssHXMOOx7fSlYqIlkErIpoCwvTaWK3Oo4jyuVg7JQv0kWy6EZS+OXnK4/uMbWEoOtcd6ZUH+fxFzyi3XE38bysyHxbUUJbIS62ixGcqJMfRZ41EPc0O9OZDXtVL3sV/lecHH6RV27EYMgQFywTXn2uJktGa8/nn8nd6rLaV6fZ5f9VGz/hbqLSzD+xNkOR0sUc+Hq7xmxmbicMv+dV1KzjEVOPpiZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZREFUneW/MgzohLmb3zE5TVJl7BtcXNttDKVRjrIzDw=;
 b=cUARNIRRiL9iRDuNecpgbI8q64sEfJBy01hYR1LWMxLNyVvk84clkwOAw2ClY9+8E/HPOlyYFTkD/ry7E4RZVgWhSPiGBWnOewRMHF1HyLKZtUvKKEYPef0i/wqcpa94uKmKJrN0vkWPmtwY8UALfSfgpxCUhILBsBDLrgsdxqE=
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com (2603:10a6:803:129::26)
 by VI1PR0402MB2720.eurprd04.prod.outlook.com (2603:10a6:800:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Thu, 24 Sep
 2020 07:23:20 +0000
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::f16e:a79:2203:5d35]) by VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::f16e:a79:2203:5d35%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 07:23:18 +0000
From:   Qiang Zhao <qiang.zhao@nxp.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [Patch v2 1/3] dt-bindings: rtc: pcf2127: Add bindings for
 nxp,pcf2127
Thread-Topic: [Patch v2 1/3] dt-bindings: rtc: pcf2127: Add bindings for
 nxp,pcf2127
Thread-Index: AQHWj9v8ujWDbe4KQkWWGAO9y9OzgKl1/KOAgAEbugCAAEnvAIAAAGkg
Date:   Thu, 24 Sep 2020 07:23:18 +0000
Message-ID: <VE1PR04MB6768783CAE7CA611365661AF91390@VE1PR04MB6768.eurprd04.prod.outlook.com>
References: <20200921054821.26071-1-qiang.zhao@nxp.com>
 <20200923094449.GP9675@piout.net>
 <DB8PR04MB67635518BE38EEF5292C8D0991390@DB8PR04MB6763.eurprd04.prod.outlook.com>
 <20200924070456.rovgp6n5q25s53vc@pengutronix.de>
In-Reply-To: <20200924070456.rovgp6n5q25s53vc@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: da3c2ed1-1e91-403c-9d28-08d8605ab5e7
x-ms-traffictypediagnostic: VI1PR0402MB2720:
x-microsoft-antispam-prvs: <VI1PR0402MB27204BDCEE004EFC0E8DB1EC91390@VI1PR0402MB2720.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R2Gk/DebX7TM1DZfg9AF/j86yQNplMlQGhdMcXYJixS2CviaUxj71mRbgE7XITy0T5o4Kxz5tJyUG0Qd+6nethFa3/UjC5QurgsvYkZqSrgjeMVCI6jxmYJInv0RK7l65mLkjb86CDm3FPIdl0XzNNRW9hsBoL8K0fYCg/mNzfVMXlX7XrTUpcsh09NxUplUTSECopYLz/0ut1DjlOtzLhH+r1v4Otew3jGarWXzJ+UnBXnjBStnXD3QEFIK4EeYH/usGsXsQqx0MueirwQVCBInCDQti2wb0M5NPxYRdLamreVzeuamM5RFhbOfIYnXN1DGXl17x7UbaMZNkiY7u2cpfrlD1xgpssYQTcFle+UxC4pf8X6hsMklj0AtUOqpBIXuZOkNEOKUWj/R9mj6V48Ds0bS7alf9I7z2g54MdrVTAoeH8ndT+v63NisrqO1qqutc9Lr6FI0GrnalYhqTja+oX9X57PydABrR+Qs1PDj+pa9bX8F6cAJacbslhza
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6768.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(366004)(136003)(396003)(45080400002)(54906003)(33656002)(6916009)(66446008)(316002)(64756008)(186003)(8936002)(5660300002)(7416002)(52536014)(71200400001)(4326008)(478600001)(7696005)(9686003)(86362001)(66476007)(66556008)(76116006)(2906002)(8676002)(66574015)(966005)(66946007)(53546011)(6506007)(83380400001)(83080400001)(44832011)(26005)(55016002)(142933001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 05DrYEBIlU7qBL3zpuzNoPfjfgE0jDwrfeIw1grCSKM2fdBdAKVZeXuCwZYe5SrvxAoQBqam87YqQBSbKe4nFvR+98zSl7C7a928nbIICuxIMEgWSUqrCHdHoelV4RRlEtvy1J6NTle8uygSd/b43ycpiHFNn6q64oI1ztnTDrYR6bp7pgmHHZt1YJ7I/cAMhsyOvQDFhMfVLWCKxK079IhE5lBciyR7/0/zadZph+9bE68GoN+REshreqPyXCIEzDjdHgndtASy/ioebhhFw/vsEqMekR7ZsXIXmoLE8kVKFu2OuOtrMNuNiNJJwpD5kSpiB3e1JfJLSelYRorJibMyaZmLjCcwS79wVeOxzD5KP534KdUZ0Z5hH39fZ1eo0hfLd+dmEXYURYug/ZDsZSZenGEmHUqaCeukdY8AW0q8E/1LCrlM5IOVcYBwPC9IdzRigj1WBj/bDRvsdnMC9bN2KzpGnC2taCkiVHxW7mhJFpsqlc/8Sfih2WRge5yE/mY/uQBmev1Jd/2jmairB79Kd53Gv2clLFUjps56okXn4B9nQ0UVUNqcrE1ToSHDnhC0iJwI0tRm1KhWjO13JR+N4OdG9mXruCgx9DmjRAXKqRVBH+PxkWBVw11bD+P/EPbSc9glNMe89r/C5tA39g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6768.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da3c2ed1-1e91-403c-9d28-08d8605ab5e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 07:23:18.7054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yHCt3FJvom1R+d6tbpyyAzoFRQ8CKnK197cCK8/vd8EzBLCxZULAOeBm75ZaGz6GDdabV/l8MmnGwTpBgrfPPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2720
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gVGh1LCBTZXAgMjQsIDIwMjAgYXQgMTU6MDVBTSArMDAwMCwgVXdlIEtsZWluZS1Lw7ZuaWcg
PHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6DQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5p
Z0BwZW5ndXRyb25peC5kZT4NCj4gU2VudDogMjAyMOW5tDnmnIgyNOaXpSAxNTowNQ0KPiBUbzog
UWlhbmcgWmhhbyA8cWlhbmcuemhhb0BueHAuY29tPg0KPiBDYzogQWxleGFuZHJlIEJlbGxvbmkg
PGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPjsgV2ltIFZhbiBTZWJyb2Vjaw0KPiA8d2lt
QGxpbnV4LXdhdGNoZG9nLm9yZz47IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD47
DQo+IGxpbnV4LXdhdGNoZG9nQHZnZXIua2VybmVsLm9yZzsgYS56dW1tb0B0b3dlcnRlY2guaXQ7
IHJvYmgrZHRAa2VybmVsLm9yZzsNCj4gbGludXgtcnRjQHZnZXIua2VybmVsLm9yZzsgZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGtl
cm5lbEBwZW5ndXRyb25peC5kZQ0KPiBTdWJqZWN0OiBSZTogW1BhdGNoIHYyIDEvM10gZHQtYmlu
ZGluZ3M6IHJ0YzogcGNmMjEyNzogQWRkIGJpbmRpbmdzIGZvcg0KPiBueHAscGNmMjEyNw0KPiAN
Cj4gSGVsbG8sDQo+IA0KPiBPbiBUaHUsIFNlcCAyNCwgMjAyMCBhdCAwMzoyMDozM0FNICswMDAw
LCBRaWFuZyBaaGFvIHdyb3RlOg0KPiA+IE9uIDIxLzA5LzIwMjAgMTM6NDg6MTkrMDgwMCwgUWlh
bmcgWmhhbyB3cm90ZToNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
PiA+IEZyb206IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNv
bT4NCj4gPiA+IFNlbnQ6IDIwMjDlubQ55pyIMjPml6UgMTc6NDUNCj4gPiA+IFRvOiBRaWFuZyBa
aGFvIDxxaWFuZy56aGFvQG54cC5jb20+DQo+ID4gPiBDYzogV2ltIFZhbiBTZWJyb2VjayA8d2lt
QGxpbnV4LXdhdGNoZG9nLm9yZz47IEd1ZW50ZXIgUm9lY2sNCj4gPiA+IDxsaW51eEByb2Vjay11
cy5uZXQ+OyBsaW51eC13YXRjaGRvZ0B2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBhLnp1bW1vQHRv
d2VydGVjaC5pdDsgcm9iaCtkdEBrZXJuZWwub3JnOyBsaW51eC1ydGNAdmdlci5rZXJuZWwub3Jn
Ow0KPiA+ID4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IFV3ZQ0KPiA+ID4gS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1
dHJvbml4LmRlPg0KPiA+ID4gU3ViamVjdDogUmU6IFtQYXRjaCB2MiAxLzNdIGR0LWJpbmRpbmdz
OiBydGM6IHBjZjIxMjc6IEFkZCBiaW5kaW5ncw0KPiA+ID4gZm9yDQo+ID4gPiBueHAscGNmMjEy
Nw0KPiA+ID4NCj4gPiA+IEhpLA0KPiA+ID4NCj4gPiA+IFlvdSBmb3Jnb3QgdG8gY29weSB0aGUg
d2F0Y2hkb2cgbWFpbnRhaW5lcnMsIEkgdGhpbmsgc3VjaCBhIHByb3BlcnR5DQo+ID4gPiBzaG91
bGQgYmUgZGlzY3Vzc2VkIHdpdGggdGhlbS4NCj4gPiA+DQo+ID4gPiBOb3RlIHRoYXQgSSdtIHN0
aWxsIGNvbnZpbmNlZCB0aGlzIGlzIG5vdCBhIGNvbXBsZXRlIHNvbHV0aW9uLCBzZWU6DQo+ID4g
PiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0
cHMlM0ElMkYlMkZsbw0KPiA+ID4gcmUua2Vybg0KPiA+ID4NCj4gZWwub3JnJTJGbGludXgtcnRj
JTJGMjAyMDA3MTYxODE4MTYuR0YzNDI4JTQwcGlvdXQubmV0JTJGJmFtcDtkYXRhPQ0KPiA+ID4N
Cj4gMDIlN0MwMSU3Q3FpYW5nLnpoYW8lNDBueHAuY29tJTdDYjcxZjc5YTA0NGIwNDkzZDZkNGYw
OGQ4NWZhNTUxYw0KPiA+ID4NCj4gYiU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1
JTdDMCU3QzElN0M2MzczNjQ1MTA5MzExNzQNCj4gPiA+DQo+IDM1NSZhbXA7c2RhdGE9JTJCT3hy
ekI4Ukl1eE05TGV0NXNsaGZDVm1NbTZQTU5vRVJEZUhDOSUyRmR4bmcNCj4gPiA+ICUzRCZhbXA7
cmVzZXJ2ZWQ9MA0KPiANCj4gaGFoYQ0KPiANCj4gPiBZZXMsIHlvdSBhcmUgcmlnaHQsIFRoZXJl
IGlzIG5vdCBhIGZ1bmRhbWVudGFsIHNvbHV0aW9uLg0KPiA+IEhvd2V2ZXIgaXQgc29tZXdoYXQg
YXZvaWQgdGhpcyBzaXR1YXRpb24gYXQgbGVhc3QuDQo+ID4NCj4gPiBBbmQgaWYgd2l0aG91dCB0
aGlzIGlzc3VlLA0KPiA+IGlzIGl0IGNvcnJlY3QgdG8gcmVnaXN0ZXIgYSBydGMgZGV2aWNlIGFz
IHdhdGNoZG9nIG5vIG1hdHRlciBpdCBpcyB1c2VkIGFzDQo+IHdhdGNoZG9nIG9uIHRoZSBib2Fy
ZD8NCj4gPiBFdmVyeSB0aW1lIExpbnV4IGFyZSBib290ZWQgdXAsIHdhdGNoZG9nIGRldmljZSBz
aG91bGQgYmUgY29uZmlndXJlZCB0byB0aGUNCj4gcmlnaHQgb25lIG1hbnVhbGx5Lg0KPiA+IFNv
IHRoZSBwYXRjaCBhcmUgdXNlZnVsLCBldmVuIHRob3VnaCBpdCBpcyBub3QgZm9yIHRoZSBpc3N1
ZS4NCj4gPg0KPiA+IFdoYXQgc2hvdWxkIHdlIGRvIHRvIHJlYWxseSByZXNvbHZlIHRoaXMgaXNz
dWU/DQo+IA0KPiBJIHN0aWxsIHRoaW5rIHdlIG5lZWQgYSBrZXJuZWwgc29sdXRpb24gaGVyZS4g
SSB3b3VsZCBleHBlY3QgdGhhdCBtb3N0IGFzc2VtYmxlZA0KPiBwY2YyMTI3IGNoaXBzIGFyZSB1
bmFibGUgdG8gYWN0IGFzIGEgd2F0Y2hkb2cgKGkuZS4gZG9uJ3QgaGF2ZSB0aGUgUlNUIG91dHB1
dA0KPiBjb25uZWN0ZWQgdG8gc29tZXRoaW5nIHRoYXQgcmVzZXRzIHRoZSBtYWNoaW5lKS4NCj4g
DQo+IFNvIG15IGZhdm91cmVkIHNvbHV0aW9uIHdvdWxkIGJlIGEgcG9zaXRpdmUgcHJvcGVydHkg
bGlrZToNCj4gDQo+IAloYXMtd2F0Y2hkb2c7DQo+IA0KPiBvciBzb21ldGhpbmcgc2ltaWxhci4g
SW4gbXkgZXllcyB0aGlzIGlzIGRlZmluaXRlbHkgc29tZXRoaW5nIHdlIHdhbnQgdG8gc3BlY2lm
eQ0KPiBpbiB0aGUgZGV2aWNlIHRyZWUgYmVjYXVzZSBpdCBpcyBhIHJlbGV2YW50IGhhcmR3YXJl
IHByb3BlcnR5Lg0KPiBJIGNvbnNpZGVyIGl0IGEgYnVnIHRvIGdpdmUgYSB3YXRjaGRvZyBkZXZp
Y2UgdG8gdXNlcnNwYWNlIHRoYXQgaXNuJ3QgZnVuY3Rpb25hbC4NCj4gDQo+IEJlc3QgcmVnYXJk
cw0KPiBVd2UNCiANCkkgc3Ryb25nbHkgYWdyZWUgd2l0aCB5b3UhIEl0IHNob3VsZCBiZSBwb3Np
dGl2ZSBwcm9wZXJ0eS4NCkhvd2V2ZXIsIHdlIGNvdWxkbid0IGlkZW50aWZ5IHdoaWNoIGJvYXJk
IGFyZSB1c2luZyBwY2YyMTI3IGFzIHdhdGNoZG9nLA0KU28gd2UgYXJlIHVuYWJsZSB0byBtb2Rp
ZnkgdGhlIGJvYXJkcycgZHRzIHRvIGNvcnJlY3QgKHdhdGNoZG9nIG9yIG5vdCkgaW4gdGhpcyBw
YXRjaHNldC4NCg0KSSBub3RpY2VkIHRoYXQgb25seSBMUyBzZXJpZXMgcGxhdGZvcm1zIGFuZCBp
bXg2IGhhdmUgcGNmMjEyNyBub2RlLCBhcyBmYXIgYXMgSSBrbm93LCB0aGUgTFMgcGxhdGZvcm1z
IGRvbid0IHVzZSBpdCBhcyB3YXRjaGRvZywNCkJ1dCBJIGFtIG5vdCBzdXJlIGFib3V0IGlteDYN
Cg0KPiANCj4gLS0NCj4gUGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgVXdlIEtsZWluZS1Lw7ZuaWcNCj4gfA0KPiBJbmR1c3RyaWFsIExpbnV4IFNvbHV0aW9ucyAg
ICAgICAgICAgICAgICAgfCBodHRwczovL3d3dy5wZW5ndXRyb25peC5kZS8gfA0KQmVzdCBSZWdh
cmRzDQpRaWFuZyBaaGFvDQo=
