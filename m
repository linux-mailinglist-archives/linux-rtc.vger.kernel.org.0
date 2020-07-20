Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F91225CD7
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jul 2020 12:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbgGTKoq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 20 Jul 2020 06:44:46 -0400
Received: from mail-eopbgr1320074.outbound.protection.outlook.com ([40.107.132.74]:28134
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728001AbgGTKop (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 20 Jul 2020 06:44:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bINMlU41NLzo97BxK0NlCT3bvMbZIEI9yahxc1h69aTNijJo4FtypHpbWAWezlZM6PhKbbtHnAlzFkF3g1DG+yXpTqvWTTw7rFE0lERRjwn21S5hemIK49iULH7VOBXphumVVN9kpUgYrWSXplbwH1Th1vCs4r+IThNXk8o6wEeduRhDiO2LIWWpmL/2u5+7O3VOvwATRpJykcYx14Yux9RX0nnN9dSEV5egoqXAYkCMvy5PmNt1I/oC3//YJ9RFRqVmPuaBC15sDmrOff2kIZM7b46JUxhYbM+BEuZtdJCco2uBe5mQncnMakCcZmzWa/MvnhCUwW6Ve9nhkXplhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRUWZqokLyKscv67QChhkajfrjE6DlQtCkgYAlOh2lg=;
 b=D5G6866ceg1wRre45uBcVJNA4oMnAiVXYLHcn2tVZeMnQy7yuEU5ci/s9pmb6/wCT428eGaYIVdKkGy0afvPu9uRYl0vkx/G/cAU7NNRP0Wsb0mDJtq3JnNvzZfTRK8YvEuBzSMIPy92bU3/jdGRSiyQsxYlTh/yMQWdLwjpYUo0+iRNM+uNtLRzjdUL4/yApYwkClu3qRu3EuxPuwE73sqeh8/6V8nC/YogAr0RfJo9d6B65WWnUhv3yhp/GNHhyHKtaP3GBa0acF4sS3QgLTWxAMwfc5j+7aiK6EJ3SxNgMiK0peYENCb1YbSJjmRLxnyoT9r62mIj/MgWydrWKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRUWZqokLyKscv67QChhkajfrjE6DlQtCkgYAlOh2lg=;
 b=icjgXRpPdn39zTadZ2vpy8JiPo3Cpz0SyjguMjmbnoFrneAaV/uEEWwaFQjDwYnfR6jsQ5OEkD3qlA3YnDYtBIF9WaPWeKgf3vBWRPgTCvocPZL5GF7cnZuJjspnobTrfNvE1pYvBtuyvdAE542cCATfVxl1texh06jZik9bevk=
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 (2603:1096:202:22::12) by HK0PR01MB2771.apcprd01.prod.exchangelabs.com
 (2603:1096:203:9b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.24; Mon, 20 Jul
 2020 10:44:41 +0000
Received: from HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::dce:9650:6c58:8b77]) by HK2PR01MB3281.apcprd01.prod.exchangelabs.com
 ([fe80::dce:9650:6c58:8b77%4]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 10:44:41 +0000
From:   =?utf-8?B?Sm9obnNvbiBDSCBDaGVuICjpmbPmmK3li7Mp?= 
        <JohnsonCH.Chen@moxa.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: RE: [PATCH v5] rtc: rtc-ds1374: wdt: Use watchdog core for watchdog
 part
Thread-Topic: [PATCH v5] rtc: rtc-ds1374: wdt: Use watchdog core for watchdog
 part
Thread-Index: AQHWXnkat6/TbeWp0Uerbrrj6duJcakQQ4OAgAABYPA=
Date:   Mon, 20 Jul 2020 10:44:41 +0000
Message-ID: <HK2PR01MB3281AE06720A1C7013603B07FA7B0@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
References: <HK2PR01MB32811CE9FE5DB463A69E94C8FA7B0@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
 <20200720102629.GE3428@piout.net>
In-Reply-To: <20200720102629.GE3428@piout.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=moxa.com;
x-originating-ip: [123.51.145.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84928569-331d-41ab-92d1-08d82c99e841
x-ms-traffictypediagnostic: HK0PR01MB2771:
x-microsoft-antispam-prvs: <HK0PR01MB27710A5AB853353F7BECFB19FA7B0@HK0PR01MB2771.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: capvl2KOvEZo2+YVOxWJPHTMG9O6xZwVT6+85biLPqefPCRxlFPVNQCn0ouOrIR2KY6bFM/OqOFZqUqAB5PQaEKy4H2UPoJXiTw1pa/9TVK2B9UfvRf69U2WGj9pFs/J1uNwOaf//ZFt0zS0tsILoBKR1sjvnAUgH5L1Nh8onoC0xxy5CVAgAtoV1MroTqoaym/pu2DvvFnV2lPja3nEMASdqXjY04KhaLWBSmcTbbi5j4y9qnBmu8BxXLeNoYxGxPEGjx4sSVH+KXcBWs2V9r98mfMCOytMN9ifWMwVI0BJ3IAzPf+fL/n/AysAdVwAPxTBkly43wUXxc6QmKuBDT1KbiqndWejUToWxDPhgwPgE68jUq5WQQo1zHqHr1X4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR01MB3281.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39850400004)(4744005)(2906002)(6506007)(54906003)(66476007)(478600001)(4326008)(8936002)(316002)(9686003)(8676002)(66946007)(186003)(64756008)(33656002)(85182001)(6916009)(76116006)(5660300002)(26005)(55016002)(7696005)(52536014)(66556008)(71200400001)(66446008)(86362001)(171213001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: q9sRE2Wm32s0B0DaUvlmEJodb3cuyrjhAbGcOXwzlljU3PcFJunY4bMGpSVkoFfFcEduDdrP/ePXL+gsd+2Di4Wle7Xr4LrMmhxFjTHpV3QOQCOWOoJ2gwqBrhPD/t2XAT0BpHHuTwE5uZuQdaO4a7qmJafER65H2k3dA61S7O26TZIvd24qE2pS8GqsspBQVptQ1CQK6IddvqQ8ilzRG6oIukNRwD/X8S832UkjEaeTj+Us2ebDPOaXeQiI//mnrdwBFrho5PLORAWYAjKCL7s9Edze68Q7s0pjVq5wEXk9R2FxyPJNoNz5HndFrDDJ1Y8XCmJZY4fimGIs+oQMXnj2RyRKtSYh/6I1IFB6oAe4qYgVyw9nQeJRlQGEDbFytaOamp6po7UhA5bRKD7dmHCsJI8iaB5obvuL52BZ+2oBv9hBrl1hdjwJWLSsRX5N5MODxLnJGz9WII1AFSVIVLP0grQmeTCedMS1CM6A2rY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR01MB3281.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84928569-331d-41ab-92d1-08d82c99e841
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2020 10:44:41.0425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k7G1b4vXX4qtOhZGM0QSaLP5tnt0WVHbcCcRHKuIto2d+UCt+6Tlhly4PNrUrV5j7whlT9ppaeDuw73MgdU0+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR01MB2771
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgQWxleGFuZHJlLA0KDQo+ID4gdjQtPnY1Og0KPiA+IC0gRml4IHJlcG9ydGVkIGJ1aWxkIGVy
cm9yIGJ5IHJlcGxhY2luZyBSVENfRFJWX0RTMTM3NF9XRFQgd2l0aA0KPiA+IFdBVENIRE9HX0NP
UkUNCj4gPg0KPiANCj4gVGhpcyBpcyBub3QgdGhlIGNvcnJlY3Qgc29sdXRpb24gYXMgdGhpcyB3
aWxsIHJlbW92ZSB0aGUgYWxhcm0gZnVuY3Rpb25hbGl0eSBmb3INCj4gYW55b25lIGVuYWJsaW5n
IFdBVENIRE9HLiBJIGFscmVhZHkgc3VibWl0dGVkIGEgcHJvcGVyIGZpeC4NCj4gDQoNCkl0J3Mg
YW4gYXBwcm9wcmlhdGUgYW5kIGJldHRlciBzb2x1dGlvbi4gVGhhbmtzIQ0KDQpSVENfRFJWX0RT
MTM3NF9XRFQgc3RpbGwgc2hvdWxkIHNlbGVjdCBXQVRDSERPR19DT1JFIHRvIGF2b2lkIGJ1aWxk
IGVycm9yIGlmIFdBVENIRE9HX0NPUkUgaXMgc2V0IHRvICJtIiwgYW5kIGl0IHNob3VsZCBiZSBk
ZXBlbmRlZCBvbiBSVENfRFJWX0RTMTM3NCBhbmQgV0FUQ0hET0cuDQoNCj4gPiB2My0+djQ6DQo+
ID4gLSBGaXggY29kaW5nIHN0eWxlcw0KPiA+IC0gUmVtb3ZlIGRldl9pbmZvKCkgaW4gZHMxMzc0
X3dkdF9zZXR0aW1lb3V0KCkNCj4gPiAtIEZpeCBtaXNzaW5nIGVycm9yIGNoZWNrDQo+ID4NCj4g
DQo+IC0tDQoNCkJlc3QgcmVnYXJkcywNCkpvaG5zb24NCg==
