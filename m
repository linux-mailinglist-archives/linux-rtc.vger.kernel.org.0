Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97C316E206
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jul 2019 09:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbfGSHyo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Jul 2019 03:54:44 -0400
Received: from mail-eopbgr20049.outbound.protection.outlook.com ([40.107.2.49]:27751
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725853AbfGSHyo (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 19 Jul 2019 03:54:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDgL+iikB2PKtFmwslJTUyt8IzCxeRoLD42YoJyJm72sNjBTZXHt6T7hVYJqJjWzVGFIZwdH8dTUsFBFM/EA4nl1TW3EFHfp6eYKNH9zbseEQL8xMJm4AicXQuUiOiu1ityOoNglP7j6NzFYpBZi+KQHU61ItvW5W17yqdNl9q9y72WXzKsSgI/r6ZydbZkcjtPFatPtSCxjaJeiZuiXsWHojsbqZmpZqaFsFd58x0J00hpJNuD8W3cL+Em3t/rgMCYReW+Zqrj3JBprzG2PXDf9KuS1DiYvxzhL05zqv9mPFnU+8mHnniOiv1TC6sBqoBIKn1KoqKfby23lF/NOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ha3/uhfZSnMVbkM2q7HiFzCo5c/wINTS+7yU6C094iI=;
 b=UxE9lIflwN+ZKacZ9kII3bPpvLdTRQ6TmjqbqtQWzbdYTAklrI9E1lB82S9LqqrzNzZ2qqEjosfssQS8H4twY1SFHnGQivPKm1bgGPMpAkwwlaRrxF0FZdDeV7g1jk5+NkzEwXJM49/yB9wUpWWXFXOdZ0/37mDPm0mmVFJHm15r/XWDo5DZZrm+cgZMrqllBUSgxzZEAhY6s2rJKRW7kbPqsG86UPrbptHuQHN8YywnAlGZXlPRO4E/xOsn4z5azD+JQsw9Ul6aATXsTFchJdEpZTd5ZD+mHPIrZUMp3FedtbhtmrXiaoODZXgp7httUGf14HPmKjP4we5uOxx9Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ha3/uhfZSnMVbkM2q7HiFzCo5c/wINTS+7yU6C094iI=;
 b=B2+i1SBLSfAgzputTZ5JeKa5kSIy56v6zj249cSJlCU7IZDIzh0oj//sOAVe8pgJOjybJl7PvSyIKcwexPBcBe41B2WGNt+zlib8P27wK5UKPESdLTTZWL9K+FEPaAEjtNjqO+0aj07sSZjTnZh/Ex0DJEkyzYVBZoFbVahO3h4=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3836.eurprd04.prod.outlook.com (52.134.71.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 07:54:40 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::7cdf:bddc:212c:f77e]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::7cdf:bddc:212c:f77e%4]) with mapi id 15.20.2094.013; Fri, 19 Jul 2019
 07:54:40 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2] rtc: snvs: fix possible race condition
Thread-Topic: [PATCH V2] rtc: snvs: fix possible race condition
Thread-Index: AQHVPd+ABv+ivO8L20SxEcpS65WsZabRjLYAgAAFwqA=
Date:   Fri, 19 Jul 2019 07:54:40 +0000
Message-ID: <DB3PR0402MB3916A9FED386A432551132B0F5CB0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190719030102.6141-1-Anson.Huang@nxp.com>
 <20190719073316.GA4012@piout.net>
In-Reply-To: <20190719073316.GA4012@piout.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7f15879-5e5b-4d2e-94f6-08d70c1e5a9f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:DB3PR0402MB3836;
x-ms-traffictypediagnostic: DB3PR0402MB3836:
x-microsoft-antispam-prvs: <DB3PR0402MB3836F90E779C58F2F27C95B0F5CB0@DB3PR0402MB3836.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(199004)(189003)(11346002)(66946007)(64756008)(66446008)(102836004)(66476007)(66556008)(446003)(86362001)(229853002)(476003)(71200400001)(71190400001)(81156014)(52536014)(81166006)(54906003)(8936002)(26005)(4744005)(6246003)(76116006)(6506007)(5660300002)(256004)(186003)(4326008)(14454004)(316002)(14444005)(99286004)(6436002)(25786009)(76176011)(7696005)(478600001)(2906002)(3846002)(305945005)(6116002)(74316002)(55016002)(8676002)(33656002)(9686003)(53936002)(6916009)(486006)(7736002)(68736007)(44832011)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3836;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DBj5iOaMsrhBvEooxv04OvVw/9lqZi+0+iTlj/9wfdzqHlJfUMsCcdkmVTrmcEHq+z4wykouuRAR6zjcqjZ8s6SO3yri6M+Ewq1nQIWQoVIM1VyCQbGwmpPCQIx/jxTq/2qfJ6onffs9StaKjos9lfg+zKjH1pxJ+YfJuU4mnw8jG/Ah/QDLsmofQ6KiS0FWuo+ndlyXjLoAmOwJ694RzVNaQk4sSFAJJByFXSH/Yu4Iyx8Bff6LhPSCOPmF8j2+5YE2/jw3JtPwQAJ65/FhtQNELLE4JWb2HmI4XG9/228ogPH9XnsqSmnwqvkVVZJ6GNFQqHdki5r1YNaSTY+nKPYRs4Jz1zzf9LOayQ/AcpRyAdi+o90SExzOR+GOKogjp04C7cNyZI5O52MHWF8pLif2QyXYjwHwVC2l6h8O5Qo=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f15879-5e5b-4d2e-94f6-08d70c1e5a9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 07:54:40.3895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: anson.huang@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3836
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGksIEFsZXhhbmRyZQ0KDQo+IE9uIDE5LzA3LzIwMTkgMTE6MDE6MDIrMDgwMCwgQW5zb24uSHVh
bmdAbnhwLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhw
LmNvbT4NCj4gPg0KPiA+IFRoZSBSVEMgSVJRIGlzIHJlcXVlc3RlZCBiZWZvcmUgdGhlIHN0cnVj
dCBydGNfZGV2aWNlIGlzIGFsbG9jYXRlZCwNCj4gPiB0aGlzIG1heSBsZWFkIHRvIGEgTlVMTCBw
b2ludGVyIGRlcmVmZXJlbmNlIGluIElSUSBoYW5kbGVyLg0KPiA+DQo+ID4gVG8gZml4IHRoaXMg
aXNzdWUsIGFsbG9jYXRpbmcgdGhlIHJ0Y19kZXZpY2Ugc3RydWN0IGFuZCByZWdpc3RlciBydGMN
Cj4gPiBkZXZpY2UgYmVmb3JlIHJlcXVlc3RpbmcgdGhlIFJUQyBJUlEuDQo+ID4NCj4gPiBVc2lu
ZyBkZXZtX3J0Y19hbGxvY2F0ZV9kZXZpY2UvcnRjX3JlZ2lzdGVyX2RldmljZSBpbnN0ZWFkIG9m
DQo+ID4gZGV2bV9ydGNfZGV2aWNlX3JlZ2lzdGVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
QW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBz
aW5jZSBWMToNCj4gPiAJLSBtb3ZlIGRldm1fcmVxdWVzdF9pcnEoKSB0byBhZnRlciBydGMgZGV2
aWNlIHJlZ2lzdGVyIGRvbmUsIG1ha2UNCj4gc3VyZSBldmVyeXRoaW5nDQo+ID4gCSAgaXMgcmVh
ZHkgYmVmb3JlIGVuYWJsaW5nIElSUS4NCj4gDQo+IFRoaXMgb3BlbnMgYW5vdGhlciByYWNlIGNv
bmRpdGlvbiwgdGhlIGZpcnN0IHZlcnNpb24gb2YgdGhlIHBhdGNoIHdhcyBjb3JyZWN0Lg0KDQpI
bW0sIE9LLCB0aGVuIHdlIHNob3VsZCBnbyB3aXRoIFYxLg0KDQpUaGFua3MsDQpBbnNvbi4NCg==
