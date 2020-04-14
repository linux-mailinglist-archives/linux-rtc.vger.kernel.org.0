Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1CCB1A7BB7
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2020 15:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730185AbgDNNFQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Apr 2020 09:05:16 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:24821 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502545AbgDNNFK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Apr 2020 09:05:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1586869509; x=1618405509;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=z1sW6sRKIfZdG/DqO3/mKHPg+dh3EuVMiCHHmb4e78g=;
  b=kF33TklyNaHGEm6Y+5Le/ADjSpq+n6wi5zDlZvIQSgbBORkffysoL2q0
   gbINiqgRbjkmj4fSXA083hQIyVxqOE7sNK2kXLQb63iBpfkAtywVIabKT
   tHts91TsAZpfY3usfuOqtXMxDk+vnQvsMIuG37eiVSX4en9k8VChg/Kva
   43VBoGu4dCY8wRB+nEcHKQArGSpOYl/7SDbE7s5jVGnH2z3vW5fbqDQQ3
   EEYP84v7nJyHkXy/jipz7s6VQq2ArOrCdhY2z6wgWkaymfGRJx8QnpuXB
   L7/LDqBse00P89s32DDlVcS42xOBIryMAtXBrpadrBTkgRTQ/w9qcc4ni
   A==;
IronPort-SDR: DUYKubzgYvEF+5mLwd1WHWzR0cwvcsvFqiTxZJjybLGYiQmxGA2BrK0qgfYroS0lyusFq7KLB6
 zUyK9PwjQLNSHBJxgsSeBdFgUk8Jo57tJD5CdfVdQ87Ac7R655pUdU53J88OQcNmTP/1uTG/Fv
 SRpZYQQtlFAqWZgKVk1ulLwtkOG9ba1hgZV8OA2XqKaAmAOkAkk+owiwntMvpE2/ZIWfB5JZK2
 BAdrhj2sZLjWkjlnlFKEIBOdF7csL5OKVm666UW7HwFgSa5Xqomi8Bd2M9ukXIXH24+IhUV9BI
 eUk=
X-IronPort-AV: E=Sophos;i="5.72,382,1580799600"; 
   d="scan'208";a="70269006"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Apr 2020 06:05:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 14 Apr 2020 06:05:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 14 Apr 2020 06:05:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uzk7eMzQFms44MT0n/NpUC/+PoE6BORzrc8h3v3CMgRHzN0SNpo1U8Tm0t19voNDmujmnk2EoIQJ0aOafvE/g2KfVWV5hmnoxknVmdGIH1b8O3x6Okd4CtAeR+gmvs2/KXQLS4x0fQDXAgfuGyrF6aPNlTu1eTUyvzf68+slHA2hRwr6dbWZ5lXLjrXmJpaU5h2gn2vfqfiQWYayUwXzBWap98CBUFEyXHk81xG8ASymX2EOcWJ5V6ZMJh6pZKOPmRQIxHMfpKRe34RgOZl5JFgQdrSNWClHlmCJoQjxEVUxVJo555ttDu0yph9O7ocAKu7gZj0LiU37YFWSDw2/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1sW6sRKIfZdG/DqO3/mKHPg+dh3EuVMiCHHmb4e78g=;
 b=VeGEzQcnJDDhiKdW+AffwLdXklaO6UwU5q9Re71J9/uFy36DM6zP4KKBoQ73pn6Z38qt8oOYp7b39jUeYXKWwJLRxpWNmibzd6XpYbgffp1/4NxWhwUInBvZIRmxNJlVwVLvJq6GNMK9nV8gFXBruVIDScChMH86XiPXFmXCzuXu5P43TLdSQz9hq3tcf5/QAwVEaURaGYbG9uf13f7E1a3vwPCw2jahlNl8lZSnv996hUwc7eFht00ya5EM0wOSYYHe+i1PJL5mbpFGzmWFKcSxUndAX1TMbXtXtB/mu7O89N3DdLHhyptnj27zpGyT6th3kTrstCAzsWWj4xQApw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1sW6sRKIfZdG/DqO3/mKHPg+dh3EuVMiCHHmb4e78g=;
 b=jn73sKs9h/Pli9/p7hHAab//mlNst1L6i45Tu66oNFeC9B8/vL9OUzuhNg4+VxXCN+umdxmhXhB1/xnqD7EjYpeeaUF7B1hUxm5Ee+e7vS8iqik23JkmrojuZUoEchUg7V/jYiYvN9nuUw1/x87bd690r3sYxJ0CN+GLrp9nzM8=
