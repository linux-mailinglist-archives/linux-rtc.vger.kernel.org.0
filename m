Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32C913C98A
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2019 12:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbfFKK6E (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 11 Jun 2019 06:58:04 -0400
Received: from mail-eopbgr80070.outbound.protection.outlook.com ([40.107.8.70]:46080
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727278AbfFKK6E (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 11 Jun 2019 06:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSDTy66G3v9zXZ6MIH4p2ote4fKdEljdOE+bpd94pZY=;
 b=df5CtJzIl7QExnky3ueRbPONOlLxlEe61GxfqwNjOdKJYFm48zUHTfyA6THUQglqoplCrqbz2vRxlnSeql3vk784JkXE/qVgzeXAor1nRXEmwM6QNHLfoppFW36wpKIqnWWwJbXtsZVw+Qd8CnGXj9OGN90JKPydamAwgYOr8Cg=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB6625.eurprd04.prod.outlook.com (20.179.255.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 11 Jun 2019 10:57:59 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::11e1:3bb9:156b:a3e4]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::11e1:3bb9:156b:a3e4%3]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 10:57:59 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        Peng Fan <peng.fan@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 3/3] arm64: dts: imx8qxp: Add fallback compatible string
 for RTC node
Thread-Topic: [PATCH 3/3] arm64: dts: imx8qxp: Add fallback compatible string
 for RTC node
Thread-Index: AQHVIB9gtY/LBADX+EeGM2wZ4BhEnaaWSKzw
Date:   Tue, 11 Jun 2019 10:57:59 +0000
Message-ID: <AM0PR04MB4211187F459859CB3F483C7D80ED0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190611063333.48501-1-Anson.Huang@nxp.com>
 <20190611063333.48501-3-Anson.Huang@nxp.com>
In-Reply-To: <20190611063333.48501-3-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9013890-5f7d-4e04-4ffd-08d6ee5bab14
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB6625;
x-ms-traffictypediagnostic: AM0PR04MB6625:
x-microsoft-antispam-prvs: <AM0PR04MB6625EEBB541EBA24638B3A1480ED0@AM0PR04MB6625.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(366004)(39860400002)(376002)(136003)(396003)(189003)(199004)(76116006)(71200400001)(6246003)(73956011)(81156014)(7736002)(66946007)(66066001)(486006)(316002)(26005)(68736007)(476003)(2501003)(110136005)(33656002)(44832011)(14454004)(53936002)(229853002)(74316002)(55016002)(186003)(81166006)(6436002)(8676002)(102836004)(2906002)(76176011)(6116002)(5660300002)(7696005)(2201001)(305945005)(66556008)(66446008)(66476007)(71190400001)(52536014)(25786009)(7416002)(8936002)(4744005)(3846002)(9686003)(11346002)(4326008)(64756008)(99286004)(86362001)(6506007)(478600001)(256004)(446003)(921003)(32563001)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6625;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mIVrt8s9zWRsUJJdDiDCFFczh0Wn1Wtjno3muFwnuFEYKzb0esT4DloAuOYFpw3u0RFY+2FJuCCp2VHPoGURuukI76R/KNpeD0GRNNF0nzOFW+CAqc5bFkxk56dvpbvCgD+o20+ec1XkfI9YOa0PHWQbdayBcrlcLmz16ngSbzz2DmpNSbWueF2+3NYDArZtjoCScEeF+40X+OqEq4a7Oi8/3vYbZtR5UF9Y/lX4cqaNeTyaWKDFf7D6WxhItQ1acd6Wl667oHjwn5ff5J7BOvhTjKcBemw4TLlHZNk/f2Pb0jsPgREqT+o1HBUax4Jb0DECfAbAS11H4sCeHvtyzs4/qwpDztBLX3NC6uoRhBUW6HjLoZ8/wKyaSnhGRFeyoD6OrKC8I6y74oEphQzaLGzipLZT1hEXhitA6rGA4AA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9013890-5f7d-4e04-4ffd-08d6ee5bab14
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 10:57:59.8154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisheng.dong@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6625
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiBGcm9tOiBBbnNvbi5IdWFuZ0BueHAuY29tIFttYWlsdG86QW5zb24uSHVhbmdAbnhwLmNvbV0N
Cj4gU2VudDogVHVlc2RheSwgSnVuZSAxMSwgMjAxOSAyOjM0IFBNDQo+IA0KPiBUaGUgaS5NWCBz
eXN0ZW0gY29udHJvbGxlciBSVEMgZHJpdmVyIHVzZXMgZ2VuZXJpYyBjb21wYXRpYmxlIHN0cmlu
ZyB0bw0KPiBzdXBwb3J0IGFsbCBpLk1YIFNvQ3Mgd2l0aCBzeXN0ZW0gY29udHJvbGxlciBpbnNp
ZGUsIHRoaXMgcGF0Y2ggYWRkcyB0aGUgZ2VuZXJpYw0KPiBzeXN0ZW0gY29udHJvbGxlciBSVEMg
Y29tcGF0aWJsZSBzdHJpbmcgYXMgZmFsbGJhY2sgY29tcGF0aWJsZSBzdHJpbmcNCj4gYWNjb3Jk
aW5nbHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhw
LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+
DQoNClJlZ2FyZHMNCkRvbmcgQWlzaGVuZw0K
