Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3786A2DDCC8
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Dec 2020 03:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732197AbgLRCFM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Dec 2020 21:05:12 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:57940 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732022AbgLRCFL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 17 Dec 2020 21:05:11 -0500
X-UUID: 18b6315d63be4baf87fa6c8dd2e5c4de-20201218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=btKOFCjUWo3s6zdtgsKjM1Zw8f6bJKkVDG52Ni7VSlY=;
        b=WkEUJKDpRKq2KOhzjDXU/30tihqZRWQET3WMc8pJ8HIrAsaiP0cnUBhYKwj+m37Seexl90G5zmXkWMQV/6NIVCq8u+2/5rWx3ZlxZ/xzth51hKKSMj87/WWcB0txYF+8ERJyZfqSeQD188UgrlxBHpeSeFrt1jCyTCFdTEOgFBg=;
X-UUID: 18b6315d63be4baf87fa6c8dd2e5c4de-20201218
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1796678214; Fri, 18 Dec 2020 10:04:26 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Dec 2020 10:04:21 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Dec 2020 10:04:24 +0800
Message-ID: <1608257065.9000.3.camel@mtksdaap41>
Subject: Re: [PATCH v4 3/9] dt-bindings: mfd: Add compatible for the
 MediaTek MT6359 PMIC
From:   Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-mediatek@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Ran Bi <ran.bi@mediatek.com>,
        <srv_heupstream@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Yuchen Huang <yuchen.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        "Alessandro Zummo" <a.zummo@towertech.it>,
        Lee Jones <lee.jones@linaro.org>,
        Fei Shao <fshao@chromium.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Mark Brown <broonie@kernel.org>
Date:   Fri, 18 Dec 2020 10:04:25 +0800
In-Reply-To: <20201217192818.GA101889@robh.at.kernel.org>
References: <1608104827-7937-1-git-send-email-hsin-hsiung.wang@mediatek.com>
         <1608104827-7937-4-git-send-email-hsin-hsiung.wang@mediatek.com>
         <20201217192818.GA101889@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGksDQoNCk9uIFRodSwgMjAyMC0xMi0xNyBhdCAxMzoyOCAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6DQo+IE9uIFdlZCwgMTYgRGVjIDIwMjAgMTU6NDc6MDEgKzA4MDAsIEhzaW4tSHNpdW5nIFdh
bmcgd3JvdGU6DQo+ID4gVGhpcyBhZGRzIGNvbXBhdGlibGUgZm9yIHRoZSBNZWRpYVRlayBNVDYz
NTkgUE1JQy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBIc2luLUhzaXVuZyBXYW5nIDxoc2lu
LWhzaXVuZy53YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9tdDYzOTcudHh0IHwgNyArKysrKystDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gDQo+IA0K
PiBQbGVhc2UgYWRkIEFja2VkLWJ5L1Jldmlld2VkLWJ5IHRhZ3Mgd2hlbiBwb3N0aW5nIG5ldyB2
ZXJzaW9ucy4gSG93ZXZlciwNCj4gdGhlcmUncyBubyBuZWVkIHRvIHJlcG9zdCBwYXRjaGVzICpv
bmx5KiB0byBhZGQgdGhlIHRhZ3MuIFRoZSB1cHN0cmVhbQ0KPiBtYWludGFpbmVyIHdpbGwgZG8g
dGhhdCBmb3IgYWNrcyByZWNlaXZlZCBvbiB0aGUgdmVyc2lvbiB0aGV5IGFwcGx5Lg0KPiANCj4g
SWYgYSB0YWcgd2FzIG5vdCBhZGRlZCBvbiBwdXJwb3NlLCBwbGVhc2Ugc3RhdGUgd2h5IGFuZCB3
aGF0IGNoYW5nZWQuDQo+IA0KU29ycnksIHRoZSB0YWcgZGlzYXBwZWFyZWQgYmVjYXVzZSBvZiB0
aGUgY2hhbmdlIG9mIHJ0YyBjb21wYXRpYmxlIG5hbWUuDQpJIHdpbGwgbGlzdCB0aGUgY2hhbmdl
IGluIHRoZSBlYWNoIHBhdGNoIGZvciB0aGUgbmV4dCB1cGRhdGUuDQpUaGFua3MgZm9yIHlvdXIg
cmV2aWV3Lg0K