Received: from DM6PR11MB3420.namprd11.prod.outlook.com (2603:10b6:5:69::31) by
 DM6PR11MB3962.namprd11.prod.outlook.com (2603:10b6:5:192::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.26; Tue, 14 Apr 2020 13:05:03 +0000
Received: from DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::91cb:6555:db9b:53fa]) by DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::91cb:6555:db9b:53fa%7]) with mapi id 15.20.2900.028; Tue, 14 Apr 2020
 13:05:03 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <alexandre.belloni@bootlin.com>
CC:     <a.zummo@towertech.it>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <Nicolas.Ferre@microchip.com>,
        <Ludovic.Desroches@microchip.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <maz@kernel.org>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] ARM: dts: sam9x60: add rtt
Thread-Topic: [PATCH 4/5] ARM: dts: sam9x60: add rtt
Thread-Index: AQHWEXCuyP8yxRbKYUqiuXPeALwxyw==
Date:   Tue, 14 Apr 2020 13:05:03 +0000
Message-ID: <ae278226-7616-5306-a8b5-3f937aa6b322@microchip.com>
References: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
 <1586536019-12348-5-git-send-email-claudiu.beznea@microchip.com>
 <20200410222658.GB3628@piout.net>
 <c4d46198-488b-c5d6-2a66-865a16840dc4@microchip.com>
 <20200413104652.GE3628@piout.net>
 <3116d1fc-af96-1e0c-aa07-3b34cbd58209@microchip.com>
 <20200414111600.GE34509@piout.net>
 <a07d841e-efa9-6c01-69e2-0ed33f9759c5@microchip.com>
 <20200414124741.GJ34509@piout.net>
