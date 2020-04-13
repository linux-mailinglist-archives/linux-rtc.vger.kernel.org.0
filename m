Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337A21A644C
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Apr 2020 10:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgDMIuH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Apr 2020 04:50:07 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:1512 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbgDMIuG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Apr 2020 04:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1586767805; x=1618303805;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=g+BoujTaXmL7RzkQF/U6ORkv3elN4x17pBJHtsOnGzU=;
  b=NPGgG2xCd+QXmfNOcJ+oLMeyOfo/mJjKuhDXiiUfzztbXj4oXlzcLrR0
   TasTefKl/IxOk6UgLptYSd/LhXCi+Lq3ClYSIVGIlst5vNRxK9YsUPzSF
   ZX8Cmxcv7JWGIeUFqfZKpWElkNbHwYym0GxS6jEYikxmoWqAuySVTZDjK
   Cv08g/hSR+HnC/KlraVIW8kg38Rmoj6i6hDjSYlvM5FBbkSWNIbCWHXHO
   hu99jasCRu+yeaO1VPhmMuGd6+EeOrQ/g5Dr7pPhtj7hzm44lD5+2hr4e
   18pOFOIQyBPFFDhR73eyHnyBagu4bZMwaaudo+7pD4oXbg+4bg3mYsjbq
   Q==;
IronPort-SDR: P41cqiYl6gAUK91I29g2Wc0yXqRMrzS1+7Qot+C9rKXm0JtGr0RzjOHyHqMdPMnp7w8EvEB6GH
 A1Pd/VpvzcgPbLPWWDG6OxfQQWP8CRUM/yovCT781hBOw3bLGEkc1dgwtaFAwEau9SBcbdTvvk
 riNMMnr7+rdqy+1tknbXkun1z+ynPQXDwUE2Y6a/K/YviirCGpeybrUDH4nurAyLGq9gaIAPh7
 Z1n2veH9YyBFh5L8ssX0CbBajjPzx7UWeVLzBleP/gG9vqi/uZyStZ5I0QwAHUlNYj+CWVSk6i
 feg=
X-IronPort-AV: E=Sophos;i="5.72,378,1580799600"; 
   d="scan'208";a="72004610"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2020 01:50:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 13 Apr 2020 01:49:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 13 Apr 2020 01:49:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cf+/UBwgcK32A9OjeUN/QBKAPt0s0s4CnzEZ2wD9IPGWF/64D1pb84qRIaOKBrrl9Vi16WGjbP7rJFlCwlJiuAqWE7Jet2oQUjFsNHA4EDpFW7j924HyHNVjS+9uzfdwjdjb6bLDnO4pE1TViNuY0MFEBiO6qN9yP83pjcxZ2WhHS6HFzMYHD4IVPDELN04nXSn3AEsoNdwfpFA0S+p4SJBp2Byygpf+ahxHsAAdXim3qe2yEkFjRzeh4InipvIhW+IZJtlcGQSuf2C4yh+FKbB0CYTRhtBomNhxtk8UBFvMrcWBsDv4sg1BCatUbEfjjXc5hO44HA7wdn0v4UYwEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+BoujTaXmL7RzkQF/U6ORkv3elN4x17pBJHtsOnGzU=;
 b=ADIglFXf3K6+X1nxUTWR6gLEZNpG3+POCsACDdF3qqXG6FdR8jYfmudrUFX9JfXOQ4JTsZfwn/B1i9quIP3SlwDsdgPMGvlKbMKBoO+CXdnCSYnw0qsCVLwSSOKGVQn/Kaf4Iyd8gM43AxNAxXmvNaDIiANbNErBadRhyExe3A6p/qdpLNEhOl/xZW/nZozYMFugFtk4FDMOfoaDEMUmAv/+FlkhS3S9YSL3GLPEDBeB9tzzYgItnW4SBTmiR5XWUWcAhpB1brpyUWm2tB83UEy+QvuJUy/ml+ztXtwXqOJp3wSLo/UPQu3svMag9KMQTjiZ+dOYKIo+qUns220pkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+BoujTaXmL7RzkQF/U6ORkv3elN4x17pBJHtsOnGzU=;
 b=vewzA0YKLw9dmCANYdvTeieUgfh9J94A4tfEBFUVB1a00tEI+KMn5tUGDncqtLMIH8Po0qK/ey/d2d3HE6dnD4iFuY7DYJmuyFvxratbc4Y3DSjf+DBNsQfLt1C17YqLCTgY+FADeu/FNSAhXBmbrWaQ32HNuLDJohNjlhfsQbY=
