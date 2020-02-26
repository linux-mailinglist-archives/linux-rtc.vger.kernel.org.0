Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36C9416F6DC
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Feb 2020 06:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgBZFNa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 26 Feb 2020 00:13:30 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:4187 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726039AbgBZFN3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 26 Feb 2020 00:13:29 -0500
X-UUID: 12206ccd667041b4ae20f85616851813-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WprY2p001dM2lLokmS7+bS79wDilKJUSlHK85cBS7ig=;
        b=uxMqceHw05cgwKT2tbXaR9LHSAu7uJnWSBEpLYbh2hdhaSxDQBSGOwMyBHCWPdg2LBVsLc2TOI+Hgwn83MSzvBaypNcm/jGIvJQBSosiIHQxodqS30FFapcMYBpqMCdUXzcBXbK7ZV8U8+Ddi+wXsJxI6tGIuM9H1+PcZRYSHT8=;
X-UUID: 12206ccd667041b4ae20f85616851813-20200226
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 973990666; Wed, 26 Feb 2020 13:13:22 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 13:12:28 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 13:13:28 +0800
From:   Ran Bi <ran.bi@mediatek.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, YT Shen <yt.shen@mediatek.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Flora Fu <flora.fu@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Ran Bi <ran.bi@mediatek.com>
Subject: [PATCH v3 4/4] MAINTAINERS: add MT2712 RTC files
Date:   Wed, 26 Feb 2020 13:13:03 +0800
Message-ID: <20200226051303.22560-5-ran.bi@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200226051303.22560-1-ran.bi@mediatek.com>
References: <20200226051303.22560-1-ran.bi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

VGhpcyBwYXRjaCBhZGQgTVQyNzEyIFJUQyByZWxhdGVkIGZpbGVzIHRvIE1BSU5UQUlORVJTIGZp
bGUuDQoNClNpZ25lZC1vZmYtYnk6IFJhbiBCaSA8cmFuLmJpQG1lZGlhdGVrLmNvbT4NCi0tLQ0K
IE1BSU5UQUlORVJTIHwgMiArKw0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCg0K
ZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCmluZGV4IDM4ZmUyZjNmN2I2
Zi4uNTc1NDkzNTZlNzMxIDEwMDY0NA0KLS0tIGEvTUFJTlRBSU5FUlMNCisrKyBiL01BSU5UQUlO
RVJTDQpAQCAtMTk5NSw3ICsxOTk1LDkgQEAgTToJU2VhbiBXYW5nIDxzZWFuLndhbmdAbWVkaWF0
ZWsuY29tPg0KIEw6CWxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyAobW9kZXJh
dGVkIGZvciBub24tc3Vic2NyaWJlcnMpDQogTDoJbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZyAobW9kZXJhdGVkIGZvciBub24tc3Vic2NyaWJlcnMpDQogUzoJTWFpbnRhaW5lZA0K
K0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvcnRjLW10MjcxMi50eHQN
CiBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3J0Yy1tdDc2MjIudHh0
DQorRjoJZHJpdmVycy9ydGMvcnRjLW10MjcxMi5jDQogRjoJZHJpdmVycy9ydGMvcnRjLW10NjM5
Ny5jDQogRjoJZHJpdmVycy9ydGMvcnRjLW10NzYyMi5jDQogDQotLSANCjIuMjUuMA0K

