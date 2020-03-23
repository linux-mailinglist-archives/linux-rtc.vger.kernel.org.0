Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACA9D18F183
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Mar 2020 10:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbgCWJP2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Mar 2020 05:15:28 -0400
Received: from mail-am6eur05on2066.outbound.protection.outlook.com ([40.107.22.66]:25408
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727649AbgCWJP2 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 23 Mar 2020 05:15:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhTWy8mFNf29mB8dKHpB/rUU+Uf0qBQlJ965S8ZL2i+ygfFb3RDojq3VYpps/2rSnE+t0Pkum6V1eG9GWUfl0ekckCaVZhwukX5iOJHTyDR3Q/4gdQE9d+tw6gm505UyRMKxWRDj2hWUl1eYxyw5dkqKyBpDqXv247i8T+0fVCjlg/OL/s0d2S163/WDj0UC2J2PEdKCvKQc3QPaCUF04MUDVhbh8iCi2cRiV+PO6cGpYSr+UHrB0GBJRqpz3wqQwFa4g3mgelJK2G/ElrY4bQfmg0LW2fZivatguUlPKSBXvuNs3GY8FRZzJupMZouQvf2DxmZ0cqoD/sBcx7t0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSpXxidqzAdYesDNscOl77TaHPr3n5leSVXHUNPZjTY=;
 b=j5Zr4hBKHbRjd0MHwDkY8wbgSq2oEHwgFA8KNM2mcsISfWiagqDiSHNIkkLtxVSiK7LeoDa1vUefQ02aSXLZxxs815LJagfgE0h5yxpZDLjQ5Az3S/Q7LZw7HuoRGq6GVVsB25+nbVMvhGdtF4C8CrPYueSVc8C7SLEI6Yv7o9iL31QqrRdOKRXGFwn2WlQhydbEGJtmWHeWYCm/UZ/L7dchd6avD4d4BOTIHpmizd5zE8F9ZGlzC6vfxFnIsKmnhFbNrAKt8aUZcMZbsp7/Ep0RjvN4TQbG/xtvuRupmLilIsTr+82biRrC/nuuopBoLehg4/QLhO7trvbLPp6JEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSpXxidqzAdYesDNscOl77TaHPr3n5leSVXHUNPZjTY=;
 b=iyM+LVuoQOfiA2h3Oo+9KT3IiAZ3NCOY5FLdxlV7jC3TdsAEOYRdRbj46o4L8/KTnfmOYBVmjllaHbQ/a8sDFB9KXlWX7QMNcZPE/s8haxJpEEl4G4TDhpq9wSrJLYgYHMRfr9s0gW3DBSj0eFGZ6ddyVDnhapgrdWme1g3Omtg=
Received: from AM7PR04MB7016.eurprd04.prod.outlook.com (52.135.58.214) by
 AM7PR04MB6789.eurprd04.prod.outlook.com (10.141.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Mon, 23 Mar 2020 09:15:25 +0000
Received: from AM7PR04MB7016.eurprd04.prod.outlook.com
 ([fe80::14c2:8800:1248:ddfa]) by AM7PR04MB7016.eurprd04.prod.outlook.com
 ([fe80::14c2:8800:1248:ddfa%7]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 09:15:25 +0000
From:   Peng Ma <peng.ma@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Leo Li <leoyang.li@nxp.com>, Ran Wang <ran.wang_1@nxp.com>,
        Biwen Li <biwen.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] rtc: fsl-ftm-alarm: remove the useless variable
Thread-Topic: [EXT] Re: [PATCH] rtc: fsl-ftm-alarm: remove the useless
 variable
Thread-Index: AQHWAOVaqBIFeDwPLUy8avVVi9Jim6hV2GGAgAAMxRA=
Date:   Mon, 23 Mar 2020 09:15:25 +0000
Message-ID: <AM7PR04MB701693A061EF3DF80ABFA322EDF00@AM7PR04MB7016.eurprd04.prod.outlook.com>
References: <20200323072956.38263-1-peng.ma@nxp.com>
 <20200323082853.GW5504@piout.net>
In-Reply-To: <20200323082853.GW5504@piout.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.ma@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8b05302f-19e8-42c7-d61f-08d7cf0ab8b1
x-ms-traffictypediagnostic: AM7PR04MB6789:|AM7PR04MB6789:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB6789021BF071FD67249D4CB7EDF00@AM7PR04MB6789.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:117;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(199004)(66476007)(66556008)(64756008)(66946007)(6506007)(76116006)(86362001)(8676002)(8936002)(81166006)(81156014)(2906002)(66446008)(6916009)(55016002)(4326008)(33656002)(54906003)(9686003)(52536014)(7696005)(316002)(45080400002)(186003)(71200400001)(26005)(44832011)(478600001)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM7PR04MB6789;H:AM7PR04MB7016.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oLtgykPLkTP1Vlt73foareqrJizZzEVVS5q8K0m/IGsh8nv2jO2lQYB2Z0tjk1DXsUM8ycH59f6hyx/zqZtJqqwdCpYQTBXnacs/VylmI9VPOaUMVNGte/bZNinndA3sUV4FUoZzst4CZxdE/H/0O3IJsTS3Fo/W8y4+UrHNiafN9rxI97fN/k4WWzrK6DmY7fbfmD5RX2tudRIIGqNB4Hk9NK09u5p2U8AA2kyWKrHZf0WaD6tJ2zgTuXiWKDdM0Mq9rbvL0VldnsrHlii/p1xteuQk8v8A1vDy6Q8DAQGwTUq4UmB42alQiB9ns7/qHfwUz3dpYBqmK85CQzfV0xDx6cw+/tCklpq1AcfFdcmo/hv4ZL34FDqcUbEYoi8bT8qCvtxirY4YjkTFgTZuWCjH8k54WU0ZeiIl2N1UmsXHa+ygKeSqcfKRwbh1lRTnRIaAH/GIxAduJSvjPLdBWPaQOmT9HpH4qrAcRzTWAR8=
x-ms-exchange-antispam-messagedata: 3b/gXmS82pY5taJ89GtuYss8aB/EtWXD7zTVBMe27sZPPi6DsDpe+TE5nV6om5u3ZFzNmWypDE7d+OyQql8tgDmgkhveSHyAegnAWdC/+p0laBabAV+IsCHtxqqE61kgXLCGicHufs0HzzwOEUjXow==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b05302f-19e8-42c7-d61f-08d7cf0ab8b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 09:15:25.0832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hpbNihrgk/bIvhzFg0k4jtNwYR7OrqiECnTBzoYVy7tBkoeweyX32WTkEgu8qXi+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6789
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEFsZXhhbmRyZSBCZWxsb25p
IDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4NCj5TZW50OiAyMDIwxOoz1MIyM8jVIDE2
OjI5DQo+VG86IFBlbmcgTWEgPHBlbmcubWFAbnhwLmNvbT4NCj5DYzogYS56dW1tb0B0b3dlcnRl
Y2guaXQ7IGxpbnV4LXJ0Y0B2Z2VyLmtlcm5lbC5vcmc7DQo+bGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsgTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBSYW4gV2FuZw0KPjxyYW4ud2Fu
Z18xQG54cC5jb20+OyBCaXdlbiBMaSA8Yml3ZW4ubGlAbnhwLmNvbT4NCj5TdWJqZWN0OiBbRVhU
XSBSZTogW1BBVENIXSBydGM6IGZzbC1mdG0tYWxhcm06IHJlbW92ZSB0aGUgdXNlbGVzcyB2YXJp
YWJsZQ0KPg0KPkNhdXRpb246IEVYVCBFbWFpbA0KPg0KPk9uIDIzLzAzLzIwMjAgMTU6Mjk6NTYr
MDgwMCwgUGVuZyBNYSB3cm90ZToNCj4+IFJlbW92ZSB0aGUgdXNlbGVzcyB2YXJpYWJsZSB0byBm
aXhlZCB0aGUgYmVsb3cgYnVpbGQgd2FybmluZzoNCj4+IGRyaXZlcnMvcnRjL3J0Yy1mc2wtZnRt
LWFsYXJtLmM6IEluIGZ1bmN0aW9uICdmdG1fcnRjX3Byb2JlJzoNCj4+IGRyaXZlcnMvcnRjL3J0
Yy1mc2wtZnRtLWFsYXJtLmM6MjQ2OjIyOiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUgJ25wJw0K
PlstV3VudXNlZC12YXJpYWJsZV0NCj4+ICAgc3RydWN0IGRldmljZV9ub2RlICpucCA9IHBkZXYt
PmRldi5vZl9ub2RlOw0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFBlbmcgTWEgPHBlbmcubWFAbnhw
LmNvbT4NCj4+IC0tLQ0KPj4gIGRyaXZlcnMvcnRjL3J0Yy1mc2wtZnRtLWFsYXJtLmMgfCAxIC0N
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPj4NCj4NCj5JIHNxdWFzaGVkIGl0
IGluIHRoZSBvZmZlbmRpbmcgY29tbWl0Lg0KW1BlbmcgTWFdIE9Lo6xHb3QgaXQsIHRoYW5rcw0K
DQpCZXN0IFJlZ2FyZHMsDQpQZW5nDQo+LS0NCj5BbGV4YW5kcmUgQmVsbG9uaSwgQm9vdGxpbg0K
PkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj5odHRwczovL2V1cjAxLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZib290bGlu
LmMNCj5vbSZhbXA7ZGF0YT0wMiU3QzAxJTdDcGVuZy5tYSU0MG54cC5jb20lN0NkM2Q2MGQ5YzI2
NTI0ODA1YjM1Mg0KPjA4ZDdjZjA0Mzk5OSU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAx
NjM1JTdDMCU3QzAlN0M2MzcyMDU0DQo+ODkzNzI3MzYzNDYmYW1wO3NkYXRhPXdiNGJCY1A4ZE1i
cmlBZFpGblNnbDQ0Sm9rWjBBSzZNc0dhN3o2Q1dHbGcNCj4lM0QmYW1wO3Jlc2VydmVkPTANCg==
