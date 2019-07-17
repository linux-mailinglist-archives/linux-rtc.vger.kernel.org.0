Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 661776BDB6
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2019 15:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfGQN5v (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Jul 2019 09:57:51 -0400
Received: from mail-eopbgr50052.outbound.protection.outlook.com ([40.107.5.52]:56398
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725799AbfGQN5u (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 17 Jul 2019 09:57:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiNWxEagGNJCEC0kipDUtR42VuIXs7/Fe52ATqV+I2DaIEfsnSxGb+1626X9lErmFpW4t+/AyrRaYdBZuV/1RbdxAbCzzaRQXgEVK4hveiqIIYpS2JJOwJfrgPDsziqnfTQjHKdo24cGMimZXvQ+iItzhWo5Hy2BRIygWvTxitF+OJLZyeIsswcjxpAFox1ZvfsH9vgG4CilJbngoMX2os0BwXBNcK0oseHrBP9UrQ2ZAVBeq2h2uWkx3x8VXdM4IvjE2LrSna9BKIIxCO6kai/9A4HOvLvhNPET71NKvK/RIGvxpCkgMrwHW+kJc1ltXRa5XrOBNIIfBG+VUVgBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rCPv+GJ/ZYpW0gMBC9ueUPem8vlJaTAEpF45QfNIZk=;
 b=fCmhqxalNJOIr+qhPI3qv5d0hojXXKLRdfO61pEGI7MclKiGVX5AZuihFe3KjhFHFmmGVUsvBU7XNgVt1PamHs4mKP6FQofsn9Hxv/fwnCfXH0yC/n1Kg7aK5igxcp+jCuSmhS6tjh2XqNY6jN1frIREdIEGC9q70J1Z9rglZUwds5ov/9r84ns9+7RUuAAAp8Q1AvAXOg2uxFk11qt20HPa6wa00ukCamKxtAnOq03yQ6Zn5CeviaKWZ9vhb8JnXwO8xHkfmcGTHNpet2JXhBPWX+3TVIPSvSLz0107wew1d/7MZ+9nzaeFgqYzR/yOAbJfpHATEzeItz23kKFTxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rCPv+GJ/ZYpW0gMBC9ueUPem8vlJaTAEpF45QfNIZk=;
 b=l/jHJhEHIJEXAIAE7lPX4XhnuL35+mQECE6HBdQ28iQA7EuXSzbqNlaGzUrhJgvOc5fOteZp2ipRrrsgoA5Wo0lgAT0+J0ES5I//m9LhPJtUMjn+IbhfNe/+3MYgX9g7p1yFBqiID72EaPphZOMv+DlNZ2vCOGmEJAewgCwFeD4=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3642.eurprd04.prod.outlook.com (52.134.65.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 13:57:46 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8875:8e81:7be1:b0a0]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::8875:8e81:7be1:b0a0%5]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 13:57:46 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] rtc: snvs: fix possible race condition
Thread-Topic: [PATCH] rtc: snvs: fix possible race condition
Thread-Index: AQHVO6gHgDF/BlJMPUyX9VGe8rSFO6bOpJgAgAAyYBA=
Date:   Wed, 17 Jul 2019 13:57:45 +0000
Message-ID: <DB3PR0402MB39164D0022E25706D2B871C7F5C90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190716071858.36750-1-Anson.Huang@nxp.com>
 <AM0PR04MB421167283C950557E231181480C90@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB421167283C950557E231181480C90@AM0PR04MB4211.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0aaa830d-f6a0-49e9-ca34-08d70abebf01
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3642;
x-ms-traffictypediagnostic: DB3PR0402MB3642:
x-microsoft-antispam-prvs: <DB3PR0402MB3642DB0265C3A2099FC7381CF5C90@DB3PR0402MB3642.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(199004)(189003)(64756008)(66946007)(66556008)(71190400001)(66476007)(66446008)(26005)(229853002)(476003)(2501003)(446003)(11346002)(71200400001)(102836004)(52536014)(8936002)(110136005)(316002)(81166006)(86362001)(6506007)(76116006)(4326008)(5660300002)(186003)(2906002)(7696005)(14454004)(14444005)(256004)(44832011)(99286004)(66066001)(76176011)(25786009)(81156014)(305945005)(8676002)(7736002)(478600001)(74316002)(4744005)(9686003)(6116002)(6246003)(53936002)(33656002)(55016002)(3846002)(2201001)(486006)(6436002)(68736007);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3642;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cP8PYsprzaIU8sgTz8DeD7lj/ue38h0EkulxHJOYQgWV84fXGnSGxGrbd4ru6PhoXWhH1sI2w66nx5ade1G1VPPNOGfsL0Ll+zI+kuPdc7EqtDKYl2MfFHVLivVeeUzZix1Nzt1BYXhLxshNpAlNHfqM8GRBjMrGZTQj0MSJZnLhYw92SkX9bGEEoeUTBGSo8T+Yz1kkpvO4E8clY/rVJqk1DGF0/KYlV8Z14LwFW5MoGZP61cw4SbxZDM69HcRhSfdxikCNhE4uHeEwYNxecaMHvMJhcftS9RLIzSP6AsJhd+W+JY171OCA2JYmBvH6y+ZCnxgp41Tah/Mh7Pyxq/t2OW/JNeo6Kx/cs5J7sVk0wRmBVXAaluHIsXJvH3O5EnUUiPgTRk3b1atT7RQiu5KosYA+4ZngegA8BFIkwAg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aaa830d-f6a0-49e9-ca34-08d70abebf01
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 13:57:45.9774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: anson.huang@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3642
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGksIEFpc2hlbmcNCg0KPiA+IEZyb206IEFuc29uLkh1YW5nQG54cC5jb20gPEFuc29uLkh1YW5n
QG54cC5jb20+DQo+ID4gU2VudDogVHVlc2RheSwgSnVseSAxNiwgMjAxOSAzOjE5IFBNDQo+ID4N
Cj4gPiBUaGUgUlRDIElSUSBpcyByZXF1ZXN0ZWQgYmVmb3JlIHRoZSBzdHJ1Y3QgcnRjX2Rldmlj
ZSBpcyBhbGxvY2F0ZWQsDQo+ID4gdGhpcyBtYXkgbGVhZCB0byBhIE5VTEwgcG9pbnRlciBkZXJl
ZmVyZW5jZSBpbiBJUlEgaGFuZGxlci4NCj4gPg0KPiA+IFRvIGZpeCB0aGlzIGlzc3VlLCBhbGxv
Y2F0aW5nIHRoZSBydGNfZGV2aWNlIHN0cnVjdCBiZWZvcmUgcmVxdWVzdGluZw0KPiA+IHRoZSBS
VEMgSVJRIHVzaW5nIGRldm1fcnRjX2FsbG9jYXRlX2RldmljZSwgYW5kIHVzZQ0KPiA+IHJ0Y19y
ZWdpc3Rlcl9kZXZpY2UgdG8gcmVnaXN0ZXIgdGhlIFJUQyBkZXZpY2UuDQo+ID4NCj4gDQo+IEkg
c2F3IG90aGVyIHJ0YyBkcml2ZXJzIGRpZCB0aGUgc2FtZSB3YXkgYXMgdXMsIHNvIHRoaXMgbG9v
a3MgbGlrZSBhIGNvbW1vbg0KPiBwcm9ibGVtLg0KPiBNeSBxdWVzdGlvbiBpcyBpZiB3ZSBjYW4g
Y2xlYXIgaW50ZXJydXB0IHN0YXR1cyBiZWZvcmUgcmVnaXN0ZXIgdG8gYXZvaWQgdGhpcw0KPiBp
c3N1ZSBhcyBvdGhlciBydGMgZHJpdmVycz8NCg0KSSB0aGluayB3ZSBjYW4gTk9UIHByZWRpY3Qg
d2hlbiB0aGUgSVJRIHdpbGwgYmUgcGVuZGluZywgSVJRIGNvdWxkIGFycml2ZSBhdCBhbnkgdGlt
ZSwNCnRoZSBtb3N0IHNhZmUgd2F5IGlzIHRvIHByZXBhcmUgZXZlcnl0aGluZyBiZWZvcmUgcmVx
dWVzdGluZy9lbmFibGluZyBJUlEuDQpUaGVyZSBpcyBhbHNvIHBhdGNoIHRvIGZpeCBzaW1pbGFy
IGlzc3VlOg0KDQpjb21taXQgMDYwNzExZjUyNzRkZmMyZDc2YTViMmNkNjVhYmY2Y2NiZjA2MWU0
MA0KQXV0aG9yOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5j
b20+DQpEYXRlOiAgIFR1ZSBBcHIgMzAgMTE6MzI6MDkgMjAxOSArMDIwMA0KDQogICAgcnRjOiBk
aWdpY29sb3I6IGZpeCBwb3NzaWJsZSByYWNlIGNvbmRpdGlvbg0KDQpBbnNvbiANCg0K
