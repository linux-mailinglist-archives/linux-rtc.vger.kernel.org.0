Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBB116F6D7
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Feb 2020 06:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgBZFNW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 26 Feb 2020 00:13:22 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:48978 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725916AbgBZFNW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 26 Feb 2020 00:13:22 -0500
X-UUID: 14a6cc90935f4960be21464cd42aca6a-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zQlE2usdlA26fIgGZ8VA3Rg8HgO4JQf85Qybm0aGcvc=;
        b=MytdM1rlagzbSzh8qfpkNv+p/kUuU0YCtLipYDMhSf6O2IZ3VDgFywiEQAMDivoOXyzexUIOJB3a93FpsEPU5+ud2kWnZpbMj1EmwKEwSdKgKKLTz5teZLmo2cfWotlTeRVW4GYEoN6wbYO448UuZDGDQ+n78f+pibGzs6TpNzw=;
X-UUID: 14a6cc90935f4960be21464cd42aca6a-20200226
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <ran.bi@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1869821541; Wed, 26 Feb 2020 13:13:18 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 13:11:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 13:13:24 +0800
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
Subject: [PATCH v3 1/4] bindings: rtc: add bindings for MT2712 RTC
Date:   Wed, 26 Feb 2020 13:13:00 +0800
Message-ID: <20200226051303.22560-2-ran.bi@mediatek.com>
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

RG9jdW1lbnQgdGhlIGJpbmRpbmcgZm9yIE1UMjcxMiBSVEMgaW1wbGVtZW50ZWQgYnkgcnRjLW10
MjcxMi4NCg0KUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQpTaWdu
ZWQtb2ZmLWJ5OiBSYW4gQmkgPHJhbi5iaUBtZWRpYXRlay5jb20+DQotLS0NCiAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9ydGMvcnRjLW10MjcxMi50eHQgICAgICAgICB8IDE0ICsrKysrKysrKysr
KysrDQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9ydGMtbXQyNzEyLnR4dA0K
DQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9ydGMt
bXQyNzEyLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvcnRjLW10
MjcxMi50eHQNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAuLmMzM2Q4
N2U1ZTc1Mw0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3J0Yy9ydGMtbXQyNzEyLnR4dA0KQEAgLTAsMCArMSwxNCBAQA0KK0RldmljZS1UcmVl
IGJpbmRpbmdzIGZvciBNZWRpYVRlayBTb0MgYmFzZWQgUlRDDQorDQorUmVxdWlyZWQgcHJvcGVy
dGllczoNCistIGNvbXBhdGlibGUJICAgIDogU2hvdWxkIGJlICJtZWRpYXRlayxtdDI3MTItcnRj
IiA6IGZvciBNVDI3MTIgU29DDQorLSByZWcgCQkgICAgOiBTcGVjaWZpZXMgYmFzZSBwaHlzaWNh
bCBhZGRyZXNzIGFuZCBzaXplIG9mIHRoZSByZWdpc3RlcnM7DQorLSBpbnRlcnJ1cHRzCSAgICA6
IFNob3VsZCBjb250YWluIHRoZSBpbnRlcnJ1cHQgZm9yIFJUQyBhbGFybTsNCisNCitFeGFtcGxl
Og0KKw0KK3J0YzogcnRjQDEwMDExMDAwIHsNCisJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3
MTItcnRjIjsNCisJcmVnID0gPDAgMHgxMDAxMTAwMCAwIDB4MTAwMD47DQorCWludGVycnVwdHMg
PSA8R0lDX1NQSSAyMzkgSVJRX1RZUEVfTEVWRUxfTE9XPjsNCit9Ow0KLS0gDQoyLjI1LjANCg==

