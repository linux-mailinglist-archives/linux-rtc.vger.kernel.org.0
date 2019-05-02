Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB8DD12149
	for <lists+linux-rtc@lfdr.de>; Thu,  2 May 2019 19:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbfEBRwr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 May 2019 13:52:47 -0400
Received: from esa1.tennantco.iphmx.com ([68.232.153.187]:60216 "EHLO
        esa1.tennantco.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfEBRwq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 May 2019 13:52:46 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Thu, 02 May 2019 13:52:45 EDT
IronPort-PHdr: =?us-ascii?q?9a23=3AfBkR6hIaOiW+F/ISjdmcpTZWNBhigK39O0sv0r?=
 =?us-ascii?q?FitYgXKvTzrarrMEGX3/hxlliBBdydt6sdzbSH+Pm5BiQp2tWoiDg6aptCVh?=
 =?us-ascii?q?sI2409vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFR?=
 =?us-ascii?q?rhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTagfL9+NhS7oAHeusULnIdvKLs6xw?=
 =?us-ascii?q?fUrHdPZ+lY335jK0iJnxb76Mew/Zpj/DpVtvk86cNOUrj0crohQ7BAAzsoL2?=
 =?us-ascii?q?465MvwtRneVgSP/WcTUn8XkhVTHQfI6gzxU4rrvSv7sup93zSaPdHzQLspVz?=
 =?us-ascii?q?mu87tnRRn1gyocKTU37H/YhdBxjKJDoRKuuRp/w5LPYIqIMPZyZ77Rcc8GSW?=
 =?us-ascii?q?ZEWMtaSi5PDZ6mb4YXD+QPI/tWr5XzqVUNoxuxBwisC//gxDBHnXL2wbY13v?=
 =?us-ascii?q?49HQ3awAAtHdQDu2nUotXvM6cSVPi4wqfIzDXHdfxW3yr25orPchEvv/6NXa?=
 =?us-ascii?q?97fM3fx0gvEwPKlFOQpZbnMTOS2OUCrWia4vF8Ve2xjW4nrRt+oj6zxsgwjY?=
 =?us-ascii?q?nFnJ4aylfB9Shgxos+ON62SFZjbNK5DJdduDuWOoR0T884Q2xkpDw2x70ItJ?=
 =?us-ascii?q?KjYSQHzJcqywTBZ/CbfIWE+BzuWeiLLTtmmH5pZKqzhxis/kWj1uHxU8y53V?=
 =?us-ascii?q?dXoSVZltTBs20C2ALN5cWJT/Zy4Fqu1iqT2w3W8O5JI1s7mrTdJpU82LA/jI?=
 =?us-ascii?q?ATvl7GHiLunUX2i7KZeVs89+iz7uTnfq3mppiBN49okg3+Mrohmsi4AekgKg?=
 =?us-ascii?q?YDQ2+V9fi82bH64ED2QqtGguQxkqbCrp/WP8MbprOlAwBO1YYj9hC/ACq83N?=
 =?us-ascii?q?QAh3kHK05FdwybgIj1OlHOJ/b4Ae24g1SxjDdrw/fGPrriApnXMnfDl7Lhca?=
 =?us-ascii?q?58605a1gUz0chS649IBrwOOv7+VU38uMbYAxMlKQC5w+jqBM141owEWGKPBq?=
 =?us-ascii?q?GZMLnVsV+N/u8hLemNZIsPtzb7MfQr5fnujHEnll4dZqSpwYUYaHa+Hvt8JU?=
 =?us-ascii?q?WZfWbjgtAbHWgWuQo+SfTmiEeeXj5Le3ayQ6U86ykhB4KiE4jCSZqigLqc0y?=
 =?us-ascii?q?ehAJJafHtJBU6IEXfscIWEXfYMZTmJLc9mlTwESbyhS44n1R20qAD6zL9nJP?=
 =?us-ascii?q?LO+iIErZLjyMR15+rLmB4o7zB1Dtmd02SIT2FzhW4IWzg23a5hrkxn1leMz7?=
 =?us-ascii?q?R3g/xCGdxS+/NDSh06OoLEz+xmF9DyXRrMftOISFagX9WnDig9Tsgtw9ASeE?=
 =?us-ascii?q?t9BdqigQ7Z3yawAL8aiaaLBJoq/aLYxXTxINx9y3mVnJUm2nAiT9tGM2G8i+?=
 =?us-ascii?q?ZV+gzXAIjI2xGQk6u6fKIQxiOL/mqHyW2IvWlSVwlsVaTDG3sYYx2Fg87+4x?=
 =?us-ascii?q?buXrunD/wHNRRM2IbWBrpOY9uvrVJZSebLJNnYZWu3h2y3Qx2Pw+XfP8LRZ2?=
 =?us-ascii?q?wB0XCFWwA/mAcJ8CPDbFBmXH3zqn/CDDFoCVPkal/t9u87sn6gU0so1F/aPV?=
 =?us-ascii?q?Z52e+z/RgYzbyHRvUf06hMmR9pqi48XTPfl8nTF8LGogNgeKtGZtZozEZD3G?=
 =?us-ascii?q?SflwtiM42IM61kgFcYbw9w+Ujp0kY/Bw=3D=3D?=
X-IPAS-Result: =?us-ascii?q?A2HlDABqLMtc/zUyL2hlg1VQW4EGBAsoCoQGg0cDhTGJU?=
 =?us-ascii?q?Zs7gRADGDwPAS0CgUmCdQIXhkA4EwEDAQEBBAEBAQECAQECaRwMgjopAWE5M?=
 =?us-ascii?q?gEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQUCODkCAQMSE?=
 =?us-ascii?q?REMAQERJgEPAgEIGgIFIQICAg0jFRACBA4nhGsDHQGiDD0CYgILgQEpiF9xg?=
 =?us-ascii?q?S+CeQEBBYUCGFKBPAmBCyeNIz+EIz6ELYMhMoImjU2ZWwcCggtWkV4ngg6KJ?=
 =?us-ascii?q?4kMoHkCBAIEBQIOAQEFgWYigVYzGiODPIV+ilNAATGBKZITAYEgAQE?=
X-IronPort-AV: E=Sophos;i="5.60,422,1549951200"; 
   d="scan'208";a="14444973"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from mail-by2nam05lp2053.outbound.protection.outlook.com (HELO NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.53])
  by ob1.tennantco.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 May 2019 12:45:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tennantco.onmicrosoft.com; s=selector1-tennantco-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lfn75GQRECQiUyuK82L3I38YksWE1DIFCndG0OhYCwQ=;
 b=n7xvOq6ThY+5PaQqlpeQ2at6/gDs3Rcdwa+nMEPbOiV20ShPP0FNjxxTt23NQzJnT4CgWbXWp3DPR7I6rvGW83e/luE5nmy/qrIYWAxuQegPAKVRwlzkRHpv6zYRK32M445uhv0TDYmyTLHhoik5HrBR53sMJmaG26fJPug9JfQ=
