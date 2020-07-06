Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63A812152CE
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2020 08:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbgGFG6V (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 6 Jul 2020 02:58:21 -0400
Received: from mail-eopbgr1320053.outbound.protection.outlook.com ([40.107.132.53]:53053
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727039AbgGFG6V (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 6 Jul 2020 02:58:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcQ/7t368bbwQGloz98aZfAXk7SW9oGrHr4e4UW8WeDxoWj56xOv937GUQF2pD833RQqdaFiPGxzn7PGW5d6eLM1mwECJiMtawAqOHhecIkpm+O3ylNDnxZ7huSFOnlW2bodZ+dheieFA9LsUmpnuvjnXHpdF3Rh2enJFno2n/2GsvfCwQEfXBdQ7PIP5b/uvx5Kt/am9m+4Tu7BcCK7AROTz3Z+ebzzEl14vYXeug8r2V5AQv18P2D/9Xg9TdUUsUnwBLwbYLlO16b/WhLG9H9qhfHRgUPKAyll09DEiPdG/PdRIQ7LsRi2iABYOuBAtcP3//dYDxvKG/E8a+x1bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77atAwIpFfPTfzajn33tvKWpP9jDqvMEaXM5GzlF73I=;
 b=BWE1AZTX5DJ8JzX6FORwea5S3ZZumUrZ80XdbfDBrS2niY3I9rDwnCuYDXrAVr2RaJrSlLLQKKKjyZx16A6D4b5TkzrpYvkUqtFMP3Mwye6dexwETI/iRed8NeEpu7xMInn93Hg+VFHnBYhoJS8EnjaeXjGUPPQtOtFAAc5eB7emt2jw1k/D/dP29Zj2Jls427eAEj/kV8H6gp3S594L1N5wT/VRg+eF/Tk+S4D0BDGX3qP4+qB8g71BEHJHwuRC47FiT8jnQK+NTF/20tOJGscpEKi5GaDdk6pVtMTU0M9/2lLkG4zCDcqochV0UEwWvxsfMDls3yJ4EFCdEETAGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77atAwIpFfPTfzajn33tvKWpP9jDqvMEaXM5GzlF73I=;
 b=dtgCdTTQkV6PuiK+A9emHZvTWaI3H3iCAyoP9igGaFcrZ0kpcOZqxJhlw2dFsjYwO+EnyYtYkem3NJSaOHGUc5vn8hV0/6xvMQlUcqLPRU7QGtHC7PIMnmsJQvMhQOtKqJqT+3lk9JVjkzVMeJ4DtBOF2QpeffQFm5D3cUBEo/E=
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 (2603:1096:202:22::12) by HK2PR01MB3282.apcprd01.prod.exchangelabs.com
 (2603:1096:202:23::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Mon, 6 Jul
 2020 06:58:17 +0000
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::dce:9650:6c58:8b77]) by HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::dce:9650:6c58:8b77%4]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 06:58:17 +0000
From:   =?utf-8?B?Sm9obnNvbiBDSCBDaGVuICjpmbPmmK3li7Mp?= 
        <JohnsonCH.Chen@moxa.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Guenter Roeck <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: RE: [PATCH v2] rtc: rtc-ds1374: wdt: Use watchdog core for watchdog
 part
Thread-Topic: [PATCH v2] rtc: rtc-ds1374: wdt: Use watchdog core for watchdog
 part
Thread-Index: AQHWUS8HfLcV30QOOkmEN8LmAnoqcKj5HksAgADmLRCAABg0AIAABA0A
Date:   Mon, 6 Jul 2020 06:58:16 +0000
Message-ID: <HK2PR01MB32810CD5ED24462A76A4B8E2FA690@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
References: <HK2PR01MB3281245DE7A646BCB12D987DFA6A0@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
 <20200705152410.GB5663@roeck-us.net>
 <HK2PR01MB328121F60A378124D2C83698FA690@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
 <20200706063438.GF6538@piout.net>
In-Reply-To: <20200706063438.GF6538@piout.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=moxa.com;
x-originating-ip: [123.51.145.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0023cb62-fe86-4dc7-ad72-08d82179f5c2
x-ms-traffictypediagnostic: HK2PR01MB3282:
x-microsoft-antispam-prvs: <HK2PR01MB328274E4CD342CDD19749EAFFA690@HK2PR01MB3282.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 04569283F9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KzOcr2d7RAWl6yqP7cYQIMOcsI2TzwyDB5TgyJa4zSpnVCIJgbt1GkcNgxRFqsBPOTmRXVndyCwJQQRXoId+AoxmY1xfrIqjUmBnbqK15Bq/y6z8LXTccfMf4dKyr9SK3kmJ6XDbGAwap5H3XJVuni5vJmeQ/7bCSzGXt9jX2AEXxw6UQqvC7gJPB0HMOSLzDgFSEm5qdsbKzu4JN82oApb2yaD/cqtzpu9toGcr9TLV9FAt8FmBDRtij6tzKVtew4l1xSQE2IbF53qKXYIG8xgcF8hu1p+xviuRBqMGn0DM3fs4t14zVrVqWLr9elJ5UJDSbVM8nrDtaaHiBTKulkVWrIBDwrnw2rG2CtcU5w/RKuD631Wn4ha+uXqLvnurl3iTnliCI206K/55L7JrSN6UAjcCXYxxMXi1fhTb8/JwEa83TvTissOAab6QuAIiDYUB1hj3wexT9dussNKVqA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR01MB3281.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39850400004)(66476007)(66556008)(5660300002)(76116006)(64756008)(66446008)(66946007)(55016002)(4326008)(86362001)(966005)(52536014)(478600001)(9686003)(2906002)(33656002)(71200400001)(26005)(8936002)(6916009)(186003)(4744005)(8676002)(85182001)(6506007)(83380400001)(54906003)(316002)(7696005)(171213001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 7k1QgoWrjnmtGUEOI0qLFE0Tqpc2TVd2VE7GjAc7A9CJaNNkhwbrTgZkHuZdNPj7IaXdKy7V+DYdRCZI3yjzScR9CvQcn9ZtA1AeciyyHmtr8FYbWnyLMNysF0U1Dq9aOyCDVZdIDnhH7DYZPm4Wy6Iw6STxNcSnV1zbtiBjTpR6KJgXBFrpkX1Y4idnz5+O/feOCLEWpBeTePaWrJYYHmQ7D4VR2JRXJezDoipSIuqrde6ef0RU8bl3aRpsDF5wPH2UnsnxoNa1Q+XkLwAIT/b3jjMquQIL7fiRu7Jk078+cCTP1L8YbpzSVroKVG/oBi2l7puDbC8qEMT9UNiA8t6rlCacYgFKoWjd0up1lHcK4tHCiesAVE9Kj1GmUmI/dX8yihp9u9PlvW78G9Qcg//NHUiwytcfJH8XIMQonNeLLGjsLCjOm0trI099r346kbMP81WBEya4ABxDi186i3U8pn4ckxEoqTecQe0RLCM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR01MB3281.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0023cb62-fe86-4dc7-ad72-08d82179f5c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2020 06:58:16.8912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ptsVG7eTka0AgYZXa+Nv4ixCcZTTHSM2YvmPnKm+5gnUfdY5koAUK8J7vJADXaFrzXc/PfiIvC7eEkBIVVgFzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR01MB3282
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGksDQoNCj4gPiA+ID4gKwlyZXQgPSBkZXZtX3dhdGNoZG9nX3JlZ2lzdGVyX2RldmljZSgmY2xp
ZW50LT5kZXYsICZkczEzNzQtPndkdCk7DQo+ID4gPiA+ICAJaWYgKHJldCkgew0KPiA+ID4gPiAt
CQltaXNjX2RlcmVnaXN0ZXIoJmRzMTM3NF9taXNjZGV2KTsNCj4gPiA+ID4gKwkJZGV2X2Vycigm
Y2xpZW50LT5kZXYsICJmYWlsZWQgdG8gcmVnaXN0ZXIgRFMxMzc0IHdhdGNoZG9nDQo+ID4gPiA+
ICtkZXZpY2VcbiIpOw0KPiANCj4gVGhlcmUgd2FzIG5vIGVycm9yIG1lc3NhZ2UgYmVmb3JlLCBJ
IGRvbid0IHRoaW5rIHRoaXMgb25lIGlzIG5lY2Vzc2FyeS4NCj4gDQo+ID4gPiA+ICAJCXJldHVy
biByZXQ7DQo+ID4gPiA+ICAJfQ0KPiA+ID4gPiAtCWRzMTM3NF93ZHRfc2V0dGltZW91dCgxMzEw
NzIpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJZGV2X2luZm8oJmNsaWVudC0+ZGV2LCAiRFMxMzc0
IHdhdGNoZG9nIGRldmljZSBlbmFibGVkXG4iKTsNCj4gPiA+DQo+ID4gPiBJcyB0aGF0IG5lY2Vz
c2FyeSA/DQo+ID4gPg0KPiA+DQo+ID4gSSB0aGluayBpdCdzIGdvb2QgdG8gc2hvdyB3YXRjaGRv
ZyBpbml0aWFsIHRpbWVvdXQuIEknbGwgaW5jbHVkZSBhYm92ZQ0KPiBzdWdnZXN0aW9ucyBpbiB2
MywgdGhhbmtzIQ0KPiA+DQo+IA0KPiBObywgcGxlYXNlIGF2b2lkIGFkZGluZyBtb3JlIHN0cmlu
Z3MgaW4gdGhhdCBkcml2ZXIuDQo+IA0KDQpJIGdldCBpdCwgdGhhbmtzIGZvciByZXZpZXchDQoN
CkJlc3QgcmVnYXJkcywNCkpvaG5zb24NCj4gDQo+IC0tDQo+IEFsZXhhbmRyZSBCZWxsb25pLCBC
b290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6
Ly9ib290bGluLmNvbQ0K