In-Reply-To: <20200414124741.GJ34509@piout.net>
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
x-ms-office365-filtering-correlation-id: d7737939-4ca9-46f1-5867-08d7e0747216
x-ms-traffictypediagnostic: DM6PR11MB3962:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB39621441B0D53BFA61C3431A87DA0@DM6PR11MB3962.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0373D94D15
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(376002)(346002)(366004)(39850400004)(396003)(136003)(4326008)(316002)(54906003)(8936002)(36756003)(478600001)(86362001)(31696002)(91956017)(71200400001)(2616005)(966005)(81156014)(8676002)(5660300002)(7416002)(6506007)(53546011)(186003)(64756008)(66476007)(26005)(6512007)(6916009)(66556008)(66446008)(66946007)(76116006)(31686004)(6486002)(2906002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RqsAoPtzAPmLc2qK4BLD1k9ZpO6M2rHHzBlKeNCiWQ3Y/0/7oQCmiBIJYjO9S+Fijo23FrqPPlErn4Lv9ec89Be8veZgaeGVy3Qrgi1IkhxVe9Tr8TFkRGerDMVm5i4x55aivqx2hjoZYTG9jnxVCLltoJ2B+GD5JRuGh75KHI3fiBDeajkOyxO96Z0TZUMJQs8xTX0KcXDCPzSjh7D/BXkKuxo/uS83idNWuL7G8rswNjpLbOxnLmKXnhMozzOGi0SlQkoIXS/gUJ/2cz5E3FDBpLmHDhxp6INurYY4BsP28GksnQRP6dZyjpKcwyNVqBSI4IH9s1aPhx2teZ7DaT4DR+eCPRbDSato5M7DaCnd21I95YLskpUWzzuNC22sD3ulhjiS+8D+0B3TozeqE00O+fq1ZBmxQ/GxdusjosS0472+xLp+ZPu+szALIEBSkHlhhPu5+ubSmq6AtVSBlMcg3nFx5tD05nNvEKNsTqcmnZsagywYP/9XlMP0kV/OYYpV4KpKMXR9y1KZZSS50A==
x-ms-exchange-antispam-messagedata: ykRNuuRbD4N1mm2ZNJ4ftKnml+xc0m+4VQo0l+u6k7FfOoUMFq2DTdyP6cF1U3tWdZj/b3XKO6Rb24HQoWMqf7k5z34El7Og9t6Kssm46uGI8klMtLoPBks8oPh7++OREuXI2bhBSVRQEJ8ncVj+bg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <581017C240885A4CB296F260B8203CDB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d7737939-4ca9-46f1-5867-08d7e0747216
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 13:05:03.0160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uiMyjKdkEiu6+bvEYJA260MnIaMNhkA+bxhzzvx5u6UYTK8lQbHBvSFCYajmXXcZ46ruLnFZMCEZoJrdSSA7Qq4/b9tY2pVxNtIZn0uXKCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3962
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

DQoNCk9uIDE0LjA0LjIwMjAgMTU6NDcsIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOg0KPiBFWFRF
Uk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDE0LzA0LzIwMjAgMTI6MTM6
NDYrMDAwMCwgQ2xhdWRpdS5CZXpuZWFAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+DQo+Pg0KPj4g
T24gMTQuMDQuMjAyMCAxNDoxNiwgQWxleGFuZHJlIEJlbGxvbmkgd3JvdGU6DQo+Pj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4NCj4+PiBPbiAxNC8wNC8yMDIwIDA4OjQy
OjA4KzAwMDAsIENsYXVkaXUuQmV6bmVhQG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+Pj4+PiBXaHkg
d291bGQgb25lIHVzZSB0aGUgUlRUIHdoaWxlIHRoZSBSVEMgaXMgZmFyIHN1cGVyaW9yPw0KPj4+
Pg0KPj4+PiBJIGRpZG4ndCBlbmFibGVkIHRoaXMgZm9yIGEgcGFydGljdWxhciB1c2UgY2FzZSwg
YnV0OiBjb3VsZG4ndCB0aGlzIGJlIHVzZWQNCj4+Pj4gYnkgc29tZSB1c2VyIHRoYXQgd2FudHMg
dG8gZ2VuZXJhdGUgbXVsdGlwbGUgYWxhcm1zPyBmcm9tIG11bHRpcGxlIFJUQ3M/DQo+Pj4+DQo+
Pj4NCj4+PiBJIHZlcnkgbXVjaCBkb3VidCB0aGF0IGFzIExpbnV4IGlzIGFibGUgdG8gcHJvcGVy
bHkgbXVsdGlwbGV4IGFsYXJtcyBhbmQNCj4+PiBiYXNpY2FsbHksIHRoZSBvbmx5IG9uZSB3ZSBh
cmUgaW50ZXJlc3RlZCBpbiBpcyBhY3R1YWxseSB3YWtldXAuDQo+Pg0KPj4gSSB0aGluayB5b3Ug
Y2FuIHVzZSB0aGUgd2FrZWFsYXJtIHN5c2ZzIGV4cG9ydGVkIGZpbGUgdG8gcHJlcGFyZSBhbiBh
bGFybQ0KPj4gYW5kIHRha2UgdXNlciBzcGFjZSBhY3Rpb25zIGJhc2VkIG9uIHRoYXQgd2l0aG91
dCBiZWluZyBzdXNwZW5kZWQuDQo+Pg0KPj4+DQo+Pj4+IE1vcmVvdmVyLCB0aGlzIElQJ3MgY291
bnRlciBoYXMgdGhlIHBvc3NpYmlsaXR5IG9mIGJlaW5nIGNsb2NrZWQgYXQgMUh6Lg0KPj4+PiBD
b3VsZG4ndCB0aGlzIG1pbmltaXplIHRoZSBwb3dlciBjb25zdW1wdGlvbiB3aGlsZSBiZWluZyBp
biBhIHBvd2VyIHNhdmluZw0KPj4+PiBtb2RlPw0KPj4+Pg0KPj4+DQo+Pj4gQW5kIHRoYXQgMUh6
IGNsb2NrIGlzIGNvbWluZyBmcm9tIHRoZSBSVEMgc28gdXNpbmcgdGhlIFJUQyBpcw0KPj4+IGRl
ZmluaXRpdmVseSBjb25zdW1pbmcgbGVzcyBwb3dlci4NCj4+DQo+PiBEYXRhc2hlZXQgc3BlY2lm
aWVzIHRoaXM6ICJDb25maWd1cmluZyB0aGUgUlRQUkVTIGZpZWxkIHZhbHVlIHRvIDB4ODAwMA0K
Pj4gKGRlZmF1bHQgdmFsdWUpIGNvcnJlc3BvbmRzIHRvIGZlZWRpbmcgdGhlIHJlYWwtdGltZSBj
b3VudGVyIHdpdGggYQ0KPj4NCj4+IDFIeiBzaWduYWwgKGlmIHRoZSBzbG93IGNsb2NrIGlzIDMy
Ljc2OCBrSHopLiINCj4+DQo+PiBTbywgaXQgaXMgbm90IHRoZSBSVEMsIGl0IGlzIHRoZSBzbG93
IGNsb2NrIGRpdmlkZWQgYnkgMzI3NjguDQo+IA0KPiBUaGlzIGlzIG5vdCB3aGF0IHlvdSBkZXNj
cmliZWQgcHJldmlvdXNseSwNCg0KSSBzYWlkIHRoaXMgd2F5OiAidGhpcyAqSVAncyBjb3VudGVy
KiBoYXMgdGhlIHBvc3NpYmlsaXR5IG9mIGJlaW5nIGNsb2NrZWQgYXQgMUh6Ig0KDQo+IHVzaW5n
IFJUUFJFUyBtZWFucyBydW5uaW5nDQo+IHRoZSBSVFQgYXQgMzJrSHouIFRoaXMgaXMgZXhhY3Rs
eSB3aGF0IGhhcHBlbnMgd2l0aCB0aGUgUlRDIGJ1dCB5b3UgZ2V0DQo+IHRoZSBhZGRlZCBjbG9j
ayBjYWxpYnJhdGlvbiBjaXJjdWl0cnkgdGhhdCBpcyBwcm9iYWJseSBub3QgZHJhd2luZyB0bw0K
PiBtdWNoIHBvd2VyIGJ1dCB0aGUgYWRkZWQgY29uc3VtcHRpb24gb2YgdGhlIGNvbmZpZ3VyYWJs
ZSBwcmVzY2FsZXINCj4gdmVyc3VzIHRoZSBzdGF0aWMgcHJlc2NhbGVyIG9mIHRoZSBSVEMgaXMg
cHJvYmFibHkgc2ltaWxhci4NCj4gDQo+IFVzaW5nIFJUQzFIWiB3b3VsZCBiZSBkcml2aW5nIHRo
ZSBSVFQgYXQgMUh6Lg0KPiANCj4+PiBCdXQgdGhpcyBpcyB2ZXJ5IHVubGlrZWx5IHRvIGhhcHBl
biBiZWNhdXNlIHRoaXMgd291bGQgYmUgbGltaXRlZCB0byBhDQo+Pj4gc2luZ2xlIGJvYXJkIGRl
dmljZSB0cmVlIGluc3RlYWQgb2YgaW1wYWN0IGV2ZXJ5IHNhbTl4NjAgYmFzZWQgYm9hcmRzLg0K
Pj4NCj4+IFZlcnkgdW5saWtlbHkgYnV0IGEgaGF2aW5nIGEgcGF0Y2ggd2l0aCBkaWZmIGxpa2Ug
dGhpczoNCj4+DQo+PiArJmdwYnIgew0KPj4gKyAgICAgc3RhdHVzID0gIm9rYXkiOw0KPj4gK307
DQo+PiArDQo+PiArJnJ0dCB7DQo+PiArICAgICBhdG1lbCxydHQtcnRjLXRpbWUtcmVnID0gPCZn
cGJyIDB4MD47DQo+PiArICAgICBzdGF0dXMgPSAib2theSI7DQo+PiArfTsNCj4+ICsNCj4+DQo+
PiBhbmQgcmV2ZXJ0aW5nIGl0IG1heSBhZmZlY3QgdGhlIG90aGVyIHVzZXJzIG9mIGdwYnIgaW4g
c2FtOXg2MGVrLmR0cy4NCj4+DQo+IA0KPiBBZ2FpbiwgdGhpcyBhZmZlY3RzIG9ubHkgc2FtOXg2
MGVrLmR0cyBpbnN0ZWFkIG9mIHBvc3NpYmx5IG11bHRpcGxlIERUcw0KPiB0aGF0IG1heSBiZSBv
dXQgb2YgdHJlZS4gU28gdGhlIHJpc2sgb2YgZG9pbmcgdGhhdCBpcyBudWxsLg0KDQpBbnl3YXku
Li4gSSdsbCBtZXJnZSBpdCBhbHRob3VnaCBJIGRvbid0IGNvbnNpZGVyIGlzIHRoZSByaWdodCB3
YXkuDQoNCj4gDQo+IC0tDQo+IEFsZXhhbmRyZSBCZWxsb25pLCBCb290bGluDQo+IEVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KPiA=
