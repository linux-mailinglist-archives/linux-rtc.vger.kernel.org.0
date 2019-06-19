Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7F14BA80
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Jun 2019 15:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbfFSNvU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 19 Jun 2019 09:51:20 -0400
Received: from esa2.tennantco.iphmx.com ([68.232.153.189]:3122 "EHLO
        esa2.tennantco.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfFSNvT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 19 Jun 2019 09:51:19 -0400
X-Greylist: delayed 502 seconds by postgrey-1.27 at vger.kernel.org; Wed, 19 Jun 2019 09:51:18 EDT
IronPort-PHdr: =?us-ascii?q?9a23=3AFpKmTRO9HNzkHJ2uuY4l6mtUPXoX/o7sNwtQ0K?=
 =?us-ascii?q?IMzox0K/39psbcNUDSrc9gkEXOFd2Cra4d0ayO6eu7CCRAuc/H7ClbNsQUFl?=
 =?us-ascii?q?cssoY/p0QYGsmLCEn2frbBThcRO4B8bmJj5GyxKkNPGczzNBX4q3y26iMOSF?=
 =?us-ascii?q?2kbVImbuv6FZTPgMupyuu854PcYxlShDq6fLh+MAi6oR/eu8ULn4duMLo9xg?=
 =?us-ascii?q?XGrnZGf+ld2GdkKU6Okxrm6cq84YNv/z5Mt/498sJLTLn3cbk/QbFEFjotLn?=
 =?us-ascii?q?o75NfstRnNTAuP4mUTX2ALmRdWAAbL8Q/3UI7pviT1quRy1i+aPdbrTb8vQj?=
 =?us-ascii?q?St871rSB7zhygZMTMy7XzahdZxjKJfpxKhugB/zovJa4ybKPZyYqXQds4BSG?=
 =?us-ascii?q?FfQsheSTBOAoKkb4sOEeUBO/pYr5LgrFcKtBeyGBWgCP/qxjJOm3T437A10/?=
 =?us-ascii?q?45HA/GwgIuAs4OvnrXotX7NqgSUPy6wqbHwjjYc/NZwi3w5JTUfhw9o/yBW6?=
 =?us-ascii?q?97f8rLyUkoEgPIllueqIzhPzyP0OQGrmqV7+1uVO2xi28stgZ8rDavx8cokI?=
 =?us-ascii?q?bJgJgZxFLD9SR33ok0Jca1SFJlbt6iFptfrSeaN5dqTcMlWW1npCE6yrgftJ?=
 =?us-ascii?q?O9YSMExpMnxxvFZPyGdYiF+gnsVOGWITdkgHJlebS/iwyu/kinz+3xUNS/3l?=
 =?us-ascii?q?VSriddj9XAqn8A2wbc58WFUPdw8Eis1SyP2gzP8u1IPEQ5mKnBJ5I/3rI9mY?=
 =?us-ascii?q?AfvErNEyPshkn6kLOael0q+ue26OnrfrDrq5qeOoBplw3yLKEjl8KjDusiPQ?=
 =?us-ascii?q?UDWnKU9fq82bDg+ED1XqlFg/81n6TfrZvUP94UprSjDA9Qyosj7hG/ACq439?=
 =?us-ascii?q?kAhnkHKU5FeAqAj4j0J1HCOPD4Aum7g1SriDpl3+zLMLr9DpnQN3TOjbXuca?=
 =?us-ascii?q?hk505b0wU808pT55VJCrEdO/3zXVLxtNrFARMjKwy02eHnCMlj2YwCRWKPA6?=
 =?us-ascii?q?iZMKXIvV+P++IvP+2MZIgSuDb+MfQq+/nujXohlV8ce6mmw4cXZWilEvh6LE?=
 =?us-ascii?q?iVe3Xhj9UbHWoEsQcyVuznhEGaXT5WfXmyXqY85j8hCIKhCIfOXo6jgbyF3C?=
 =?us-ascii?q?ihGJ1afGJICleCEHj2d4SJQOsMZzyUIs9niDMEU6ShRJMm1R20qAD6zL9nIv?=
 =?us-ascii?q?LO+iIErZLjyMR15+rLmB4o8Tx7Ecuc3HuLT25phGMHWSU607thrkx5zleD1q?=
 =?us-ascii?q?54g/1DGNNI4PNJVRs6NZrdz+x8Edz9RgXBftKRQla8XtqmGS0xTs42w9IWeU?=
 =?us-ascii?q?lxAdSjjg3G3yqvBL8YjKCLBJs6863CxXjxO9hyxGrG1KU7jlkmXtNFNXe6ia?=
 =?us-ascii?q?5n6wjTG4nJnl2dl6arc6QcwSHM+H6ZzWqSoE5VSxBwUarbUnAFfEfWrsr25l?=
 =?us-ascii?q?nET7CwDbQrKAxBydSNKvgCVtq8pFFLVP7lNM7TK0i8n2O3AxfAkrqIYZrjfW?=
 =?us-ascii?q?kH0WPXBUwAlAYS1XyBMhQ6ByHnqGXbWm9AD1XqNm/99eB44FO8UUIlh1Wmfk?=
 =?us-ascii?q?lo0fyV/QEYlNSARvUV17QYsyBnoDJxSgXul+nKAsaN8lIyNJ5XZskwtRIejT?=
 =?us-ascii?q?qD7V50I4CgIqZ+h1UXbwVwuQb02g5qDplbz5h4t2skmQx1L6/QkEhMcT+Vx9?=
 =?us-ascii?q?jRAvXWMSGzmXLncKvKwhfb2deS9L0I7aEUulHqukeJEVUv4l173t9T2n2A7Z?=
 =?us-ascii?q?KMBw0XAtr8?=
X-IPAS-Result: =?us-ascii?q?A2EOBAC0Ogpd/zIiL2hmHAEBAQQBAQcEAQGBZ4FEUFwRd?=
 =?us-ascii?q?QQLKAqEDINHA4UxiS6CV5oIAxg8CQEBAQEBAQEBAQcBGxICAQEChD4CF4JlO?=
 =?us-ascii?q?BMBAwEBAQQBAQEBAwEBAQECaYo3DII6KQFhOTIBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEFAg0rOQEBAQMSEQQNDAEBESYBDwIBCBgCA?=
 =?us-ascii?q?gUhAgICDSMVEAIEDieDAYFqAx0Bnm49AmICC4EEKYheAQFwfjOCeQEBBYUCG?=
 =?us-ascii?q?FOBPQMGgQwojTU/hCM+hEQXgnMygiaOQZsoBwKCE16Faox/J4InhwaOB5ALk?=
 =?us-ascii?q?3kCBAIEBQIOAQEFgWcigVgzGiODPIJBg3CKU0ABMYEpjSgBgSABAQ?=
X-IronPort-AV: E=Sophos;i="5.63,392,1557205200"; 
   d="scan'208";a="14373060"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from mail-by2nam01lp2050.outbound.protection.outlook.com (HELO NAM01-BY2-obe.outbound.protection.outlook.com) ([104.47.34.50])
  by ob1.tennantco.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jun 2019 08:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tennantco.onmicrosoft.com; s=selector1-tennantco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgr+JX0fZ871ua5ShQuHGznSYlHMmX0kXGdg0xH2cAk=;
 b=E5GKyvZrmDKl5HfD5HeC1z/pOyfcD8iEGBPiVx1xV8NkOFGppyCd2MJ/bt+6CjgI7UQ+oIv2J2616VQ5URwTnbGYMYSnBLGa/SnzJrCAZ1PsWpCJuog7n9sWf6R35Rr5eDk43Qb7kFQJN38Z+gSVxFqZE/5osmefWOc24xzAmRE=
Received: from CY4PR20MB1381.namprd20.prod.outlook.com (10.173.111.8) by
 CY4PR20MB1222.namprd20.prod.outlook.com (10.173.115.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Wed, 19 Jun 2019 13:42:52 +0000
Received: from CY4PR20MB1381.namprd20.prod.outlook.com
 ([fe80::7d12:3ca4:a258:2c78]) by CY4PR20MB1381.namprd20.prod.outlook.com
 ([fe80::7d12:3ca4:a258:2c78%5]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 13:42:52 +0000
From:   Dylan Howey <Dylan.Howey@tennantco.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] rtc: pcf2123: port to regmap
Thread-Topic: [PATCH v2 2/4] rtc: pcf2123: port to regmap
Thread-Index: AQHVAemyAdN/LMDpz0WQQihDx54ckKajP2eAgAAGiAA=
Date:   Wed, 19 Jun 2019 13:42:52 +0000
Message-ID: <20190619134248.GA16304@tennantco.com>
References: <20190503195149.31297-1-Dylan.Howey@tennantco.com>
 <20190503195149.31297-2-Dylan.Howey@tennantco.com>
 <20190619131925.GM23549@piout.net>
In-Reply-To: <20190619131925.GM23549@piout.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:91::14) To CY4PR20MB1381.namprd20.prod.outlook.com
 (2603:10b6:903:8d::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Dylan.Howey@tennantco.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [198.204.33.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37694ab7-fc03-4bc3-78f5-08d6f4bc0674
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR20MB1222;
x-ms-traffictypediagnostic: CY4PR20MB1222:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR20MB1222F96CC65E6D552F48A952EFE50@CY4PR20MB1222.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(396003)(346002)(366004)(39860400002)(189003)(199004)(8936002)(76176011)(478600001)(5660300002)(71190400001)(1076003)(36756003)(186003)(6116002)(2906002)(3846002)(81166006)(305945005)(8676002)(6436002)(14454004)(71200400001)(6512007)(6486002)(33656002)(81156014)(6306002)(229853002)(7736002)(486006)(54906003)(64756008)(66476007)(6506007)(66446008)(66946007)(52116002)(53936002)(73956011)(99286004)(102836004)(72206003)(966005)(11346002)(66556008)(25786009)(4326008)(446003)(2616005)(6246003)(86362001)(476003)(68736007)(26005)(386003)(66066001)(6916009)(316002)(256004);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR20MB1222;H:CY4PR20MB1381.namprd20.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: tennantco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +0m7RtnexwWw/P7uv4UFtxwPPjTI7njoTs389hB/Vi4X2Lg1pAdhtoXiurhdzqf5xZT+qRtTcOT/rkT2yuZK/nFhkaAUQ6IhZ0nF0TxbEPQvACRy/JteDwHB6igW1FS9WdFJhxxJW30LWVxZkojFzT5XfpCpKZVLKNGr8u9UnzOzN3lqghm7dd4v7X3g+H6d4cFbEhbJPFCTjVFNIBDj44MOwJWqBo1rMvu5xY72zNlXhDKPjw4PBt+dKgVA221rIkznAFugZYbplmBZjJf/Q0RgbujaQku12Z25+C1b/j/y01WD3NtY7FcWcHSUrBZ5UtTSxnVJNoR3Ruq/Y4Ztal2PqVfe4dGkgl0Salm+0Tb9MU5aixPuTbw213nYgLlS9avajVSottpFL4sPox9nUl5SS07Mdyzo23lZnk1hRkM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <407B4DAEA6D5294D8E976D26E716CD55@namprd20.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: tennantco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37694ab7-fc03-4bc3-78f5-08d6f4bc0674
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 13:42:52.2802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 854ee4fb-bf50-420c-8a26-5b96d626ac37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dhy3@tennantco.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR20MB1222
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

VGhlIDA2LzE5LzIwMTkgMTU6MTksIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KPiBJJ20gcmVh
ZHkgdG8gYXBwbHkgdGhhdCBzZXJpZXMgYnV0Li4uDQo+IA0KPiBPbiAwMy8wNS8yMDE5IDE5OjUy
OjEwKzAwMDAsIER5bGFuIEhvd2V5IHdyb3RlOg0KPiA+ICBzdGF0aWMgaW50IHBjZjIxMjNfcmVh
ZF9vZmZzZXQoc3RydWN0IGRldmljZSAqZGV2LCBsb25nICpvZmZzZXQpDQo+ID4gIHsNCj4gPiAt
CWludCByZXQ7DQo+ID4gLQlzOCByZWc7DQo+ID4gKwlzdHJ1Y3QgcGNmMjEyM19wbGF0X2RhdGEg
KnBkYXRhID0gZGV2X2dldF9wbGF0ZGF0YShkZXYpOw0KPiA+ICsJaW50IHJldCwgdmFsOw0KPiA+
ICsJdW5zaWduZWQgaW50IHJlZzsNCj4gPiAgDQo+ID4gLQlyZXQgPSBwY2YyMTIzX3JlYWQoZGV2
LCBQQ0YyMTIzX1JFR19PRkZTRVQsICZyZWcsIDEpOw0KPiA+IC0JaWYgKHJldCA8IDApDQo+ID4g
KwlyZXQgPSByZWdtYXBfcmVhZChwZGF0YS0+bWFwLCBQQ0YyMTIzX1JFR19PRkZTRVQsICZyZWcp
Ow0KPiA+ICsJaWYgKHJldCkNCj4gPiAgCQlyZXR1cm4gcmV0Ow0KPiA+ICANCj4gPiArCXZhbCA9
IHNpZ25fZXh0ZW5kMzIoKHJlZyAmIE9GRlNFVF9NQVNLKSwgT0ZGU0VUX1NJR05fQklUKTsNCj4g
PiArDQo+ID4gIAlpZiAocmVnICYgT0ZGU0VUX0NPQVJTRSkNCj4gPiAtCQlyZWcgPDw9IDE7IC8q
IG11bHRpcGx5IGJ5IDIgYW5kIHNpZ24gZXh0ZW5kICovDQo+ID4gLQllbHNlDQo+ID4gLQkJcmVn
ID0gc2lnbl9leHRlbmQzMihyZWcsIE9GRlNFVF9TSUdOX0JJVCk7DQo+ID4gKwkJdmFsICo9IDI7
DQo+ID4gIA0KPiANCj4gUGxlYXNlIHJlbW92ZSB0aGF0IGNoYW5nZSB0aGF0IHNuZWFrZWQgaW4g
OykNCj4gDQo+IC0tIA0KPiBBbGV4YW5kcmUgQmVsbG9uaSwgQm9vdGxpbg0KPiBFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20NCg0KSSBi
ZWxpZXZlIHRoaXMgY2hhbmdlIGlzIG5lY2Vzc2FyeS4gSW4gdGhlIG9sZCBjb2RlIHJlZyB3YXMg
OC1iaXQsIHdoaWNoDQptZWFucyByZWcgPDw9IDEgd2FzIGRpc2NhcmRpbmcgdGhlIGNvYXJzZSBi
aXQuIE5vdyB0aGF0IEknbSB1c2luZyBhDQpsYXJnZXIgcmVnIEkgY2FuJ3QgdXNlIHRoYXQgdHJp
Y2sgYW5kIGhhdmUgdG8gdXNlIHNpZ25fZXh0ZW5kMzIgYW5kIGENCm11bHRpcGx5Lg0KDQotLSAN
CkR5bGFuDQo=
