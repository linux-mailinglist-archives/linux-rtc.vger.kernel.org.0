Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6736EAE6
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jul 2019 21:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbfGSTE2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Jul 2019 15:04:28 -0400
Received: from us-smtp-delivery-168.mimecast.com ([216.205.24.168]:43053 "EHLO
        us-smtp-delivery-168.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727344AbfGSTE2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 Jul 2019 15:04:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=impinj.com;
        s=mimecast20190405; t=1563563066;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KOSflosmMUO+thxGsJ8vTuoStHwFwJSDICB5eAqCTMw=;
        b=BurZOwfXeJk7JXz5bGVXSlAYRN26boapA2mYK9MBIK7bu2gGLtUt6i7SDBoLYKc8CvlMDJ
        AHQngVrhHIfU91xuU7ey5NcrpDroDiG0OHXsk9mrDo6IbT8LvgequYl7B7MYxF9HmFgOWX
        2ksiBOHVU6eNYLUgvds5vD1oQAs2rGo=
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03lp2059.outbound.protection.outlook.com [104.47.40.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-mxnzqoWEPDibYPYx2TJy_A-1; Fri, 19 Jul 2019 15:04:25 -0400
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com (10.167.236.38) by
 MWHPR0601MB3739.namprd06.prod.outlook.com (10.167.236.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Fri, 19 Jul 2019 19:04:21 +0000
Received: from MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::2d66:fca6:b053:764f]) by MWHPR0601MB3708.namprd06.prod.outlook.com
 ([fe80::2d66:fca6:b053:764f%6]) with mapi id 15.20.2094.011; Fri, 19 Jul 2019
 19:04:21 +0000
From:   Trent Piepho <tpiepho@impinj.com>
To:     "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "anson.huang@nxp.com" <anson.huang@nxp.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>
CC:     "linux-imx@nxp.com" <linux-imx@nxp.com>
Subject: Re: [PATCH] rtc: snvs: fix possible race condition
Thread-Topic: [PATCH] rtc: snvs: fix possible race condition
Thread-Index: AQHVO6gKZejg7PMOuUGfI0AjQ/aRL6bOpJgAgAAzT4CAANzngIAA4I4AgACusACAAQ4tAA==
Date:   Fri, 19 Jul 2019 19:04:21 +0000
Message-ID: <1563563060.2343.88.camel@impinj.com>
References: <20190716071858.36750-1-Anson.Huang@nxp.com>
         <AM0PR04MB421167283C950557E231181480C90@AM0PR04MB4211.eurprd04.prod.outlook.com>
         <DB3PR0402MB39164D0022E25706D2B871C7F5C90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
         <AM0PR04MB421114F025F27AF2BC5FA21980C80@AM0PR04MB4211.eurprd04.prod.outlook.com>
         <1563467526.2343.80.camel@impinj.com>
         <DB3PR0402MB3916053E6344520416BC976BF5CB0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB3916053E6344520416BC976BF5CB0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [216.207.205.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed5a26ca-628f-49b0-4e8f-08d70c7be853
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR0601MB3739;
x-ms-traffictypediagnostic: MWHPR0601MB3739:
x-microsoft-antispam-prvs: <MWHPR0601MB373982BA326516CF90E7F6A6D3CB0@MWHPR0601MB3739.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(366004)(136003)(346002)(39850400004)(376002)(189003)(199004)(71200400001)(71190400001)(76116006)(5660300002)(2201001)(91956017)(14454004)(110136005)(6116002)(36756003)(3846002)(476003)(316002)(2906002)(6246003)(229853002)(4326008)(86362001)(66946007)(66446008)(64756008)(66556008)(66476007)(2501003)(478600001)(102836004)(6506007)(6486002)(26005)(7736002)(305945005)(8676002)(6436002)(53936002)(25786009)(99286004)(8936002)(486006)(81166006)(81156014)(256004)(14444005)(68736007)(66066001)(103116003)(2616005)(6512007)(186003)(76176011)(446003)(11346002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR0601MB3739;H:MWHPR0601MB3708.namprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Px5nIZJVj0U1tf5AXD83f8+VcUER5rU866jkVNeWE5frmTSrsLLiqagC7YlrGJXYtd6aDgCNzo6gNihVMLBP2NhfnsebtMwzRkOxWgPR77mWt7ZMsg6d66RCsK9Km02RO1SIUJYdLQrqk08KqPVfv0LH5FtH9E3WQ2iFO1c026rcDYQ1RU+1Mb8wMKffUwk0Olqrj5vHO9rQGEsGXqtD5mBf7LohCJvUIh6syxXFg/UsG4TzGruKYBQuILPP5mA3OeyrR39++UnqIrAsQN7b52v46poavEjkde9HK4lKy6P/VpBka5L/30bzTFsjrUYuBvyFyE84XzlutTAJ5GA7FNB5nv/5L9zbnQ3W6FAM4IkbUBVXsNZ6+rzSJIBC4oaTXqlmANYJzpk4ZXzrHlaEEso1Nzle3OoeEiwaUNyYnGg=
Content-ID: <B9164D4BA2C38841BE5D28D1E8699A94@namprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: impinj.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5a26ca-628f-49b0-4e8f-08d70c7be853
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 19:04:21.2886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6de70f0f-7357-4529-a415-d8cbb7e93e5e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tpiepho@impinj.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0601MB3739
X-MC-Unique: mxnzqoWEPDibYPYx2TJy_A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gRnJpLCAyMDE5LTA3LTE5IGF0IDAyOjU3ICswMDAwLCBBbnNvbiBIdWFuZyB3cm90ZToNCj4g
DQo+ID4gSSBkbyB3b3JyeSB0aGF0IGhhbmRsaW5nIHRoZSBpcnEgYmVmb3JlIHRoZSBydGMgZGV2
aWNlIGlzIHJlZ2lzdGVyZWQgY291bGQgc3RpbGwNCj4gPiByZXN1bHQgaW4gYSBjcmFzaC4gIEZy
b20gd2hhdCBJIHNhdywgdGhlIGlycSBwYXRoIGluIHNudnMgb25seSB1c2VzIGRyaXZlciBzdGF0
ZQ0KPiA+IG1lbWJlcnMgdGhhdCBhcmUgZnVsbHkgaW5pdGlhbGl6ZWQgZm9yIHRoZSBtb3N0IHBh
cnQsIGFuZCB0aGUgYWxsb2NhdGVkIGJ1dA0KPiA+IHVucmVnaXN0ZXJlZCBkYXRhLT5ydGMgaXMg
b25seSB1c2VkIGluIG9uZSBjYWxsIHRvIHJ0Y191cGRhdGVfaXJxKCksIHdoaWNoDQo+ID4gYXBw
ZWFycyB0byBiZSBvayB3aXRoIHRoaXMuDQo+ID4gDQo+ID4gQnV0IGl0IGlzIG5vdCB0aGF0IGhh
cmQgdG8gaW1hZ2luZSB0aGF0IHNvbWV0aGluZyBjb3VsZCBnbyBpbnRvIHRoZSBydGMgY29yZQ0K
PiA+IHRoYXQgYXNzdW1lcyBjYWxsIGxpa2UgcnRjX3VwZGF0ZV9pcnEoKSBhcmUgb25seSBtYWRl
IG9uIHJlZ2lzdGVyZWQgZGV2aWNlcy4NCj4gPiANCj4gPiBJZiB0aGVyZSB3YXMgYSB3YXkgdG8g
ZG8gaXQsIEkgdGhpbmsgYWxsb2NhdGluZyB0aGUgaXJxIGluIGEgbWFza2VkIHN0YXRlIGFuZA0K
PiA+IHRoZW4gdW5tYXNraW5nIGl0IGFzIHBhcnQgb2YgdGhlIGZpbmFsIHJlZ2lzdHJhdGlvbiBj
YWxsIHRvIG1ha2UgdGhlIGRldmljZSBnbw0KPiA+IGxpdmUgd291bGQgYmUgYSBzYWZlciBhbmQg
bW9yZSBnZW5lcmFsIHBhdHRlcm4uDQo+IA0KPiBJdCBtYWtlcyBzZW5zZSwgSSB0aGluayB3ZSBj
YW4ganVzdCBtb3ZlIHRoZSBkZXZtX3JlcXVlc3RfaXJxKCkgdG8gYWZ0ZXIgcnRjX3JlZ2lzdGVy
X2RldmljZSgpLA0KPiBJdCB3aWxsIG1ha2Ugc3VyZSBldmVyeXRoaW5nIGlzIHJlYWR5IGJlZm9y
ZSBJUlEgaXMgZW5hYmxlZC4gV2lsbCBzZW5kIG91dCBhIFYyIHBhdGNoLiANCg0KVGhhdCB3aWxs
IG1lYW4gcmVnaXN0ZXJpbmcgdGhlIHJ0YywgdGhlbiB1bnJlZ2lzdGVyaW5nIGl0IGlmIHRoZSBp
cnENCnJlcXVlc3QgZmFpbHMuICBNb3JlIG9mIGEgcGFpbiB0byB3cml0ZSB0aGlzIGZhaWx1cmUg
cGF0aC4NCg0KQWxleGFuZHJlLCBpcyBpdCBwYXJ0IG9mIHJ0YyBjb3JlIGRlc2lnbiB0aGF0IHJ0
Y191cGRhdGVfaXJxKCkgbWlnaHQgYmUNCmNhbGxlZCBvbiBhIHJ0YyBkZXZpY2UgdGhhdCBpcyBw
cm9wZXJseSBhbGxvY2F0ZWQsIGJ1dCBub3QgcmVnaXN0ZXJlZA0KeWV0Pw0K

