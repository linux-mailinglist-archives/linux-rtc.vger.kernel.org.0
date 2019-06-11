Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95C143C973
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2019 12:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388207AbfFKKzy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 11 Jun 2019 06:55:54 -0400
Received: from mail-eopbgr80047.outbound.protection.outlook.com ([40.107.8.47]:2436
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387835AbfFKKzy (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 11 Jun 2019 06:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+eLv1MqCodrnc9uw9MzCjeYFa4wUZdIN2eUccXBQLQ=;
 b=CvVZWzYxr/UqXC8MZD52q9t+MI3WhgP7Sk8CB/nGxlbfOy4JzMlqs2jGhaCPVpQ9lt9i07yJfXTQhHmUBNo0TvMBIcIsO1LHhxOr55u1WXEcMgKx7QCNPXRjJvR1q5NVF49yApMQ/AUjFk7T9zSe2z9K0T1jvYDyHcBtaiW8+QA=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB6625.eurprd04.prod.outlook.com (20.179.255.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 11 Jun 2019 10:55:49 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::11e1:3bb9:156b:a3e4]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::11e1:3bb9:156b:a3e4%3]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 10:55:49 +0000
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
Subject: RE: [PATCH 1/3] dt-bindings: fsl: scu: Update RTC compatible string
Thread-Topic: [PATCH 1/3] dt-bindings: fsl: scu: Update RTC compatible string
Thread-Index: AQHVIB9emd9i+B/IXEyVa1h4DVhJOaaWR97A
Date:   Tue, 11 Jun 2019 10:55:49 +0000
Message-ID: <AM0PR04MB421153DA043F88216155382D80ED0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190611063333.48501-1-Anson.Huang@nxp.com>
In-Reply-To: <20190611063333.48501-1-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2fefd1e-6239-4f36-2c02-08d6ee5b5d77
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB6625;
x-ms-traffictypediagnostic: AM0PR04MB6625:
x-microsoft-antispam-prvs: <AM0PR04MB662521BDE07032EAB10A210480ED0@AM0PR04MB6625.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(366004)(39860400002)(376002)(136003)(396003)(189003)(199004)(76116006)(71200400001)(6246003)(73956011)(81156014)(7736002)(66946007)(66066001)(486006)(316002)(26005)(68736007)(476003)(2501003)(110136005)(33656002)(44832011)(14454004)(53936002)(229853002)(74316002)(55016002)(186003)(81166006)(6436002)(15650500001)(8676002)(102836004)(2906002)(76176011)(6116002)(5660300002)(7696005)(2201001)(305945005)(66556008)(66446008)(66476007)(71190400001)(52536014)(25786009)(7416002)(14444005)(8936002)(3846002)(9686003)(11346002)(4326008)(64756008)(99286004)(86362001)(6506007)(558084003)(478600001)(256004)(446003)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6625;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YbzW/+84Tgdhrhz2McPjUbrqjVUkOHRraxrcflkoeKry6s5t0eZO+N4GSM9/ddKaWD9AY8OByFS51Wt98EF0OfQ1XAboA0upQ6KydFBrY9gzU6OWxxSmLgskhoAjeo8tcyg9lh9JRVtQMaspiSoHK/Xd+SW4lpVrxdoQMjNw8kB7Aat0OwRgsQSEOYslPypAN+f4RYCt44pIs9LfqfMzt8eEYdJSlQJSEG96meiL6+Ue5KgtgWlIzzSAEJNfopSrwocW+Sf4PY/i5Pa1/V+B/3rIWoqGM7nIDpLvbcwhUqdcm5hj9vC1GpdcHFKmxbb8JgyV0J+eXNTRDhM6VmrA+kRSb552z6zQbgAMbySyCcL2rzRvqU7hikbYc/6VfNSTJ38H+buXaSJ1I51FRRImhTWiS1AyLGlLK/8+5izSWkQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2fefd1e-6239-4f36-2c02-08d6ee5b5d77
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 10:55:49.6090
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

PiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gDQo+IFVwZGF0ZSBS
VEMgY29tcGF0aWJsZSBzdHJpbmcgdG8gbWFrZSBzeXN0ZW0gY29udHJvbGxlciBSVEMgZHJpdmVy
IG1vcmUNCj4gZ2VuZXJpYyBmb3IgYWxsIGkuTVggU29DcyB3aXRoIHN5c3RlbSBjb250cm9sbGVy
IGluc2lkZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0Bu
eHAuY29tPg0KDQpSZXZpZXdlZC1ieTogRG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNv
bT4NCg0KUmVnYXJkcw0KRG9uZyBBaXNoZW5nDQo=