Received: from CY4PR20MB1381.namprd20.prod.outlook.com (10.173.111.8) by
 CY4PR20MB1256.namprd20.prod.outlook.com (10.173.113.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Thu, 2 May 2019 17:45:24 +0000
Received: from CY4PR20MB1381.namprd20.prod.outlook.com
 ([fe80::6dc9:dee3:edc0:a7be]) by CY4PR20MB1381.namprd20.prod.outlook.com
 ([fe80::6dc9:dee3:edc0:a7be%4]) with mapi id 15.20.1856.008; Thu, 2 May 2019
 17:45:24 +0000
From:   Dylan Howey <Dylan.Howey@tennantco.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 1/2] Port rtc-pcf2123 to regmap
Thread-Topic: [PATCH 1/2] Port rtc-pcf2123 to regmap
Thread-Index: AQHU/GdxJRWxL7Stt0KuQz+yj2UEMaZP+a8AgAL0soCAAYVnAIADsQaA
Date:   Thu, 2 May 2019 17:45:24 +0000
Message-ID: <20190502174518.GA12323@tennantco.com>
References: <20190426193648.1599-1-Dylan.Howey@tennantco.com>
 <20190427130054.GY14604@piout.net> <20190429150913.GA15052@tennantco.com>
 <20190430092256.GC11339@piout.net>
In-Reply-To: <20190430092256.GC11339@piout.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:208:d4::24) To CY4PR20MB1381.namprd20.prod.outlook.com
 (2603:10b6:903:8d::8)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Dylan.Howey@tennantco.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [198.204.33.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d02003f1-26f7-4ea5-c2c0-08d6cf25f44a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:CY4PR20MB1256;
x-ms-traffictypediagnostic: CY4PR20MB1256:
x-microsoft-antispam-prvs: <CY4PR20MB125617897872E7FCF64B34ABEF340@CY4PR20MB1256.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39850400004)(366004)(396003)(136003)(376002)(189003)(199004)(2616005)(256004)(446003)(229853002)(14444005)(476003)(11346002)(486006)(6246003)(7736002)(4326008)(6436002)(6486002)(478600001)(72206003)(305945005)(25786009)(8936002)(33656002)(8676002)(81156014)(81166006)(66066001)(102836004)(6116002)(6512007)(53936002)(6916009)(5660300002)(3846002)(26005)(68736007)(54906003)(316002)(36756003)(66946007)(186003)(73956011)(2906002)(66446008)(64756008)(66556008)(66476007)(6506007)(386003)(76176011)(14454004)(99286004)(52116002)(71200400001)(71190400001)(86362001)(1076003);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR20MB1256;H:CY4PR20MB1381.namprd20.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: tennantco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mER6OnNpdgQWk0dnobRzPrLEZjWsGyrZed3G1MOwJ+lNH3xCb9t69HI1In2LMOCFcQf8ijE2ahQTODw9WUajJJx9hu1hlSVXHK7ZQYSCtLZe0qE3LCzeQRugsh/B7UatWpEHTLTlUh3lMbC05beatIKBYd0Sr4M9o3EMcmGCAMYoUBemnQKiPlnzt4YK92d6IN77savs5SD8TeSOgJ8FimZ0w1c9Lcj8K+xCSRVfmuKzH8HLOvM/tzwUZAQXXvbkwQ55q9y0U+g+ZH2iLc0GFmWQVjV/OzYzEby3KHwh4IyGpWxhvFYD1VAGeFqVnddCxxrAPHYkoaTjdpfvdfxBMbx4wMBybn3TvGKxe+Cvasm1AcNr3ISHiGoEf4geD+geWKF9A7EUf6qQ0g/rXhnDdvEgaaKDwen0myEGxNYYw5o=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBBB2D76F81D4A44919005F8BA6AA33C@namprd20.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: tennantco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02003f1-26f7-4ea5-c2c0-08d6cf25f44a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 17:45:24.2496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 854ee4fb-bf50-420c-8a26-5b96d626ac37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR20MB1256
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