Received: from DM6PR11MB3420.namprd11.prod.outlook.com (2603:10b6:5:69::31) by
 DM6PR11MB4010.namprd11.prod.outlook.com (2603:10b6:5:194::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.26; Mon, 13 Apr 2020 08:50:02 +0000
Received: from DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::91cb:6555:db9b:53fa]) by DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::91cb:6555:db9b:53fa%7]) with mapi id 15.20.2900.026; Mon, 13 Apr 2020
 08:50:02 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <alexandre.belloni@bootlin.com>
CC:     <mark.rutland@arm.com>, <a.zummo@towertech.it>,
        <jason@lakedaemon.net>, <devicetree@vger.kernel.org>,
        <maz@kernel.org>, <linux-kernel@vger.kernel.org>,
        <Ludovic.Desroches@microchip.com>, <robh+dt@kernel.org>,
        <tglx@linutronix.de>, <linux-arm-kernel@lists.infradead.org>,
        <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 5/5] rtc: at91sam9: add microchip,sam9x60-rtt
Thread-Topic: [PATCH 5/5] rtc: at91sam9: add microchip,sam9x60-rtt
Thread-Index: AQHWEXCCLb5+HJo6A0Cdc6S18/omnA==
Date:   Mon, 13 Apr 2020 08:50:02 +0000
Message-ID: <fa6366a0-e1a7-a7b3-e743-2517437b2b3d@microchip.com>
References: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
 <1586536019-12348-6-git-send-email-claudiu.beznea@microchip.com>
 <20200410174113.GZ3628@piout.net>
