Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8A3018ED84
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Mar 2020 01:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgCWAyA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 22 Mar 2020 20:54:00 -0400
Received: from mail-eopbgr10054.outbound.protection.outlook.com ([40.107.1.54]:61590
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726944AbgCWAx7 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 22 Mar 2020 20:53:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XM+PI0ns+onMxaiysl/ekhsD0Zh/6lfOZjpft/vN1ltrVh0FWfPHTrVtrZWbhjR0WVZGEVY5fYyzWFclRgFnzcR4uuvjuiMU1gQUZ6jf0+vqucSqMpDDxO6IOttESvRWzsdttf2JCMTSV8sC7a/Pbex2zHHCjGAl33kc5ye7UrM4GY4mD7fK+MuXRlN21aeKpK8cIBatgTou7S4zOYP1uCCTibwQbztVj/gZPnH8r+0inuS10J0FYk9aM+gPmdxwJoUeYWzPiIh0poqF6smB7xtb8i/uNLLBPIz5NDKbybbRjtCfWoBNp5ff+CJSW4sJrD/XGy1lphu/53gdyVL+Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KkK+EmkBoC7F8OE7qiRiaa17cpY6i4iNhkFnq31aCs=;
 b=HAnZYbOsAglaYXyO8JF0jJaTNQneeWAn52aiRiuxLoL2IKub0GPtkIkTbznGGXgUsoGdDQgm4R363qmAU12nShbfumCpN1EqxdIp0lYPCBh8neBPAz8wtDSwW7oY+OyAdjT4z98RGrDDCncxgsHjCTJPgZ3kKBiLjHWuAcInsm55bUIEh5H7l75Q6P3htVy2jsn5G9tutzzcsIn/MpD/uD7bM57EN0Lgta5BNjXcLyzfxePnrfPpIKzm/BVCkKeRICKf+GZTLxDOE78u4Pp5eFLn+iAV3UzeMvG8CL8joLX7w2SPZfKJ+/c+egV5VPeTpf3PfQdpmEzFW+Dn+6QZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KkK+EmkBoC7F8OE7qiRiaa17cpY6i4iNhkFnq31aCs=;
 b=HAHbS1QKOu4uY0YLTE+kXx/mlp1TXpA5yPTabhPn98vQGuebiSFuYeJdpuXT328SS2EKBZjzxl01nwaVGTvziltE78QH+id+xFf6TK9WuuJuGoZSR/1fAMFvfiKzDQTGICOEU+tM66M/UnIDEL6CM0YY/NvZtP1av0+aHZx/Ndc=
Received: from AM7PR04MB7016.eurprd04.prod.outlook.com (52.135.58.214) by
 AM7PR04MB6853.eurprd04.prod.outlook.com (10.141.172.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Mon, 23 Mar 2020 00:53:55 +0000
Received: from AM7PR04MB7016.eurprd04.prod.outlook.com
 ([fe80::14c2:8800:1248:ddfa]) by AM7PR04MB7016.eurprd04.prod.outlook.com
 ([fe80::14c2:8800:1248:ddfa%7]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 00:53:54 +0000
From:   Peng Ma <peng.ma@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Leo Li <leoyang.li@nxp.com>, Ran Wang <ran.wang_1@nxp.com>,
        Biwen Li <biwen.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] rtc: fsl-ftm-alarm: enable acpi support
Thread-Topic: [EXT] Re: [PATCH] rtc: fsl-ftm-alarm: enable acpi support
Thread-Index: AQHV/NDy5KYOzFGsuk+oAQT4bUQ7CKhVI5eAgAA9WTA=
Date:   Mon, 23 Mar 2020 00:53:54 +0000
Message-ID: <AM7PR04MB7016DC4509F3493856641EB1EDF00@AM7PR04MB7016.eurprd04.prod.outlook.com>
References: <20200318025354.6447-1-peng.ma@nxp.com>
 <20200322211237.GD221863@piout.net>
In-Reply-To: <20200322211237.GD221863@piout.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.ma@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1d316825-9362-4596-b0ca-08d7cec4a985
x-ms-traffictypediagnostic: AM7PR04MB6853:|AM7PR04MB6853:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB6853C951680DF515A101DCB1EDF00@AM7PR04MB6853.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(199004)(6506007)(55016002)(4744005)(186003)(8936002)(71200400001)(478600001)(33656002)(4326008)(86362001)(6916009)(45080400002)(54906003)(9686003)(316002)(7696005)(44832011)(5660300002)(26005)(52536014)(64756008)(66476007)(81156014)(2906002)(81166006)(66446008)(8676002)(76116006)(66556008)(66946007);DIR:OUT;SFP:1101;SCL:1;SRVR:AM7PR04MB6853;H:AM7PR04MB7016.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +KaFDmOV6MIEImUEv5hzRGfTqUFRUZUiKGNMSd3EHl6imMC0e1M/thBvCV7UM+bLuZhYrviD7YsjfPsFNQf9tqvnDRjW5NRStuTQIv7nJipfO2bsqubldiA8qKw/ly1c1x6Ezy7KpMN5mh7iTYEvVuEqqh1XBawNWDTLDRwMFfFdQWNoaJcWRsFKtPXCmXWKcUM3NL9WOdIbDLDV4olEa+pDpZkj49qfv5WCOuHfMa9MiXK8S3NYDNqcxrtP58+UPtqkYjt/WpKX6tEjdXaZw+Du4hiFNVA5raX4MIE7/L7/Fwi8lD4M2Th41jlh4KedXIY8vaLDqFwqYJEyg0BsKbQ2MvCtfqnVb/POdmyngxqjSZTJdjikAXAPMmEq4jiXI5zXiM3eZhRKDwqgA7ny2zXZ5obpcEd0xAbwkLcB84hWDqoiTXQfJSRNabAQYhXOiReqA4BwJIvaGMKsnzp5bpwg2EJmMYD5hqSdQjGX5/8=
x-ms-exchange-antispam-messagedata: Ri5ErkEhawyAQY8e8cgXuv3zkEI7/NBoziIUWKaQr+8MG7WEnpWSB4ldbLyMh70lJr+SJ1KfukaVi1I2/4/VjlxbHpx2Ih5sXYf25M6xLwK5NHLUmxisJljx+eOSMcY6XVl4R/H4Snr6LlL+TcKIJA==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d316825-9362-4596-b0ca-08d7cec4a985
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 00:53:54.7684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: afJvYy1UghC0sdoUMIq6waju8o3Neg4Aa1TwUVA806VIWKGBOd2LpJLh33a46DPL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6853
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgQWxleGFuZHJlLA0KDQpPSywgR290IGl0Lg0KVGhhbmtzIHZlcnkgbXVjaC4NCg0KQmVzdCBS
ZWdhcmRzLA0KUGVuZw0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQWxleGFu
ZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPg0KPlNlbnQ6IDIwMjDE
6jPUwjIzyNUgNToxMw0KPlRvOiBQZW5nIE1hIDxwZW5nLm1hQG54cC5jb20+DQo+Q2M6IGEuenVt
bW9AdG93ZXJ0ZWNoLml0OyBsaW51eC1ydGNAdmdlci5rZXJuZWwub3JnOw0KPmxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPjsgUmFuIFdhbmcN
Cj48cmFuLndhbmdfMUBueHAuY29tPjsgQml3ZW4gTGkgPGJpd2VuLmxpQG54cC5jb20+DQo+U3Vi
amVjdDogW0VYVF0gUmU6IFtQQVRDSF0gcnRjOiBmc2wtZnRtLWFsYXJtOiBlbmFibGUgYWNwaSBz
dXBwb3J0DQo+DQo+Q2F1dGlvbjogRVhUIEVtYWlsDQo+DQo+T24gMTgvMDMvMjAyMCAxMDo1Mzo1
NCswODAwLCBQZW5nIE1hIHdyb3RlOg0KPj4gVGhpcyBwYXRjaCBlbmFibGVzIEFDUEkgc3VwcG9y
dCBpbiBSdGMgRmxleCB0aW1lciBkcml2ZXIuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogUGVuZyBN
YSA8cGVuZy5tYUBueHAuY29tPg0KPj4gLS0tDQo+PiAgZHJpdmVycy9ydGMvcnRjLWZzbC1mdG0t
YWxhcm0uYyB8IDIwICsrKysrKysrKysrKysrKy0tLS0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDE1
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+Pg0KPkFwcGxpZWQsIHRoYW5rcy4NCj4N
Cj4tLQ0KPkFsZXhhbmRyZSBCZWxsb25pLCBCb290bGluDQo+RW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZw0KPmh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0
bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmJvb3RsaW4uYw0KPm9tJmFtcDtkYXRhPTAyJTdD
MDElN0NwZW5nLm1hJTQwbnhwLmNvbSU3Q2RlODYyZjg1NTZlNTQ0MGM5ZGNmMA0KPjhkN2NlYTVj
MGIzJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNzIwNTAN
Cj44MzYwNDYwOTE1NiZhbXA7c2RhdGE9Y04lMkJWY2dkMUdaY3FLdDNReDdUNnYzJTJGcSUyRndQ
WElaUHlVRHg5DQo+dnRvWWR0SSUzRCZhbXA7cmVzZXJ2ZWQ9MA0K
