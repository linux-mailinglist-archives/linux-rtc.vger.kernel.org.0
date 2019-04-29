Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD09EE0A1
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Apr 2019 12:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727630AbfD2Kht (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 29 Apr 2019 06:37:49 -0400
Received: from mail-eopbgr130089.outbound.protection.outlook.com ([40.107.13.89]:28341
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727621AbfD2Khs (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 29 Apr 2019 06:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n29GjD+lJxjPv4oNzL6Txq+WQX6U9smqgB4ZUfVUbbA=;
 b=vrxxYzPi7D3gthPQFLi4ivTRWHAxNv3sksaj9uZk3BVydaxuI2YILo3kY4QIdE6Q8gnob/Q6lMUwo/Cu5mGzOFvRz8aetnqiU8M59bLb11nEpEYNt16s/PYp9iQPKlkdXfI2U2QdbdK+fH8MOH2yhU44Q1MueWVdSo2cWL/x2XQ=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB4066.eurprd04.prod.outlook.com (52.134.92.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Mon, 29 Apr 2019 10:37:44 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cda:4e52:8e87:8f0e]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cda:4e52:8e87:8f0e%2]) with mapi id 15.20.1835.018; Mon, 29 Apr 2019
 10:37:44 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Anson Huang <anson.huang@nxp.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] rtc: snvs: Use __maybe_unused instead of #if
 CONFIG_PM_SLEEP
Thread-Topic: [PATCH] rtc: snvs: Use __maybe_unused instead of #if
 CONFIG_PM_SLEEP
Thread-Index: AQHU/lmEml9HNTGs9Ea7jhPERyCyyKZS8kxA
Date:   Mon, 29 Apr 2019 10:37:44 +0000
Message-ID: <AM0PR04MB42116B2223E1AA8AAE2CF00080390@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1556521071-8981-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1556521071-8981-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 688540d2-f1a6-44c4-4843-08d6cc8eb71b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4066;
x-ms-traffictypediagnostic: AM0PR04MB4066:
x-microsoft-antispam-prvs: <AM0PR04MB4066FED039618470CE28E7D280390@AM0PR04MB4066.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(366004)(346002)(376002)(39860400002)(136003)(189003)(199004)(97736004)(9686003)(305945005)(52536014)(76116006)(66476007)(66556008)(64756008)(66446008)(73956011)(55016002)(66946007)(6436002)(25786009)(7696005)(86362001)(110136005)(2201001)(99286004)(6506007)(102836004)(76176011)(4326008)(6246003)(316002)(33656002)(6116002)(3846002)(7736002)(68736007)(81156014)(8676002)(8936002)(53936002)(74316002)(81166006)(558084003)(2501003)(478600001)(2906002)(229853002)(256004)(5660300002)(44832011)(486006)(446003)(11346002)(476003)(14454004)(71200400001)(71190400001)(66066001)(26005)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4066;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GwaDsfAVcLUVvZ3p6DvQ1fYXTeSF4YUkigCMsXTuKN9p1UQrsL1fpAEPaWRnXQirF2FoaWRBqVaLOVEbzmYh2pOO/QrzSiipqfaLgnotfqIkN/U0irOadkbhitT+NkfNnHZMDgj+GDEnBqzzFEHHUU1vJRpzgmGNTDhvrYxuRpdT6h0LMJ1BqOxtUIUYdGkL5O1Kdf4UpKsojVRTQ9m31fXTW/r9AYe/S8s4uEuTh4+dnskpI908e1LiOdTXCGjLJhp/7w3nsTTgw1MwnsuiOLfx1stO+Ehz10zbiPGORxNkuftyeeWUmIWtj8A1w5ekGbG37Ymlsjxhch2lmDI9w6/p4+jhYHbJJK0U9CkmCU1uWCRFV2GEtJWn8f8IBLezIdMU914KaGR8Pf7zyp3WsyqGfoc/mmSrAxz+N7cFjHM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 688540d2-f1a6-44c4-4843-08d6cc8eb71b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 10:37:44.7583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4066
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

PiBGcm9tOiBBbnNvbiBIdWFuZw0KPiBTZW50OiBNb25kYXksIEFwcmlsIDI5LCAyMDE5IDM6MDMg
UE0NCj4gDQo+IFVzZSBfX21heWJlX3VudXNlZCBmb3IgcG93ZXIgbWFuYWdlbWVudCByZWxhdGVk
IGZ1bmN0aW9ucyBpbnN0ZWFkIG9mICNpZg0KPiBDT05GSUdfUE1fU0xFRVAgdG8gc2ltcGx5IHRo
ZSBjb2RlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54
cC5jb20+DQoNClJldmlld2VkLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29t
Pg0KDQpSZWdhcmRzDQpEb25nIEFpc2hlbmcNCg==