In-Reply-To: <20200410174113.GZ3628@piout.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Claudiu.Beznea@microchip.com; 
x-originating-ip: [86.120.235.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d81bfa62-36bc-4013-8fc5-08d7df87a7ed
x-ms-traffictypediagnostic: DM6PR11MB4010:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB40105475D43A95333EC18FAA87DD0@DM6PR11MB4010.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 037291602B
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(396003)(376002)(346002)(136003)(39860400002)(366004)(7416002)(36756003)(66946007)(26005)(2906002)(66446008)(64756008)(66556008)(66476007)(76116006)(91956017)(6512007)(6506007)(478600001)(53546011)(54906003)(316002)(966005)(2616005)(8936002)(8676002)(6486002)(86362001)(31696002)(31686004)(6916009)(5660300002)(186003)(81156014)(4326008)(71200400001)(142933001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vUr0lYDSLZykIq9gZ+MBtT921bpofV0CXnv3EA7LOYLnKvASu6spwMTBxWDNzXzPROijD2bGLplHXX3SdzJ1uf3xzz7ApbunBNfZRUDHf+B3ylpNkuHOEGg1u07ZtVjMFWGg4UOnpKELkGqoBLFDDdTJKvbJlgkMMPoZU075ZZxG5joT5XjuYmcG7sjz9vAyKEAPj8QTjgK2fZmIEGj9HdX4FsaGrFwbuUrkoSyDOi6gwtHSbqObCOUmN/DEcKqBguGTNnT/MmFJCM/br+oL952TrUJc5PF5T2YJ+ZXtBf+Qh3XufbU/KnsXXqumlcuWTk5C7UQ5/Aix9mv824cbjJ14deX42NPlUJOyPwBupeCG9il8WOtrUyc5JzKbu5tVfgvXiIOD7nPI3rFQv7JS/z5VKQQIOsij/AV+KfXqozDZzfZHlj/oaogT3sPaiuPTDByTVITSwc3kU+XLU1cH9n90CjVxlfjXPLASr0p5PYkKajKg8yYCnPLGOTbp0HNi88KFrlMma4Ib9Q38ZqpAcY3QhhFAmAkh/KIlUP7RIfet40ZZbDjL2pb8HKGQQrsh
x-ms-exchange-antispam-messagedata: b1leqvzIdNAeqYVDCtq3deH8G72YtkDNz+MyBD81ydV6rcCkg2SrIfVpgXw8+Czdd47Z2/PLqIOnjYIchVOWM8VKzAGcj50L1KvnXezBBHK86YkEY5II805qy+rhCDgkgeZmEMNvsLxECkyo6+Ue4A==
Content-Type: text/plain; charset="utf-8"
Content-ID: <C63CEFED00853941AA35BEDE6178E5F9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d81bfa62-36bc-4013-8fc5-08d7df87a7ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2020 08:50:02.6028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yut3OV/q9lD+Fea4eQS2FhEDnR4viRDud4gIhTZDKivZie13svHOjs/WP8t3gcDjqp27ZI96D6SUwXEooHj7xORKyvVdZiV5Nl5hsgUBFOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4010
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

DQoNCk9uIDEwLjA0LjIwMjAgMjA6NDEsIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KPiBFWFRF
Uk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpLA0KPiANCj4gVGhpcyBwYXRj
aCBtdXN0IGNvbWUgZmlyc3QuDQoNCk9LIQ0KDQogQWxzbywgdGhlIGNvcnJlY3QgcHJlZml4IGlz
DQo+IGR0LWJpbmRpbmdzOiBydGM6DQoNCk9LISBJIHVzZWQgdGhlIHByZWZpeCB0aGF0IHdhcyBw
cmV2aW91c2x5IHVzZWQuDQoNCj4gDQo+IE9uIDEwLzA0LzIwMjAgMTk6MjY6NTkrMDMwMCwgQ2xh
dWRpdSBCZXpuZWEgd3JvdGU6DQo+PiBBZGQgbWljcm9jaGlwLHNhbTl4NjAtcnR0IHRvIGNvbXBh
dGlibGUgbGlzdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRp
dS5iZXpuZWFAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9ydGMvYXRtZWwsYXQ5MXNhbTktcnRjLnR4dCB8IDIgKy0NCj4+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9hdG1lbCxhdDkxc2Ft
OS1ydGMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9hdG1lbCxh
dDkxc2FtOS1ydGMudHh0DQo+PiBpbmRleCA2YWU3OWQxODQzZjMuLmIyZjkxM2ZmNmM2OSAxMDA2
NDQNCj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvYXRtZWws
YXQ5MXNhbTktcnRjLnR4dA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3J0Yy9hdG1lbCxhdDkxc2FtOS1ydGMudHh0DQo+PiBAQCAtMSw3ICsxLDcgQEANCj4+ICBB
dG1lbCBBVDkxU0FNOTI2MCBSZWFsIFRpbWUgVGltZXINCj4+DQo+PiAgUmVxdWlyZWQgcHJvcGVy
dGllczoNCj4+IC0tIGNvbXBhdGlibGU6IHNob3VsZCBiZTogImF0bWVsLGF0OTFzYW05MjYwLXJ0
dCINCj4+ICstIGNvbXBhdGlibGU6IHNob3VsZCBiZTogImF0bWVsLGF0OTFzYW05MjYwLXJ0dCIg
b3IgIm1pY3JvY2hpcCxzYW05eDYwLXJ0dCINCj4gDQo+IElmIHlvdSBoYWQgYSBmYWxsYmFjayBv
biBhdG1lbCxhdDkxc2FtOTI2MC1ydHQsIHRoaXMgd291bGQgbWFrZSBtZXJnaW5nDQo+IHRoaXMg
c2VyaWVzIGVhc2llciBhcyB0aGlzIHJlbW92ZXMgdGhlIG5lZWQgZm9yIDEvNSBhbmQgMi81Lg0K
DQpUaGU6DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLWF0bWVsLWFpYzUuYw0K
Yi9kcml2ZXJzL2lycWNoaXAvaXJxLWF0bWVsLWFpYzUuYw0KaW5kZXggMjkzMzM0OTdiYTEwLi43
NGE2NmNkMDU1NTMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLWF0bWVsLWFpYzUu
Yw0KKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1hdG1lbC1haWM1LmMNCkBAIC0zMTAsMTAgKzMx
MCwxNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2FtYTVkM19haWNfaXJxX2ZpeHVwKHZvaWQpDQog
CWFpY19jb21tb25fcnRjX2lycV9maXh1cCgpOw0KIH0NCg0KK3N0YXRpYyB2b2lkIF9faW5pdCBz
YW05eDYwX2FpY19pcnFfZml4dXAodm9pZCkNCit7DQorCWFpY19jb21tb25fcnRjX2lycV9maXh1
cCgpOw0KKwlhaWNfY29tbW9uX3J0dF9pcnFfZml4dXAoKTsNCit9DQorDQogc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgYWljNV9pcnFfZml4dXBzW10gX19pbml0Y29uc3QgPSB7DQog
CXsgLmNvbXBhdGlibGUgPSAiYXRtZWwsc2FtYTVkMyIsIC5kYXRhID0gc2FtYTVkM19haWNfaXJx
X2ZpeHVwIH0sDQogCXsgLmNvbXBhdGlibGUgPSAiYXRtZWwsc2FtYTVkNCIsIC5kYXRhID0gc2Ft
YTVkM19haWNfaXJxX2ZpeHVwIH0sDQotCXsgLmNvbXBhdGlibGUgPSAibWljcm9jaGlwLHNhbTl4
NjAiLCAuZGF0YSA9IHNhbWE1ZDNfYWljX2lycV9maXh1cCB9LA0KKwl7IC5jb21wYXRpYmxlID0g
Im1pY3JvY2hpcCxzYW05eDYwIiwgLmRhdGEgPSBzYW05eDYwX2FpY19pcnFfZml4dXAgfSwNCiAJ
eyAvKiBzZW50aW5lbCAqLyB9LA0KIH07DQoNCnBhcnQgb2YgMS81IGlzIHN0aWxsIG5lY2Vzc2Fy
eS4NCg0KUmVnYXJkaW5nIHRoZSBmYWxsYmFjayB0byAiYXRtZWwsYXQ5MXNhbTkyNjAtcnR0IiBJ
IGFtIGF3YXJlIG9mIHRoYXQuIEkNCmNob3NlIHRoaXMgYXBwcm9hY2ggYmVjYXVzZSB0aGlzIElQ
IGlzIGEgYml0IGRpZmZlcmVudCB0aGFuIHRoZSBvbmUgd2l0aA0KImF0bWVsLGF0OTFzYW05MjYw
LXJ0dCIgY29tcGF0aWJsZSwgbWVhbmluZyBpdCBoYXMgYSBmZWF0dXJlcyB0aGF0IHRoZSBvbGQN
Cm9uZSBoYXMgbm90LiBJJ20gdGFsa2luZyBhYm91dCBbMV0gd2hpY2ggSSBjYW5ub3Qgc2VlIG9u
IGEgU0FNOUc0NSBbMl0NCndoZXJlIFJUVCBJUCB1c2VzICJhdG1lbCxhdDkxc2FtOTI2MC1ydHQi
IGFzIGNvbXBhdGlibGUuDQoNCklzIHRydWUgaXQgbWF5IGJlIG5lY2Vzc2FyeSBpbiB0aGUgZnV0
dXJlIHdoZW4gbmV3IGZlYXR1cmVzIG1heSBiZQ0KaW1wbGVtZW50ZWQuIFRha2luZyB0aGlzIGlu
dG8gYWNjb3VudCwgd291bGQgeW91IGxpa2UgdG8gZ2V0IHJpZCBvZiB0aGUgbmV3DQpjb21wYXRp
YmxlIGluIGNvZGUgYW5kIGtlZXAgaXQgb25seSBpbiBkZXZpY2UgdHJlZT8NCg0KWzFdDQpodHRw
Oi8vd3cxLm1pY3JvY2hpcC5jb20vZG93bmxvYWRzL2VuL0RldmljZURvYy9TQU05WDYwLURhdGEt
U2hlZXQtRFM2MDAwMTU3OUIucGRmI19PUEVOVE9QSUNfVE9DX1BST0NFU1NJTkdfZDEzN2U2NDUw
Mg0KWzJdDQpodHRwOi8vd3cxLm1pY3JvY2hpcC5jb20vZG93bmxvYWRzL2VuL0RldmljZURvYy9B
dG1lbC02NDM4LTMyLWJpdC1BUk05MjYtRW1iZWRkZWQtTWljcm9wcm9jZXNzb3ItU0FNOUc0NV9E
YXRhc2hlZXQucGRmDQoNCj4gDQo+IEkgdGhpbmsgMi81IG1heSBiZSB1c2VmdWwgaW4gdGhlIGZ1
dHVyZSBidXQgYXMgZmFyIGFzIHRoZSBhaWMgZml4dXANCj4gaXMgY29uY2VybmVkLCBib3RoIElQ
cyBhcmUgaWRlbnRpY2FsLg0KPiANCj4+ICAtIHJlZzogc2hvdWxkIGVuY29kZSB0aGUgbWVtb3J5
IHJlZ2lvbiBvZiB0aGUgUlRUIGNvbnRyb2xsZXINCj4+ICAtIGludGVycnVwdHM6IHJ0dCBhbGFy
bS9ldmVudCBpbnRlcnJ1cHQNCj4+ICAtIGNsb2Nrczogc2hvdWxkIGNvbnRhaW4gdGhlIDMyIEtI
eiBzbG93IGNsayB0aGF0IHdpbGwgZHJpdmUgdGhlIFJUVCBibG9jay4NCj4+IC0tDQo+PiAyLjcu
NA0KPj4NCj4gDQo+IC0tDQo+IEFsZXhhbmRyZSBCZWxsb25pLCBCb290bGluDQo+IEVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KPiAN
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gbGlu
dXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnDQo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYXJtLWtlcm5lbA0KPiA=