QXMgSSdtIHdvcmtpbmcgb24gdGhpcyBJJ3ZlIHJ1biBhY3Jvc3Mgc29tZSBvdGhlciBpc3N1ZXM6
DQoNCiogRHJpdmVyIGRvZXMgbm90IGRvIGEgc29mdHdhcmUgcmVzZXQgb24gaW5pdC4gRGF0YXNo
ZWV0IHJlY29tbWVuZHMgZG9pbmcNCiAgdGhpcyBhcyB0aGlzIHdpbGwgY2xlYXIgYW55IGludGVy
cnVwdHMgYW5kIGFsYXJtIGZsYWdzLiBUaGUgZml4IHdvdWxkDQogIHByZXN1bWFibHkgYmUgdG8g
YWRkIGEgY2FsbCB0byBwY2YyMTIzX3Jlc2V0IGluIHRoZSBpbml0LCBidXQuLi4NCg0KKiBwY2Yy
MTIzX3Jlc2V0IHN0b3BzIHRoZSBSVEMgZm9yIG5vIGFwcGFyZW50IHJlYXNvbi4gUmVzdWx0IGlz
IHRoYXQgdGhlDQogIHRpbWUgaXMgaW52YWxpZCBhZnRlciBhIGNhbGwgdG8gcGNmMjEyM19yZXNl
dCwgd2hpY2ggcmVxdWlyZXMgdGhlIHRpbWUNCiAgdG8gYmUgc2V0IGFnYWluIG1hbnVhbGx5LiBU
aGUgZml4IHdvdWxkIGJlIHRvIGRlbGV0ZSB0aGUgc3RvcCBjb21tYW5kcy4NCg0KKiBJIGRvbid0
IHRoaW5rIHBjZjIxMjNfcmVhZF9vZmZzZXQgaXMgd29ya2luZyBjb3JyZWN0bHkuIEluIHRoZSBj
YXNlIG9mDQogIGEgY29hcnNlIG9mZnNldCB0aGUgdmFsdWUgaXMgbm90IGJlaW5nIHNpZ24gZXh0
ZW5kZWQuIFNvIGEgbmVnYXRpdmUNCiAgb2Zmc2V0IHJlYWQgd2lsbCBub3QgYmUgY29ycmVjdCBp
ZiB0aGUgY29hcnNlIGJpdCBpcyBzZXQgKHJlc3VsdCB3b3VsZA0KICBiZSBhIHBvc2l0aXZlIG51
bWJlciBiZWluZyByZXR1cm5lZCBpZiB0aGlzIGlzIHRydWUpLiBJIG5lZWQgdG8gbG9vaw0KICBp
bnRvIHRoaXMgc29tZSBtb3JlLiBUaGUgZml4IHdvdWxkIGJlIHRvIHNpZ24gZXh0ZW5kIGZpcnN0
LCB0aGVuIGlmDQogIGNvYXJzZSBiaXQgaXMgc2V0IG11bHRpcGx5IHRoZSByZXN1bHQgYnkgMi4N
Cg0KTm90IHN1cmUgaWYgSSdsbCBmaXggdGhlc2UgaXNzdWVzIHJpZ2h0IG5vdy4gQWxzbyB0aGlz
IFJUQyBkb2VzIGhhdmUgdGhlIA0KYWJpbGl0eSB0byBkbyBwZXJpb2RpYyBpbnRlcnJ1cHRzIGJ1
dCB0aGUgZmVhdHVyZSBoYXMgbm90IGJlZW4gaW1wbGVtZW50ZWQNCmluIHRoaXMgZHJpdmVyLiBT
byBJJ2xsIGxlYXZlIHVpZV91bnN1cHBvcnRlZCBzZXQgZm9yIG5vdy4NCg0KLS0gDQpEeWxhbg0K
