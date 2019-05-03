Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD60612F5B
	for <lists+linux-rtc@lfdr.de>; Fri,  3 May 2019 15:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfECNij (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 May 2019 09:38:39 -0400
Received: from esa2.tennantco.iphmx.com ([68.232.153.189]:47335 "EHLO
        esa2.tennantco.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727485AbfECNii (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 May 2019 09:38:38 -0400
X-Greylist: delayed 503 seconds by postgrey-1.27 at vger.kernel.org; Fri, 03 May 2019 09:38:38 EDT
IronPort-PHdr: =?us-ascii?q?9a23=3A0GnS/RBXV/vKa84KLfmfUyQJP3N1i/DPJgcQr6?=
 =?us-ascii?q?AfoPdwSP37r8mwAkXT6L1XgUPTWs2DsrQY0rOQ7PmrBzNIyK3CmUhKSIZLWR?=
 =?us-ascii?q?4BhJdetC0bK+nBN3fGKuX3ZTcxBsVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBx?=
 =?us-ascii?q?rwKxd+KPjrFY7OlcS30P2594HObwlSizexfK5+IA+0oAnMucUbgIlvIbstxx?=
 =?us-ascii?q?XUpXdFZ/5Yzn5yK1KJmBb86Maw/Jp9/ClVpvks6c1OX7jkcqohVbBXAygoPG?=
 =?us-ascii?q?4z5M3wqBnMVhCP6WcGUmUXiRVHHQ7I5wznU5jrsyv6su192DSGPcDzULs5Vy?=
 =?us-ascii?q?iu47ttRRT1kyoMKSI3/3/LhcxxlKJboQyupxpjw47PfYqZMONycr7Bcd8GQG?=
 =?us-ascii?q?ZMWNtaWS5cDYOmd4YBD/QPM/tEr4fzpFUOoxmxBQiwC+3gxTBFnWP20rYg3u?=
 =?us-ascii?q?g9DQ3KwA4tEtQTu3rUttX1M6ISXPi7wqjIyTXMdfVW0ir/5ojPfBEuv/GNVq?=
 =?us-ascii?q?93fMTfyUgvExnKjlOKpYLnODOU2PoCsmiA4up8S+2vjWgnpBt3ojiz2sgsjZ?=
 =?us-ascii?q?PFiZ4SylDB7Ch0xps+K96gSENjfNKoDJRduzuVOoZ0WM8vTGBltDw6x7AGoZ?=
 =?us-ascii?q?K3YSwHxZc9yxLBd/CKfJKE7xztWeqLPzt0mG5pdKqxhxms8kWs1ujxW8y13V?=
 =?us-ascii?q?lXsiVIltzBuW0T2BPN5MWKT+Vy8Vq91jqT0g3c8ONJLlsqmqfdNpUv2KQ/lo?=
 =?us-ascii?q?AJvkTGBiL2nUL2g7KIeUg84eio7vjnYq3hpp+BK494kgH+Pboqmsy4Gek2Kh?=
 =?us-ascii?q?QDUW+H9emzzbHu4FX3TbtTgv0xiabWrorWJcMGpq6lGABV1Zsj6xCiADu8yN?=
 =?us-ascii?q?QYh34HLE5bdx2bk4jpOlbOIPbiAfe4nlSsjDNrx/fBPr3iGJnCMn/DkLL5cb?=
 =?us-ascii?q?Z87U5T1hYzwMhC655IBbwNOv3+V03ruNHXDxI1KQy5zub/BNV4zIweWGaPAq?=
 =?us-ascii?q?GDMKPVtF+F/uwhIumIZIAPvjbxMfor5/ngjHAnmV4QZrWp0oURaHC+BPtmJV?=
 =?us-ascii?q?mZbmbrgtsbDWgKuQ8+QPTwiFKeST5Te2qyX6Uk6z4hDIKpE4jCSZqrgLOcxi?=
 =?us-ascii?q?e0AIdaaXtYBVCIFXfocIOEW/YXZS2JJc9hlSAEVbygS48nzx2hqAj6y79/JO?=
 =?us-ascii?q?rO5iIYrY7j1MRy5+DLjx4+7z11D9mY02GISGF5hX8IRzg43a9hu0x91kmM3r?=
 =?us-ascii?q?R4g/BCFNxT++tDUh0mOp7E0+x6F9fyVxrFfteITlamX9qnDSgrTtIt39ADeF?=
 =?us-ascii?q?h9G9q8gRDZxSaqAKEal6aNBJMq9qLQxX/xJ9xyyyWO6K50pl0rUsJJOXerzo?=
 =?us-ascii?q?Ry8wzUAY+Bx0ydmrajc6gG0WjH+WOHymyPlEtfVxJ0UKODVncaMBj4t9P8s2?=
 =?us-ascii?q?/TS7aoQZQgLQZQgZquO69DbJvJikpLVd//NdLYamStkGD2DhGNkODfJLH2cn?=
 =?us-ascii?q?kQiX2OQHMPlBoeqDPfbVBkXHWovn7eATpyFFnmf0Lr96xkpWimSlMvkVHYdF?=
 =?us-ascii?q?Vvgryy/BNdxeeRTf8exPolgG8gsH01eTT1xNfKE5yFrgtlcr9bZIYR8VNO0y?=
 =?us-ascii?q?T5sBNwL7S8IqZkj1gCeAMxtETrhF16?=
X-IPAS-Result: =?us-ascii?q?A2FEAwDWQcxc/zcuL2hlgheBPlCBXgMECygKhAaDRwOFM?=
 =?us-ascii?q?YlSgleYUoEkAxg8DwEtAoQ+AheCEzYHDgEDAQEBBAEBAQECAQECaRwMgjopA?=
 =?us-ascii?q?WE5MgEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQUCODkBA?=
 =?us-ascii?q?QEDEhERDAEBESYBDwIBCBgCAgUhAgICDSMVEAIEDieEawMdAaF0PQJiAguBA?=
 =?us-ascii?q?SmIX3GBL4J5AQEFhQMYUoE8CYELJ40lP4QjPoREF4JzMoImjVWZYQcCggtWk?=
 =?us-ascii?q?WMngg6KK4kPoQQCBAIEBQIOAQEFgVYJKYFWMxojgzyFfopTQAExgSmOdgGBI?=
 =?us-ascii?q?AEB?=
X-IronPort-AV: E=Sophos;i="5.60,425,1549951200"; 
   d="scan'208";a="13796083"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from mail-bn3nam04lp2055.outbound.protection.outlook.com (HELO NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.55])
  by ob1.tennantco.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 May 2019 08:30:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tennantco.onmicrosoft.com; s=selector1-tennantco-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef86qYuw2eat8NlKn0e3zAbRGLI6A+peByN3O1WBKDw=;
 b=MG1WiTN/hbXo9nAalLG03VlWh9BdMg/krGb3mAAx++VQoY6M+sk3iDqqn8j90ISSqA6l/HaqAO0zI8Hxza1v5oBDh8AN9a7C4HL5phaAFUWye4LwYme8sLtLOu//O214ep8qd0Yjf+DqvKyINQNyczuF1kYAIU9pWi3H9xVN79w=
Received: from CY4PR20MB1381.namprd20.prod.outlook.com (10.173.111.8) by
 CY4PR20MB1159.namprd20.prod.outlook.com (10.173.110.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Fri, 3 May 2019 13:30:12 +0000
Received: from CY4PR20MB1381.namprd20.prod.outlook.com
 ([fe80::6dc9:dee3:edc0:a7be]) by CY4PR20MB1381.namprd20.prod.outlook.com
 ([fe80::6dc9:dee3:edc0:a7be%4]) with mapi id 15.20.1856.008; Fri, 3 May 2019
 13:30:12 +0000
From:   Dylan Howey <Dylan.Howey@tennantco.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 1/2] Port rtc-pcf2123 to regmap
Thread-Topic: [PATCH 1/2] Port rtc-pcf2123 to regmap
Thread-Index: AQHU/GdxJRWxL7Stt0KuQz+yj2UEMaZP+a8AgAL0soCAAYVnAIADXTQAgACI5QCAARX3gA==
Date:   Fri, 3 May 2019 13:30:12 +0000
Message-ID: <20190503133008.GA30943@tennantco.com>
References: <20190426193648.1599-1-Dylan.Howey@tennantco.com>
 <20190427130054.GY14604@piout.net> <20190429150913.GA15052@tennantco.com>
 <20190430092256.GC11339@piout.net> <20190502174518.GA12323@tennantco.com>
 <20190502205516.GD22550@piout.net>
In-Reply-To: <20190502205516.GD22550@piout.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR01CA0025.prod.exchangelabs.com (2603:10b6:208:10c::38)
 To CY4PR20MB1381.namprd20.prod.outlook.com (2603:10b6:903:8d::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Dylan.Howey@tennantco.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [198.204.33.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79eebff3-9fbd-4b38-2d9c-08d6cfcb782b
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:CY4PR20MB1159;
x-ms-traffictypediagnostic: CY4PR20MB1159:
x-microsoft-antispam-prvs: <CY4PR20MB1159B57FA8F98AD9FA8F59D4EF350@CY4PR20MB1159.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(346002)(396003)(376002)(39860400002)(136003)(189003)(199004)(6916009)(7736002)(476003)(486006)(2616005)(256004)(305945005)(86362001)(66946007)(6436002)(6486002)(229853002)(14454004)(11346002)(446003)(316002)(478600001)(52116002)(102836004)(72206003)(33656002)(36756003)(54906003)(6506007)(26005)(99286004)(76176011)(186003)(68736007)(73956011)(386003)(66446008)(81166006)(71190400001)(53936002)(2906002)(1076003)(71200400001)(66066001)(66476007)(64756008)(81156014)(4744005)(8676002)(6512007)(6116002)(4326008)(25786009)(5660300002)(3846002)(6246003)(8936002)(66556008);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR20MB1159;H:CY4PR20MB1381.namprd20.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: tennantco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oPbdYq8bdhjR8G1qlJRuoXVyrxhNkxaqCesznXADQVkfBYJ2LMu3TyJgTqteLwLqxGgHNtVFuvsZ7jyJjahwUgv0IVsAk4tjAcxy9Y16LXNpf9hsxPjq9Jxuff/HX3qbQv352EygVgYTcDDeu54K6oEhNNhzZsopcGeRalgmxcAe6u1LMVxOwGNvBggZ4oWoupubhn9lekAwatBlui69zUI018c/MTEA8smOCUCI5CwrtuouWZ4JdtucQSYV8hPbQ+9zn+6rxoT1f6QilnEybWD9/6iJyWm6pcmQ4z+FxFEb5tTWF4hcv8V6n9hrb2GRJ8STjbSewoThIyAJ5/g/b/R5lmN1plKbfFozYlFUB+vINmiYWUFYywW7qJLRSf5om1vGS27WAYXa2rtCETAxGFpgUVhtI6q0p0n7y7w45jU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7971E1A75EF21A47AEFAD857314113E5@namprd20.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: tennantco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79eebff3-9fbd-4b38-2d9c-08d6cfcb782b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 13:30:12.6594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 854ee4fb-bf50-420c-8a26-5b96d626ac37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR20MB1159
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

VGhlIDA1LzAyLzIwMTkgMjI6NTUsIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KPiA+ICogSSBk
b24ndCB0aGluayBwY2YyMTIzX3JlYWRfb2Zmc2V0IGlzIHdvcmtpbmcgY29ycmVjdGx5LiBJbiB0
aGUgY2FzZSBvZg0KPiA+ICAgYSBjb2Fyc2Ugb2Zmc2V0IHRoZSB2YWx1ZSBpcyBub3QgYmVpbmcg
c2lnbiBleHRlbmRlZC4gU28gYSBuZWdhdGl2ZQ0KPiA+ICAgb2Zmc2V0IHJlYWQgd2lsbCBub3Qg
YmUgY29ycmVjdCBpZiB0aGUgY29hcnNlIGJpdCBpcyBzZXQgKHJlc3VsdCB3b3VsZA0KPiA+ICAg
YmUgYSBwb3NpdGl2ZSBudW1iZXIgYmVpbmcgcmV0dXJuZWQgaWYgdGhpcyBpcyB0cnVlKS4gSSBu
ZWVkIHRvIGxvb2sNCj4gPiAgIGludG8gdGhpcyBzb21lIG1vcmUuIFRoZSBmaXggd291bGQgYmUg
dG8gc2lnbiBleHRlbmQgZmlyc3QsIHRoZW4gaWYNCj4gPiAgIGNvYXJzZSBiaXQgaXMgc2V0IG11
bHRpcGx5IHRoZSByZXN1bHQgYnkgMi4NCj4gPiANCj4gDQo+IEFzIHRoZSBjb21tZW50IHNheXMs
IGl0IGlzIHByb3Blcmx5IGV4dGVuZGVkIGJlY2F1c2UgYWZ0ZXIgc2hpZnRpbmcsDQo+IGJpdHMg
WzY6MF0gYmVjb21lIGJpdCBbNzoxXS4NCj4gDQpCdXQgd2hhdCBhYm91dCB0aGlzOg0KDQojIGVj
aG8gMjE3MCA+IC9zeXMvY2xhc3MvcnRjL3J0YzAvb2Zmc2V0IA0KIyBjYXQgL3N5cy9jbGFzcy9y
dGMvcnRjMC9vZmZzZXQgDQoyMTcwDQojIGVjaG8gLTIxNzAgPiAvc3lzL2NsYXNzL3J0Yy9ydGMw
L29mZnNldCANCiMgY2F0IC9zeXMvY2xhc3MvcnRjL3J0YzAvb2Zmc2V0IA0KMA0KIyBlY2hvIDQz
NDAgPiAvc3lzL2NsYXNzL3J0Yy9ydGMwL29mZnNldCANCiMgY2F0IC9zeXMvY2xhc3MvcnRjL3J0
YzAvb2Zmc2V0IA0KNDM0MA0KIyBlY2hvIC00MzQwID4gL3N5cy9jbGFzcy9ydGMvcnRjMC9vZmZz
ZXQgDQojIGNhdCAvc3lzL2NsYXNzL3J0Yy9ydGMwL29mZnNldCANCi0yMTcwDQoNCk5lZ2F0aXZl
IG9mZnNldCByZWFkcyBzZWVtIHRvIGJlIG9mZiBieSBhIGZhY3RvciBvZiAyLg0KDQoNCi0tIA0K
RHlsYW4NCg==
