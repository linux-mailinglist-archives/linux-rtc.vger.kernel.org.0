Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E85339301
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Mar 2021 17:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232009AbhCLQUo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 12 Mar 2021 11:20:44 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:52162 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230302AbhCLQUj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 12 Mar 2021 11:20:39 -0500
X-UUID: 172eed7caacc41d69545d2aff34b1179-20210313
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=63lLgyhShcz7hBrpoA+jQ3pPfygS4j51tNuMwt/5+Hk=;
        b=R/+d07dxKnfShHwEMfyGFND/Q4EzY2Kb+4zGeLRJ4BcrCrk5/gWTVp3uWnmjG1IZuFICN4obx14YNvZbtdqzv3qrQoFcAmgJnx8iwg4LiI91HSl07hzKyarhOvOm/e4rPZprGNQvxv8VQSorjQoPzEj9PsjwbdzgXK1a+3+OQh4=;
X-UUID: 172eed7caacc41d69545d2aff34b1179-20210313
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2122130386; Sat, 13 Mar 2021 00:20:36 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 13 Mar 2021 00:20:34 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 13 Mar 2021 00:20:34 +0800
Message-ID: <1615566034.27101.5.camel@mtksdaap41>
Subject: Re: [PATCH RESEND v5 7/8] regulator: mt6359: Add support for
 MT6359P regulator
From:   Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Lee Jones <lee.jones@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
        Fei Shao <fshao@chromium.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Yuchen Huang <yuchen.huang@mediatek.com>,
        Ran Bi <ran.bi@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <srv_heupstream@mediatek.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Sat, 13 Mar 2021 00:20:34 +0800
In-Reply-To: <20210301102156.GJ641347@dell>
References: <1611913781-23460-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1611913781-23460-8-git-send-email-hsin-hsiung.wang@mediatek.com>
         <20210301102156.GJ641347@dell>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 720C1621FB1260E7C53FD91671EB4931ED0AA89ED611D0A41887A4B6E089299B2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gTW9uLCAyMDIxLTAzLTAxIGF0IDEwOjIxICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6DQo+IE9u
IEZyaSwgMjkgSmFuIDIwMjEsIEhzaW4tSHNpdW5nIFdhbmcgd3JvdGU6DQo+IA0KPiA+IFRoZSBN
VDYzNTlQIGlzIGEgZWNvIHZlcnNpb24gZm9yIE1UNjM1OSByZWd1bGF0b3IuDQo+ID4gV2UgYWRk
IHN1cHBvcnQgYmFzZWQgb24gTVQ2MzU5IHJlZ3VsYXRvciBkcml2ZXIuDQo+ID4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogSHNpbi1Ic2l1bmcgV2FuZyA8aHNpbi1oc2l1bmcud2FuZ0BtZWRpYXRlay5j
b20+DQo+ID4gLS0tDQo+ID4gY2hhbmdlcyBzaW5jZSB2NDoNCj4gPiAtIGFkZCB0aGUgcmVndWxh
dG9yc19ub2RlIHN1cHBvcnQuDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvcmVndWxhdG9yL210NjM1
OS1yZWd1bGF0b3IuYyAgICAgICB8IDM3OSArKysrKysrKysrKysrKysrKysrKy0NCj4gDQo+ID4g
IGluY2x1ZGUvbGludXgvbWZkL210NjM1OXAvcmVnaXN0ZXJzLmggICAgICB8IDI0OSArKysrKysr
KysrKysrKw0KPiANCj4gQWx0aG91Z2ggdGhlIGNvZGUgaXMgZmluZSwganVzdCBiZSBhd2FyZSB0
aGF0IExpbnVzIGNhbiBnZXQgZ3J1bXB5DQo+IGhhdmluZyAxMDBzIGFuZCAxMDBzIG9mIHVudXNl
ZCByZWdpc3RlciBkZWZpbmVzIGluIHRoZSBrZXJuZWwuDQo+IA0KDQpUaGFua3MgZm9yIHRoZSBj
b21tZW50LiBXZSB3aWxsIG11bGwgaXQgb3Zlci4NCg0KPiA+ICBpbmNsdWRlL2xpbnV4L3JlZ3Vs
YXRvci9tdDYzNTktcmVndWxhdG9yLmggfCAgIDEgKw0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDYy
MyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
aW5jbHVkZS9saW51eC9tZmQvbXQ2MzU5cC9yZWdpc3RlcnMuaA0KPiANCg0K

